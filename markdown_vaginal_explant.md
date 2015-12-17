"Vaginal explant herpes infection experiment"

    ## Inputting the data ...
    ## Perform Quality Control assessment of the LumiBatch object ...

EXPERIMENT NOTES 6 samples failed when the microarray was run 6,33,34,35,45,63 and two failed QC (36,64). The failed were left out of the finalReport filethat we got from shared resources and we will leave all 8 out of the analysis too.

ALSO

The first 5 samples in the micrarray data are T cells that were exposed to Tenofovir. These will be analyzed separately and can be separated from the vaginal explant data.

SOME PLOTS OF NON NORMALIZED DATA: density plot, cdf plot ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-3-1.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-3-2.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-3-3.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-3-4.png)

    ## Perform vst transformation ...
    ## 2015-12-17 15:07:59 , processing array  1 
    ## 2015-12-17 15:07:59 , processing array  2 
    ## 2015-12-17 15:07:59 , processing array  3 
    ## 2015-12-17 15:07:59 , processing array  4 
    ## 2015-12-17 15:07:59 , processing array  5 
    ## 2015-12-17 15:07:59 , processing array  6 
    ## 2015-12-17 15:07:59 , processing array  7 
    ## 2015-12-17 15:07:59 , processing array  8 
    ## 2015-12-17 15:08:00 , processing array  9 
    ## 2015-12-17 15:08:00 , processing array  10 
    ## 2015-12-17 15:08:00 , processing array  11 
    ## 2015-12-17 15:08:00 , processing array  12 
    ## 2015-12-17 15:08:00 , processing array  13 
    ## 2015-12-17 15:08:00 , processing array  14 
    ## 2015-12-17 15:08:00 , processing array  15 
    ## 2015-12-17 15:08:00 , processing array  16 
    ## 2015-12-17 15:08:00 , processing array  17 
    ## 2015-12-17 15:08:00 , processing array  18 
    ## 2015-12-17 15:08:00 , processing array  19 
    ## 2015-12-17 15:08:00 , processing array  20 
    ## 2015-12-17 15:08:01 , processing array  21 
    ## 2015-12-17 15:08:01 , processing array  22 
    ## 2015-12-17 15:08:01 , processing array  23 
    ## 2015-12-17 15:08:01 , processing array  24 
    ## 2015-12-17 15:08:01 , processing array  25 
    ## 2015-12-17 15:08:01 , processing array  26 
    ## 2015-12-17 15:08:01 , processing array  27 
    ## 2015-12-17 15:08:01 , processing array  28 
    ## 2015-12-17 15:08:01 , processing array  29 
    ## 2015-12-17 15:08:01 , processing array  30 
    ## 2015-12-17 15:08:01 , processing array  31 
    ## 2015-12-17 15:08:01 , processing array  32 
    ## 2015-12-17 15:08:01 , processing array  33 
    ## 2015-12-17 15:08:01 , processing array  34 
    ## 2015-12-17 15:08:01 , processing array  35 
    ## 2015-12-17 15:08:01 , processing array  36 
    ## 2015-12-17 15:08:01 , processing array  37 
    ## 2015-12-17 15:08:02 , processing array  38 
    ## 2015-12-17 15:08:02 , processing array  39 
    ## 2015-12-17 15:08:02 , processing array  40 
    ## 2015-12-17 15:08:02 , processing array  41 
    ## 2015-12-17 15:08:02 , processing array  42 
    ## 2015-12-17 15:08:02 , processing array  43 
    ## 2015-12-17 15:08:02 , processing array  44 
    ## 2015-12-17 15:08:02 , processing array  45 
    ## 2015-12-17 15:08:02 , processing array  46 
    ## 2015-12-17 15:08:02 , processing array  47 
    ## 2015-12-17 15:08:02 , processing array  48 
    ## 2015-12-17 15:08:02 , processing array  49 
    ## 2015-12-17 15:08:02 , processing array  50 
    ## 2015-12-17 15:08:02 , processing array  51 
    ## 2015-12-17 15:08:02 , processing array  52 
    ## 2015-12-17 15:08:02 , processing array  53 
    ## 2015-12-17 15:08:03 , processing array  54 
    ## 2015-12-17 15:08:03 , processing array  55 
    ## 2015-12-17 15:08:03 , processing array  56

    ## Perform rsn normalization ...
    ## 2015-12-17 15:08:04 , processing array  1 
    ## 2015-12-17 15:08:04 , processing array  2 
    ## 2015-12-17 15:08:05 , processing array  3 
    ## 2015-12-17 15:08:05 , processing array  4 
    ## 2015-12-17 15:08:05 , processing array  5 
    ## 2015-12-17 15:08:05 , processing array  6 
    ## 2015-12-17 15:08:05 , processing array  7 
    ## 2015-12-17 15:08:05 , processing array  8 
    ## 2015-12-17 15:08:05 , processing array  9 
    ## 2015-12-17 15:08:05 , processing array  10 
    ## 2015-12-17 15:08:05 , processing array  11 
    ## 2015-12-17 15:08:05 , processing array  12 
    ## 2015-12-17 15:08:05 , processing array  13 
    ## 2015-12-17 15:08:06 , processing array  14 
    ## 2015-12-17 15:08:06 , processing array  15 
    ## 2015-12-17 15:08:06 , processing array  16 
    ## 2015-12-17 15:08:06 , processing array  17 
    ## 2015-12-17 15:08:06 , processing array  18 
    ## 2015-12-17 15:08:06 , processing array  19 
    ## 2015-12-17 15:08:06 , processing array  20 
    ## 2015-12-17 15:08:06 , processing array  21 
    ## 2015-12-17 15:08:06 , processing array  22 
    ## 2015-12-17 15:08:06 , processing array  23 
    ## 2015-12-17 15:08:06 , processing array  24 
    ## 2015-12-17 15:08:07 , processing array  25 
    ## 2015-12-17 15:08:07 , processing array  26 
    ## 2015-12-17 15:08:07 , processing array  27 
    ## 2015-12-17 15:08:07 , processing array  28 
    ## 2015-12-17 15:08:07 , processing array  29 
    ## 2015-12-17 15:08:07 , processing array  30 
    ## 2015-12-17 15:08:07 , processing array  31 
    ## 2015-12-17 15:08:07 , processing array  32 
    ## 2015-12-17 15:08:07 , processing array  33 
    ## 2015-12-17 15:08:07 , processing array  34 
    ## 2015-12-17 15:08:08 , processing array  35 
    ## 2015-12-17 15:08:08 , processing array  36 
    ## 2015-12-17 15:08:08 , processing array  37 
    ## 2015-12-17 15:08:08 , processing array  38 
    ## 2015-12-17 15:08:08 , processing array  39 
    ## 2015-12-17 15:08:08 , processing array  40 
    ## 2015-12-17 15:08:08 , processing array  41 
    ## 2015-12-17 15:08:08 , processing array  42 
    ## 2015-12-17 15:08:08 , processing array  43 
    ## 2015-12-17 15:08:08 , processing array  44 
    ## 2015-12-17 15:08:08 , processing array  45 
    ## 2015-12-17 15:08:09 , processing array  46 
    ## 2015-12-17 15:08:09 , processing array  47 
    ## 2015-12-17 15:08:09 , processing array  48 
    ## 2015-12-17 15:08:09 , processing array  49 
    ## 2015-12-17 15:08:09 , processing array  50 
    ## 2015-12-17 15:08:09 , processing array  51 
    ## 2015-12-17 15:08:09 , processing array  52 
    ## 2015-12-17 15:08:09 , processing array  53 
    ## 2015-12-17 15:08:09 , processing array  54 
    ## 2015-12-17 15:08:09 , processing array  55 
    ## 2015-12-17 15:08:09 , processing array  56

    ## Perform Quality Control assessment of the LumiBatch object ...

