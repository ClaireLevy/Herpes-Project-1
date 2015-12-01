#Started 13Nov15 CL

require(dplyr)
require(lumi)
require(limma)

#############READ IN RAW MICROARRAY DATA FINAL REPORT ###########
#data from shared resources

RAW<-"J:/MacLabUsers/HLADIK SHARED/Projects/Herpes study/Herpes-Project-1/Illumina/2015_11_10/GenomeStudioProject/SeanHughes_HumanHT12v4_151112/2015.11.12smhughesFinalReport.txt"

RAW.lumi<-lumiR(RAW,detectionTh = 0.05, na.rm = TRUE,convertNuID = FALSE, dec = '.',
                parseColumnName = FALSE, checkDupId = FALSE,
                QC = TRUE,
                columnNameGrepPattern = list(exprs='AVG_SIGNAL',
                                                       se.exprs='BEAD_STDERR',
                                                       detection='Detection Pval',
                                                       beadNum='Avg_NBEADS'),
                inputAnnotation=TRUE,
                annotationColumn=c('ILMN_GENE', 'ENTREZ_GENE_ID', 'GI', 'ACCESSION', 'SYMBOL', 'PROBE_ID', 'PROBE_START', 'PROBE_SEQUENCE', 'CHROMOSOME', 'PROBE_CHR_ORIENTATION', 'PROBE_COORDINATES'),
                verbose = TRUE)

load("RAW.lumi.Rdata")

##########################EXPERIMENT NOTES ###########################
#6 samples failed when the microarray was run 6,33,34,35,45,63
#and two failed QC (36,64). The failed were left out of the finalReport file
#that we got from shared resources and we will leave all 8 out
#of the analysis too.

#ALSO

#The first 5 samples in the micrarray data are T cells that 
#were exposed to Tenofovir. These will be analyzed separately and
#can be separated from the vaginal explant data.
###################################################################


################## SUBSETTING THE LUMIBATCH ######################

#subset the lumibatch to remove the non-explant data AND the two samples
#that were left in the finalReport but failed the QC
RAW.lumi<-RAW.lumi[,-c(1:5,32,58)]#32 and 58 are the indices for
#samples "36" and "64"

#read in phenoData (does NOT include any phenoData for non-explant samples)

pData<- read.table("explantMicroarrayPhenoData.txt",
                       sep="\t",row.names=1, header=TRUE)




#make the rownames character(they are numbers, but are actually
#sample names and lumi has them as character)

rownames(pData)<-as.character(rownames(pData))
pData$TissueID<-as.character(pData$TissueID)
pData$Time <- as.character(pData$Time)


#need to remove phenodata for the samples that failed. The rownames
#start at 7 (1-6 were the tenofovir samples). So the sampleNames are now
#6 ahead of the the row numbers (sample 33 is in the 27th row of data)
# missing samples 33=ID326 T1 M D1
#34=ID 326 T2 V1 D1
#35=ID 326 T3 V2 D1
#36 ID 317 T2 M D1
#45 ID 318 T3 V1 D1
#63 ID 327 T2 V1 D1
#64 ID 319 T2 M D1

#make a vector of rownames I want to remove
toExclude<-c("33","34","35","36","45","63","64")

#to get the indices of the rownames that I want to remove:
#>which(rownames(pData)%in% toExclude)

#and then remove those indices from pData

pData<-pData[-which(rownames(pData)%in% toExclude),]



#create metadata df
metadata<- data.frame(labelDescription = c("Tissue,Time,Virus,Dose. Dose is same for all.",
                                           "PTID","Sampling Time","Virus: V1=strain SD90, V2=strain 186, M=Mock", "Treatment:either a virus strain or Mock.",
                                           "Location of original RNA on 96well plate"),
                      row.names=c("DescriptiveSampleID","TissueID","Time","Dose","Treatment","PlateID"))


#combine metadata and pdata into an annotated df
adf<-new("AnnotatedDataFrame",data=pData,varMetadata=metadata)

#create experiment data
experimentData<-new("MIAME",name="Claire Levy",
                    lab="Florian Hladik Lab",title="Vaginal Explant Microarray")


#make a lumiBatch that contains both the raw data we got from
#shared resources AND the phenoData, metadata and experiment data
#that I created MINUS the tenofovir data and the failed samples.

complete.RAW.lumi<-new("LumiBatch", exprs=exprs(RAW.lumi),phenoData=adf,
                  experimentData=experimentData,
                  se.exprs=se.exprs(RAW.lumi),
                  detection=detection(RAW.lumi))

save(complete.RAW.lumi,file="complete.RAW.lumi.Rdata")

######### SOME PLOTS OF NON NORMALIZED DATA ############

#density plot
density(complete.RAW.lumi)#number of probes for each sample that occur
#at a certain log2 intensity

#CDF plot: cumulative probability of having <= a certain log2 intensity
plotCDF(complete.RAW.lumi)

#sample relations
plot(complete.RAW.lumi, what='sampleRelation',method="mds")

#boxplot
boxplot(complete.RAW.lumi)
###################BACKGROUND CORRECTION ###########################
#the data we got from the core had no background correction so I will do it here

B.complete.RAW.lumi<-lumiB(complete.RAW.lumi)


#################### VST TRANSFORMATION ######################
#"Stabilizing the expression variance based on
#the bead level expression variance and mean relations"

TB.complete.RAW.lumi <-lumiT (B.complete.RAW.lumi)

################## ROBUST SPLINE NORMALIZATION ################

NTB.complete.RAW.lumi<-lumiN(TB.complete.RAW.lumi,method="rsn")

################# QUALITY CONTROL ############################

