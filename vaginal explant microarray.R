#Started 13Nov15 CL

require(dplyr)
require(lumi)
require(limma)

?#############READ IN RAW MICROARRAY DATA FINAL REPORT ###########
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

############### TARGETS AND DESIGN MATRIX ###################
# see section 9.4.1 and 9.4.2 in the limma users guide

targets<-pData(expressedProbes.lumi)%>%
  select(TissueID, Treatment,Time)
TissueID<- factor(targets$TissueID)
Treat <-factor(paste(targets$Treatment,targets$Time, sep="."))

design<-model.matrix (~0+Treat+TissueID)

####################### FIT MODEL TO PROBES ###################
fit <- lmFit(expressedProbes.lumi,design=design)


#Now we can make any comparisons
#between the experimental conditions

# If topTable is called and coef has two or more elements,
# then the specified columns will be extracted from fit and
# topTableF called on the result. topTable with coef=NULL is 
# the same as topTableF, unless the fitted model fit has only
# one column.

bothcm<-makeContrasts(
  V186.3vsMock.3 = TreatV186.3-TreatMock.3,
  V186.8vsMock.8 = TreatV186.3-TreatMock.8,
  V186.24vsMock.24 = TreatV186.24-TreatMock.24,
  SD90.3vsMock.3 = TreatSD90.3-TreatMock.3,
  SD90.8vsMock.8 = TreatSD90.8-TreatMock.8,
  SD90.24vsMock.24 = TreatSD90.24-TreatMock.24,
  levels=design
)

V186cm<-makeContrasts(
  V186.3vsMock.3 = TreatV186.3-TreatMock.3,
  V186.8vsMock.8 = TreatV186.3-TreatMock.8,
  V186.24vsMock.24 = TreatV186.24-TreatMock.24,
  levels = design
)

SD90cm<-makeContrasts(
  SD90.3vsMock.3 = TreatSD90.3-TreatMock.3,
  SD90.8vsMock.8 = TreatSD90.8-TreatMock.8,
  SD90.24vsMock.24 = TreatSD90.24-TreatMock.24,
  levels=design)

#put the contrasts matrices into a list

cmList<-list(bothcm,V186cm,SD90cm)

#fit the contrasts    
fit2<-lapply(cmList,FUN=contrasts.fit, fit=fit)

#compute diff exprsn
fit2 <-lapply(fit2, FUN=eBayes)


#generate toptable, showing results for ALL PROBES
ttList<-lapply(fit2,FUN=topTable, number=Inf)

#make the probeID a real column
#function to make rownames a real column in the top tables
#and merge the symbols from feature data with the toptables

#fist get the symbol data from the featureData in RAW.lumi
ProbeIDandSymbol<-fData(RAW.lumi)[,c(1,7)]

addSymbols<-function(tTable){
tTable$ProbeID<-rownames(tTable)
rownames(tTable)<-NULL
x<-merge(ProbeIDandSymbol,tTable, by="ProbeID")
return(x)
}

#make a list of the what the ttables are showing

AnalysisList<-list("Both viruses","V186","SD90")

#apply the function over the list of toptables
ttListSymbols<-lapply(ttList,addSymbols)


#add a column to each tt saying what it is showing
ttListSymbols<-mapply(cbind,ttListSymbols, Analysis=AnalysisList)

#filter the top tables to just show probes where adj.p.val is <=0.05
filterttListSymbols<-lapply(ttListSymbols,FUN=filter, adj.P.Val<=0.05)


#how many probes are there with p<=0.05?
lapply(filterttListSymbols, FUN=nrow)



library(reshape2)
x<-lapply(ttListSymbols,FUN=select,ProbeID, SYMBOL,adj.P.Val,
          Analysis)


#adjusts down genes and then across contrasts
results<-decideTests(fit2[[2]],method="hierarchical", adjust.method="BH",
                     p.value=0.05, lfc=0)

#separate is same as doing topTable for all coefs separately
results2<-decideTests(fit2[[2]],method="separate", adjust.method="BH",
                      p.value=0.05, lfc=0)

#global treats entire matrix of t-statistics as a single 
#vector of unrelated tests 
results3<-decideTests(fit2[[2]],method="global", adjust.method="BH",
                      p.value=0.05, lfc=0)
vennDiagram(results)

vennDiagram(results2)

vennDiagram(results3)