PLOTS OF NORMALIZED DATA

![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-4-1.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-4-2.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-4-3.png) FILTERING PROBES BASED ON DETECTION Limma suggests to keep probes that are expressed above bg on at least n arrays where n is smallest number of replicates assigned to any of the treatment combinations.

Our treatment combinations are TissueID/Treatment/Time We have 7 Tissue IDs x 3 Treatments x 3 time points=63 so the smallest number of replicates possible for any of those 63 arrays is 7

how many probes did we have before and after filtering?

    ##          detection exprs se.exprs
    ## Features     47323 47323    47323
    ## Samples         56    56       56

    ##          detection exprs se.exprs
    ## Features     27126 27126    27126
    ## Samples         56    56       56

how many removed?

    ##          detection exprs se.exprs
    ## Features     20197 20197    20197
    ## Samples          0     0        0

Here's the design matrix for the analysis

    ##    TreatMock.24 TreatMock.3 TreatMock.8 TreatSD90.24 TreatSD90.3
    ## 1             0           0           0            0           0
    ## 2             1           0           0            0           0
    ## 3             0           0           1            0           0
    ## 4             1           0           0            0           0
    ## 5             0           0           0            0           0
    ## 6             0           0           0            0           0
    ## 7             0           0           0            0           0
    ## 8             0           0           0            0           0
    ## 9             0           1           0            0           0
    ## 10            0           0           0            0           0
    ## 11            0           1           0            0           0
    ## 12            1           0           0            0           0
    ## 13            0           0           0            0           1
    ## 14            0           0           0            0           0
    ## 15            0           0           1            0           0
    ## 16            1           0           0            0           0
    ## 17            0           0           0            0           1
    ## 18            0           0           0            0           0
    ## 19            0           0           0            0           0
    ## 20            0           0           0            0           1
    ## 21            0           0           1            0           0
    ## 22            0           0           0            1           0
    ## 23            0           0           0            1           0
    ## 24            0           1           0            0           0
    ## 25            0           0           0            0           0
    ## 26            0           0           0            0           0
    ## 27            1           0           0            0           0
    ## 28            1           0           0            0           0
    ## 29            0           0           0            1           0
    ## 30            0           1           0            0           0
    ## 31            0           0           0            1           0
    ## 32            0           0           1            0           0
    ## 33            0           0           0            0           0
    ## 34            0           0           0            0           0
    ## 35            0           0           0            0           0
    ## 36            0           0           0            0           0
    ## 37            0           0           0            0           0
    ## 38            0           1           0            0           0
    ## 39            0           0           0            0           0
    ## 40            0           0           0            0           0
    ## 41            0           0           0            1           0
    ## 42            0           0           0            0           1
    ## 43            0           0           0            0           0
    ## 44            0           0           0            0           0
    ## 45            0           0           0            0           0
    ## 46            0           0           0            1           0
    ## 47            0           0           0            0           0
    ## 48            0           1           0            0           0
    ## 49            1           0           0            0           0
    ## 50            0           0           0            0           1
    ## 51            0           0           0            0           0
    ## 52            0           0           0            0           1
    ## 53            0           0           0            0           0
    ## 54            0           0           0            0           0
    ## 55            0           0           1            0           0
    ## 56            0           0           0            0           1
    ##    TreatSD90.8 TreatV186.24 TreatV186.3 TreatV186.8 TissueID318
    ## 1            0            0           0           1           0
    ## 2            0            0           0           0           0
    ## 3            0            0           0           0           0
    ## 4            0            0           0           0           0
    ## 5            0            0           0           1           0
    ## 6            1            0           0           0           0
    ## 7            0            0           1           0           0
    ## 8            0            0           0           1           0
    ## 9            0            0           0           0           0
    ## 10           0            0           0           1           0
    ## 11           0            0           0           0           0
    ## 12           0            0           0           0           0
    ## 13           0            0           0           0           0
    ## 14           0            1           0           0           1
    ## 15           0            0           0           0           0
    ## 16           0            0           0           0           0
    ## 17           0            0           0           0           1
    ## 18           0            1           0           0           0
    ## 19           0            0           1           0           0
    ## 20           0            0           0           0           0
    ## 21           0            0           0           0           0
    ## 22           0            0           0           0           0
    ## 23           0            0           0           0           0
    ## 24           0            0           0           0           1
    ## 25           0            0           1           0           0
    ## 26           0            1           0           0           0
    ## 27           0            0           0           0           0
    ## 28           0            0           0           0           1
    ## 29           0            0           0           0           0
    ## 30           0            0           0           0           0
    ## 31           0            0           0           0           0
    ## 32           0            0           0           0           1
    ## 33           1            0           0           0           0
    ## 34           0            0           1           0           0
    ## 35           0            1           0           0           0
    ## 36           1            0           0           0           0
    ## 37           0            0           0           1           1
    ## 38           0            0           0           0           0
    ## 39           1            0           0           0           1
    ## 40           0            1           0           0           0
    ## 41           0            0           0           0           0
    ## 42           0            0           0           0           0
    ## 43           0            0           1           0           0
    ## 44           0            0           0           1           0
    ## 45           0            0           1           0           1
    ## 46           0            0           0           0           0
    ## 47           0            0           0           1           0
    ## 48           0            0           0           0           0
    ## 49           0            0           0           0           0
    ## 50           0            0           0           0           0
    ## 51           1            0           0           0           0
    ## 52           0            0           0           0           0
    ## 53           0            1           0           0           0
    ## 54           0            0           1           0           0
    ## 55           0            0           0           0           0
    ## 56           0            0           0           0           0
    ##    TissueID319 TissueID323 TissueID324 TissueID326 TissueID327
    ## 1            0           0           0           0           1
    ## 2            0           1           0           0           0
    ## 3            0           0           0           1           0
    ## 4            0           0           0           0           1
    ## 5            0           0           0           1           0
    ## 6            0           1           0           0           0
    ## 7            0           0           1           0           0
    ## 8            0           0           0           0           0
    ## 9            0           0           0           0           1
    ## 10           0           1           0           0           0
    ## 11           0           0           1           0           0
    ## 12           0           0           1           0           0
    ## 13           0           1           0           0           0
    ## 14           0           0           0           0           0
    ## 15           0           0           0           0           1
    ## 16           1           0           0           0           0
    ## 17           0           0           0           0           0
    ## 18           0           0           1           0           0
    ## 19           0           0           0           1           0
    ## 20           1           0           0           0           0
    ## 21           0           1           0           0           0
    ## 22           0           0           0           0           1
    ## 23           1           0           0           0           0
    ## 24           0           0           0           0           0
    ## 25           0           0           0           0           0
    ## 26           0           0           0           0           0
    ## 27           0           0           0           0           0
    ## 28           0           0           0           0           0
    ## 29           0           1           0           0           0
    ## 30           0           0           0           0           0
    ## 31           0           0           0           0           0
    ## 32           0           0           0           0           0
    ## 33           0           0           0           0           0
    ## 34           0           0           0           0           1
    ## 35           0           0           0           0           1
    ## 36           1           0           0           0           0
    ## 37           0           0           0           0           0
    ## 38           1           0           0           0           0
    ## 39           0           0           0           0           0
    ## 40           1           0           0           0           0
    ## 41           0           0           1           0           0
    ## 42           0           0           1           0           0
    ## 43           0           1           0           0           0
    ## 44           1           0           0           0           0
    ## 45           0           0           0           0           0
    ## 46           0           0           0           1           0
    ## 47           0           0           1           0           0
    ## 48           0           1           0           0           0
    ## 49           0           0           0           1           0
    ## 50           0           0           0           0           0
    ## 51           0           0           1           0           0
    ## 52           0           0           0           0           1
    ## 53           0           1           0           0           0
    ## 54           1           0           0           0           0
    ## 55           0           0           1           0           0
    ## 56           0           0           0           1           0
    ## attr(,"assign")
    ##  [1] 1 1 1 1 1 1 1 1 1 2 2 2 2 2 2
    ## attr(,"contrasts")
    ## attr(,"contrasts")$Treat
    ## [1] "contr.treatment"
    ## 
    ## attr(,"contrasts")$TissueID
    ## [1] "contr.treatment"

