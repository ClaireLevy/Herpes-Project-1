"Vaginal explant herpes infection experiment"

EXPERIMENT NOTES

6 samples failed when the microarray was run (6, 33, 34, 35, 45, 63) and two failed QC (36,64).

FAILED SAMPLES 6 One of the T-cell samples, not included in the explant study

33 ID326 3hr MOCK

34 ID 326 8hr SD90

35 ID 326 24hr V186

36 ID 317 8hr MOCK

45 ID 318 24hr SD90

63 ID 327 8hr SD90

64 ID 319 8hr MOCK

Samples that failed the finalReport file were not included in the report we got from shared resources and I removed the ones that failed QC.

ALSO

The first 6 samples in the micrarray data are T cells that were exposed to Tenofovir. These will be analyzed separately so I removed them from the data set here.

SOME PLOTS OF NON NORMALIZED DATA: density plot, cdf plot, sample relations

![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-3-1.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-3-2.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-3-3.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-3-4.png)

PLOTS OF NORMALIZED DATA

![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-5-1.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-5-2.png) ![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-5-3.png)

FILTERING PROBES Limma suggests to keep probes that are expressed above background on at least n arrays where n is smallest number of replicates assigned to any of the treatment combinations.

Our treatment combinations are TissueID/Treatment/Time. We have 7 replicates (donors) for each of the treatment combinations so I kept probes with detection levels above background in at least 7 samples.

Number of probes in data set before filtering:

    ## [1] 47323

Number of probes in data set after filtering:

    ## [1] 27126

Number of probes removed by filtering:

    ## [1] 20197

The design matrix includes a combined treatment + timepoint parameter (Treat) and a donor parameter (TissueID).

Then we choose the comparisons we want to analyze. I compared each treatment + timepoint condition with the corresponding mock infection in the same donor. This gives 6 contrasts to analyze:

V186.3vsMock.3

V186.8vsMock.8

V186.24vsMock.24

SD90.3vsMock.3

SD90.8vsMock.8

SD90.24vsMock.24

After fitting the contrasts to the model using our design matrix, we can see how many probes are up and down-regulated for each contrast, based on a p-value cut-off of 0.05 and a log-fold-change cut-off of 0.5.

<table>
<colgroup>
<col width="23%" />
<col width="9%" />
<col width="5%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">variable</th>
<th align="center">down</th>
<th align="center">up</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">V186.3vsMock.3</td>
<td align="center">12</td>
<td align="center">10</td>
</tr>
<tr class="even">
<td align="center">V186.8vsMock.8</td>
<td align="center">8</td>
<td align="center">1</td>
</tr>
<tr class="odd">
<td align="center">V186.24vsMock.24</td>
<td align="center">993</td>
<td align="center">534</td>
</tr>
<tr class="even">
<td align="center">SD90.3vsMock.3</td>
<td align="center">2</td>
<td align="center">0</td>
</tr>
<tr class="odd">
<td align="center">SD90.8vsMock.8</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
<tr class="even">
<td align="center">SD90.24vsMock.24</td>
<td align="center">0</td>
<td align="center">0</td>
</tr>
</tbody>
</table>

V186 vs mock at 3hr

![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-13-1.png)

V186 vs mock at 8hr

![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-14-1.png)

V186 vs mock at 24hr

![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-15-1.png)

SD90vsMock at 3hr

![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-16-1.png)

Heat map of V186 AND SD90 at 24hr for probes that were sig for V186.24

![](markdown_vaginal_explant_microarray_files/figure-markdown_github/unnamed-chunk-17-1.png)

Next I used InnateDB to do GO and Pathway overrepresentation analyses for the V186.24 vs Mock condition for up and down regulated probes.

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
    ##  [1] tidyr_0.4.1         reshape2_1.4.1      ggplot2_2.0.0      
    ##  [4] stringr_1.0.0       pander_0.5.2        limma_3.22.7       
    ##  [7] lumi_2.18.0         Biobase_2.26.0      BiocGenerics_0.12.1
    ## [10] dplyr_0.4.3         plyr_1.8.3         
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
    ## [33] grid_3.1.2              gtable_0.1.2           
    ## [35] htmltools_0.2.6         illuminaio_0.8.0       
    ## [37] IRanges_2.0.1           iterators_1.0.7        
    ## [39] KernSmooth_2.23-15      knitr_1.11             
    ## [41] lattice_0.20-29         lazyeval_0.1.10        
    ## [43] locfit_1.5-9.1          magrittr_1.5           
    ## [45] MASS_7.3-44             Matrix_1.2-2           
    ## [47] matrixStats_0.14.2      mclust_5.0.2           
    ## [49] methylumi_2.12.0        mgcv_1.8-7             
    ## [51] minfi_1.12.0            multtest_2.22.0        
    ## [53] munsell_0.4.2           nleqslv_2.8            
    ## [55] nlme_3.1-124            nor1mix_1.2-1          
    ## [57] pkgmaker_0.22           preprocessCore_1.28.0  
    ## [59] quadprog_1.5-5          R6_2.1.1               
    ## [61] RColorBrewer_1.1-2      Rcpp_0.12.0            
    ## [63] RCurl_1.95-4.7          registry_0.3           
    ## [65] reshape_0.8.5           rmarkdown_0.8          
    ## [67] rngtools_1.2.4          Rsamtools_1.18.3       
    ## [69] RSQLite_1.0.0           rtracklayer_1.26.3     
    ## [71] S4Vectors_0.4.0         scales_0.3.0           
    ## [73] sendmailR_1.2-1         siggenes_1.40.0        
    ## [75] splines_3.1.2           stats4_3.1.2           
    ## [77] stringi_0.5-5           survival_2.38-3        
    ## [79] tools_3.1.2             XML_3.98-1.3           
    ## [81] xtable_1.7-4            XVector_0.6.0          
    ## [83] yaml_2.1.13             zlibbioc_1.12.0