QNTB.complete.RAW.lumi <- lumiQ(NTB.complete.RAW.lumi,detectionTh=0.05)
summary(QNTB.complete.RAW.lumi, "QC")

save(QNTB.complete.RAW.lumi, file = "QNTB.complete.RAW.lumi.Rdata")

################ PLOTS OF NORMALIZED DATA ###############

plot(QNTB.complete.RAW.lumi)

plot(QNTB.complete.RAW.lumi, what='sampleRelation',method="mds")

boxplot(QNTB.complete.RAW.lumi)


################# FILTERING PROBES BASED ON DETECTION ##################

# Limma suggest to keep probes that are expressed above bg on 
#at least n arrays where n is smallest number of replicates assigned
#to any of the treatment combinations.

#Our treatment combinations are TissueID/Treatment/Time
#We have 7 Tissue IDs x 3 Treatments x 3 time points=63 so the smallest number
# of replicates possible for any of those 63 arrays is 7??

#TODO
#How do we deal with the fact that 3 of our missing samples
# are from the same tissueID?
#33=ID326 T1 M D1
#34=ID 326 T2 V1 D1
#35=ID 326 T3 V2 D1

#this is how the detection filtering works
#Mark the detection pvalues (there is one per probe per sample) with a 1 if <0.05 or a 0 if >0.05
# using (detection(QNTB.complete.RAW.lumi)<0.05)

#add up the 0's and 1's across each row (i.e. for all the samples)
#using rowSums

#now you have the number of detection p values <0.05 for each probe
#for all the samples (max possible = total samples)

#now tell me which probes have a rowSum of >=7 (probes will be marked as TRUE
# or false if they do or do not have >=7 rowSum)
            
detectedProbes <- rowSums(detection(QNTB.complete.RAW.lumi)<0.05)>=7

#now extract just those probes that are TRUE from the lumibatch

expressedProbes.lumi <-QNTB.complete.RAW.lumi[detectedProbes,]

#how many probes did we have before filtering?
dims(QNTB.complete.RAW.lumi)#47323

dims(expressedProbes.lumi)#21726

#how many removed?
dims(QNTB.complete.RAW.lumi)-dims(expressedProbes.lumi)#20192

save(expressedProbes.lumi, file="expressedProbes.lumi.Rdata")



############### SPLIT DATA INTO GROUPS BY COLLECTION TIME #########
#We want to analyze the data separately for each collection time
#so I will split the expression data (exprs()) into groups by time

T1Data<-exprs(expressedProbes.lumi[,expressedProbes.lumi$Time=="3"])
T2Data<-exprs(expressedProbes.lumi[,expressedProbes.lumi$Time =="8"])
T3Data<-exprs(expressedProbes.lumi[,expressedProbes.lumi$Time =="24"])

exprsDataList<-list(T1Data,T2Data,T3Data)

############## TARGETS AND DESIGN MATRIX ###########################
#use phenoData to make a targets frame with columns for TissueID and 
# Virus for each time point (since we are missing samples, it is different
#for each one)

library(dplyr)
library(limma)

targets<-data.frame("TissueID"= expressedProbes.lumi$TissueID,
                    "Treatment"=expressedProbes.lumi$Treatment,
                    "Time"=expressedProbes.lumi$Time)

#make a different targets DF for each time point
targets1<-targets %>%
  filter(Time==3)%>%
  select(-Time)

targets2<-targets %>%
  filter(Time==8)%>%
  select(-Time)

targets3<-targets %>%
  filter(Time==24)%>%
  select(-Time)

#make the targets DFs into a list for lapply-ing later
targetList<-list(targets1,targets2,targets3)
save(targetList, file="targetList.Rdata")

#function for getting the factors of the treatments for each
#timepoint


factorTreatments<-function(targetDf)
  factor(targetDf$Treatment, levels=c("Mock","SD90","V186"))

Treatments<-lapply(targetList,FUN=factorTreatments)

factorTissueID<-function(targetDf)
  factor(targetDf$TissueID)

TissueIDs<-lapply(targetList,FUN=factorTissueID)

save(Treatments, file="Treatments.Rdata")
save(TissueIDs, file="TissueIDs.Rdata")

#function to make the design matrix for each timepoint

#because we want to pair with mock, set it as intercept????
makeDesign<-function(Treatments, TissueIDs)
  model.matrix(~Treatments+TissueIDs)

#list of design matrices to use for fitting the model
designList<-mapply(Treatments,TissueIDs,FUN=makeDesign)

save(designList, file = "designList.Rdata")
######################## FITTING MODELS #######################

library(limma)
#fit linear models for each probe separately for the data
#from each timepoint using the appropriate design matrix made above.

#use mapply when you want to use 2 lists as the input for an
#apply function, function is applied to first element of each, then
#second..
fit<-mapply(exprsDataList,designList,FUN=lmFit)


#make a contrast matrix specifying the contrasts of interest
#Do I really need to do this if I am interested in all contrasts?

#contrast.matrix<-makeContrasts(TreatmentV186-TreatmentMock, 
#                                TreatmentSD90-TreatmentMock,
#                                TreatmentV186-TreatmentSD90,
#                                levels = c("TreatmentV186","TreatmentSD90",
#                                           "TreatmentMock"))

#given the model fit above, estimate coefficients for 
#the specified contrasts. Why do you need to fit the original model
#first? (fit)
#fit2<- lapply(fit, FUN=contrasts.fit,contrast.matrix)

#compute differential expression statistics
fit<-lapply(fit,FUN=eBayes)

lapply(fit,FUN=topTable,coef=1,adjust="BH")

#generate top table of differentially expressed probes
topTable(fit[[3]],coef="TreatmentsV186",adjust="BH")