Here's the contrasts matrix

    ##               Contrasts
    ## Levels         V186.3vsMock.3 V186.8vsMock.8 V186.24vsMock.24
    ##   TreatMock.24              0              0               -1
    ##   TreatMock.3              -1              0                0
    ##   TreatMock.8               0             -1                0
    ##   TreatSD90.24              0              0                0
    ##   TreatSD90.3               0              0                0
    ##   TreatSD90.8               0              0                0
    ##   TreatV186.24              0              0                1
    ##   TreatV186.3               1              1                0
    ##   TreatV186.8               0              0                0
    ##   TissueID318               0              0                0
    ##   TissueID319               0              0                0
    ##   TissueID323               0              0                0
    ##   TissueID324               0              0                0
    ##   TissueID326               0              0                0
    ##   TissueID327               0              0                0
    ##               Contrasts
    ## Levels         SD90.3vsMock.3 SD90.8vsMock.8 SD90.24vsMock.24
    ##   TreatMock.24              0              0               -1
    ##   TreatMock.3              -1              0                0
    ##   TreatMock.8               0             -1                0
    ##   TreatSD90.24              0              0                1
    ##   TreatSD90.3               1              0                0
    ##   TreatSD90.8               0              1                0
    ##   TreatV186.24              0              0                0
    ##   TreatV186.3               0              0                0
    ##   TreatV186.8               0              0                0
    ##   TissueID318               0              0                0
    ##   TissueID319               0              0                0
    ##   TissueID323               0              0                0
    ##   TissueID324               0              0                0
    ##   TissueID326               0              0                0
    ##   TissueID327               0              0                0

