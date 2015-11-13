#Started 13Nov15 CL

require(dplyr)
require(lumi)
require(limma)

#read in raw data microarray  final report
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

save(RAW.lumi, file="RAW.lumi.Rdata")

##########################EXPERIMENT NOTES ###########################
#6 samples failed when the microarray was run. Their microarray ids
#were 6,33,34,35,45,65. They were left out of the finalReport file
#that we got from shared resources and we will leave them out of the analysis.
#I will remove them from the phenoData for this analysis too.

#The first 5 samples in the micrarray data are T cells that 
#were exposed to Tenofovir. These will be analyzed separately and
#can be separated from the vaginal explant data.
###################################################################

#subset the lumibatch to remove the non-explant data
RAW.lumi<-RAW.lumi[,-c(1:5)]

#read in phenoData (does NOT include any phenoData for non-explant samples)

pData<- read.table("explantMicroarrayPhenoData.txt",
                       sep="\t",row.names=1, header=TRUE)




#make the rownames character(they are numbers, but are actually
#sample names and lumi has them as character)

rownames(pData)<-as.character(rownames(pData))


#need to remove phenodata for the samples that failed. The rownames
#start at 7 (1-6 were the tenofovir samples). So the sampleNames are now
#6 ahead of the the row numbers (sample 33 is in the 27th row of data)

#make a vector of rownames I want to remove
toExclude<-c("33","34","35","45","63")

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

RAW.lumi.all<-new("LumiBatch", exprs=exprs(RAW.lumi),phenoData=adf,
                  experimentData=experimentData,
                  se.exprs=se.exprs(RAW.lumi),
                  detection=detection(RAW.lumi))

save(RAW.lumi.all,file="RAW.lumi.all.Rdata")

#plot the density
plotCDF(RAW.lumi.all,reverse=TRUE)




