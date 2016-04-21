### Herpes-Project-1 "Project 1: Incident HSV-2 and genital health in Kenyan adolescent girls: an inception cohort"

###Project outline
  Vaginal Explant Enfection Experiment
  
  We infected vaginal biopsy explants from 7 donors with two strains of HSV-2 (SD90 from David Knipe's lab and V186 from David Koelle's lab). We also did a Mock infection on an explant from each donor. In the code, these treatments are referred to as SD90, V186 and Mock. Donors are identified by a unique 3 digit TissueID.
  
  RNA isolation
  
  RNA was isolated from the explants at 3 timepoints after infection: 3 hours, 8 hours and 24 hours. In the code, results from treatment and timepoint conditions are specified as `treatment.timepoint` (ex. V186.3 is the V186 treatment at the 3hr post infection timepoint).
  
  Virus Dose
  
  Explant samples were infected with 2 different doses of virus; D1 and D2 (D1 = 5 x 10^7 PFU, D2 = 5 x 10^5). RNA was only extracted from the samples infected with the higher (D1 = 5 x 10^7) dose, and consequently, data from these samples are the only ones on the microarray.
  
  We used the Qiagen RNeasy fibrous tissue kit to extract and purify the RNA. We used the NuGEN Ovation PicoSL WTA System V2 to make and amplify cDNA and the NuGEN Encore BiotinIL Module to label the cDNA with biotin. The samples were sent to the FHCRC genomics core facility to be spotted on Illumina Human HT12 v4 beadchip arrays. Samples (one sample is a single TissueID x Treatment x Timepoint) were named with random numbers from 6-69. 

Human Vaginal Epithelial Cells infection experiment

A companion study using the same viruses and timepoints but with immortalized lines of primary vaginal epithelial cells from three donors (HVE 1, HVE 3, HVE 4) was also done, prior to the explant experiment. It was originally analyzed by different methods, but I reanalyzed it using the same methods as for the explants, starting from the the raw microarray data that Lamar Fleming got from the FHCRC core services. 

Virus dose

For this study, (epithelial cells ony) the 0.1 MOI was 800,000 PFU per flask.

#Package verions
`SessionInfo()` is at the end of the markdown file


#Workflow
* lumi: read in raw data, background correct, VST transform, robust spline normalize, QC, 
* filter by detection p values
* limma: create model matrix and contrasts matrix, fit models to probes.
* InnateDB GO and Pathway overrepresentation anaylses
* CAMERA gene set testing