How many probes are up and down regulated for each contrast?

    ## Source: local data frame [6 x 3]
    ## 
    ##           variable  down    up
    ##             (fctr) (int) (int)
    ## 1   V186.3vsMock.3    12    10
    ## 2   V186.8vsMock.8     8     1
    ## 3 V186.24vsMock.24   993   534
    ## 4   SD90.3vsMock.3     2     0
    ## 5   SD90.8vsMock.8     0     0
    ## 6 SD90.24vsMock.24     0     0

Heatmaps of the first 4 contrasts: V186 vs mock at 3hr, 8hr, and 24 hrs, SD90 vs Mock at 3 hrs

![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-11-1.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-11-2.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-11-3.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-11-4.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-11-5.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-11-6.png)

    ## [[1]]
    ## NULL
    ## 
    ## [[2]]
    ## NULL
    ## 
    ## [[3]]
    ## NULL
    ## 
    ## [[4]]
    ## NULL
    ## 
    ## [[5]]
    ## NULL
    ## 
    ## [[6]]
    ## NULL

Looks like there would still be a lot (hundreds)of DE probes for the v186 24hr comparison if reduced the adj p val cutoff to 0.01, but that would reduce the \# of DE probes in the v186.3 to ~2 and v186.8 to ~3. The SD90.3 would be 2 and SD90.8 and .24 were already zero with p\<=0.05

    ## R version 3.1.2 (2014-10-31)
    ## Platform: x86_64-w64-mingw32/x64 (64-bit)
    ## 
    ## locale:
    ## [1] LC_COLLATE=English_United States.1252 
    ## [2] LC_CTYPE=English_United States.1252   
    ## [3] LC_MONETARY=English_United States.1252
    ## [4] LC_NUMERIC=C                          
    ## [5] LC_TIME=English_United States.1252    
    ## 
    ## attached base packages:
    ## [1] parallel  stats     graphics  grDevices utils     datasets  methods  
    ## [8] base     
    ## 
    ## other attached packages:
    ## [1] reshape2_1.4.1      limma_3.22.7        lumi_2.18.0        
    ## [4] Biobase_2.26.0      BiocGenerics_0.12.1 dplyr_0.4.3        
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] affy_1.44.0             affyio_1.34.0          
    ##  [3] annotate_1.44.0         AnnotationDbi_1.28.2   
    ##  [5] assertthat_0.1          base64_1.1             
    ##  [7] base64enc_0.1-3         BatchJobs_1.6          
    ##  [9] BBmisc_1.9              beanplot_1.2           
    ## [11] BiocInstaller_1.16.5    BiocParallel_1.0.3     
    ## [13] biomaRt_2.22.0          Biostrings_2.34.1      
    ## [15] bitops_1.0-6            brew_1.0-6             
    ## [17] bumphunter_1.6.0        checkmate_1.6.2        
    ## [19] codetools_0.2-14        colorspace_1.2-6       
    ## [21] DBI_0.3.1               digest_0.6.8           
    ## [23] doRNG_1.6               evaluate_0.7.2         
    ## [25] fail_1.2                foreach_1.4.2          
    ## [27] formatR_1.2             genefilter_1.48.1      
    ## [29] GenomeInfoDb_1.2.5      GenomicAlignments_1.2.2
    ## [31] GenomicFeatures_1.18.7  GenomicRanges_1.18.4   
    ## [33] grid_3.1.2              htmltools_0.2.6        
    ## [35] illuminaio_0.8.0        IRanges_2.0.1          
    ## [37] iterators_1.0.7         KernSmooth_2.23-15     
    ## [39] knitr_1.11              lattice_0.20-29        
    ## [41] lazyeval_0.1.10         locfit_1.5-9.1         
    ## [43] magrittr_1.5            MASS_7.3-44            
    ## [45] Matrix_1.2-2            matrixStats_0.14.2     
    ## [47] mclust_5.0.2            methylumi_2.12.0       
    ## [49] mgcv_1.8-7              minfi_1.12.0           
    ## [51] multtest_2.22.0         nleqslv_2.8            
    ## [53] nlme_3.1-122            nor1mix_1.2-1          
    ## [55] pkgmaker_0.22           plyr_1.8.3             
    ## [57] preprocessCore_1.28.0   quadprog_1.5-5         
    ## [59] R6_2.1.1                RColorBrewer_1.1-2     
    ## [61] Rcpp_0.12.0             RCurl_1.95-4.7         
    ## [63] registry_0.3            reshape_0.8.5          
    ## [65] rmarkdown_0.8           rngtools_1.2.4         
    ## [67] Rsamtools_1.18.3        RSQLite_1.0.0          
    ## [69] rtracklayer_1.26.3      S4Vectors_0.4.0        
    ## [71] sendmailR_1.2-1         siggenes_1.40.0        
    ## [73] splines_3.1.2           stats4_3.1.2           
    ## [75] stringi_0.5-5           stringr_1.0.0          
    ## [77] survival_2.38-3         tools_3.1.2            
    ## [79] XML_3.98-1.3            xtable_1.7-4           
    ## [81] XVector_0.6.0           yaml_2.1.13            
    ## [83] zlibbioc_1.12.0
