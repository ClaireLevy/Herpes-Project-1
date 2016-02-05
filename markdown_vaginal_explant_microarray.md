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

Below are the top 10 results.

-   **GOV186.24DOWN**:

    <table>
    <colgroup>
    <col width="40%" />
    <col width="13%" />
    <col width="25%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="center">GO Term</th>
    <th align="center">P Value</th>
    <th align="center">Source.Name</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="center">regulation of transcription, DNA-templated</td>
    <td align="center">4.102e-09</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">cellular protein metabolic process</td>
    <td align="center">5.945e-07</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">chaperone-mediated protein folding</td>
    <td align="center">1.144e-06</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">transcription, DNA-templated</td>
    <td align="center">2.616e-06</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">protein peptidyl-prolyl isomerization</td>
    <td align="center">1.469e-05</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">gene expression</td>
    <td align="center">4.093e-05</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">regulation of translation</td>
    <td align="center">0.0001189</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">post-translational protein modification</td>
    <td align="center">0.0001937</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">nucleosome assembly</td>
    <td align="center">0.0003449</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">response to axon injury</td>
    <td align="center">0.0004738</td>
    <td align="center">biological process</td>
    </tr>
    </tbody>
    </table>

-   **GOV186.24UP**:

    <table>
    <colgroup>
    <col width="41%" />
    <col width="13%" />
    <col width="25%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="center">GO Term</th>
    <th align="center">P Value</th>
    <th align="center">Source.Name</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="center">viral process</td>
    <td align="center">7.21e-16</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">translation</td>
    <td align="center">9.645e-15</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">SRP-dependent cotranslational protein targeting to membrane</td>
    <td align="center">5.097e-14</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">translational elongation</td>
    <td align="center">8.071e-13</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">cellular protein metabolic process</td>
    <td align="center">1.339e-11</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">RNA metabolic process</td>
    <td align="center">3.579e-10</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">gene expression</td>
    <td align="center">3.932e-10</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">viral transcription</td>
    <td align="center">4.098e-10</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">viral life cycle</td>
    <td align="center">9.834e-10</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">mRNA metabolic process</td>
    <td align="center">1.135e-09</td>
    <td align="center">biological process</td>
    </tr>
    </tbody>
    </table>

-   **GOV186.3DOWN**:

    <table>
    <colgroup>
    <col width="43%" />
    <col width="13%" />
    <col width="25%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="center">GO Term</th>
    <th align="center">P Value</th>
    <th align="center">Source.Name</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="center">innate immune response</td>
    <td align="center">3.629e-05</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">regulation of retroviral genome replication</td>
    <td align="center">0.0003692</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">nicotinamide metabolic process</td>
    <td align="center">0.0007382</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">substrate-dependent cell migration, cell attachment to substrate</td>
    <td align="center">0.001107</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">regulation of wound healing</td>
    <td align="center">0.001476</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">pointed-end actin filament capping</td>
    <td align="center">0.002582</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">angiogenesis</td>
    <td align="center">0.002636</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">neutrophil activation</td>
    <td align="center">0.003686</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">response to molecule of bacterial origin</td>
    <td align="center">0.003686</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">negative regulation of G-protein coupled receptor protein signaling pathway</td>
    <td align="center">0.004422</td>
    <td align="center">biological process</td>
    </tr>
    </tbody>
    </table>

-   **GOV186.3UP**:

    <table>
    <colgroup>
    <col width="40%" />
    <col width="13%" />
    <col width="25%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="center">GO Term</th>
    <th align="center">P Value</th>
    <th align="center">Source.Name</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="center">mitotic spindle organization</td>
    <td align="center">0.002108</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">chromosome segregation</td>
    <td align="center">0.00716</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">mitotic nuclear division</td>
    <td align="center">0.0262</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">mitotic cell cycle</td>
    <td align="center">0.0434</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="odd">
    <td align="center">regulation of transcription, DNA-templated</td>
    <td align="center">0.1902</td>
    <td align="center">biological process</td>
    </tr>
    <tr class="even">
    <td align="center">transcription, DNA-templated</td>
    <td align="center">0.194</td>
    <td align="center">biological process</td>
    </tr>
    </tbody>
    </table>

<!-- end of list -->
-   **pathwayV186.24DOWN**:

    <table>
    <colgroup>
    <col width="43%" />
    <col width="13%" />
    <col width="18%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="center">Pathway Name</th>
    <th align="center">P Value</th>
    <th align="center">Source.Name</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="center">Gene Expression</td>
    <td align="center">6.496e-09</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="even">
    <td align="center">Generic Transcription Pathway</td>
    <td align="center">3.197e-07</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="odd">
    <td align="center">Metabolism of proteins</td>
    <td align="center">6.432e-05</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="even">
    <td align="center">Signaling events mediated by HDAC Class III</td>
    <td align="center">7.734e-05</td>
    <td align="center">PID NCI</td>
    </tr>
    <tr class="odd">
    <td align="center">Loss of Function of SMAD2/3 in Cancer</td>
    <td align="center">0.0002333</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="even">
    <td align="center">Loss of Function of SMAD4 in Cancer</td>
    <td align="center">0.0002333</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="odd">
    <td align="center">Loss of Function of TGFBR1 in Cancer</td>
    <td align="center">0.0002333</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="even">
    <td align="center">Loss of Function of TGFBR2 in Cancer</td>
    <td align="center">0.0002333</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="odd">
    <td align="center">Regulation of nuclear SMAD2/3 signaling</td>
    <td align="center">0.0002333</td>
    <td align="center">PID NCI</td>
    </tr>
    <tr class="even">
    <td align="center">SMAD2/3 MH2 Domain Mutants in Cancer</td>
    <td align="center">0.0002333</td>
    <td align="center">REACTOME</td>
    </tr>
    </tbody>
    </table>

-   **pathwayV186.24UP**:

    <table>
    <colgroup>
    <col width="41%" />
    <col width="13%" />
    <col width="18%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="center">Pathway Name</th>
    <th align="center">P Value</th>
    <th align="center">Source.Name</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="center">Translation</td>
    <td align="center">4.077e-14</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="even">
    <td align="center">SRP-dependent cotranslational protein targeting to membrane</td>
    <td align="center">3.45e-13</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="odd">
    <td align="center">Eukaryotic Translation Elongation</td>
    <td align="center">8.518e-12</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="even">
    <td align="center">Peptide chain elongation</td>
    <td align="center">3.943e-11</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="odd">
    <td align="center">Ribosome</td>
    <td align="center">2.461e-09</td>
    <td align="center">KEGG</td>
    </tr>
    <tr class="even">
    <td align="center">Eukaryotic Translation Termination</td>
    <td align="center">3.604e-09</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="odd">
    <td align="center">Viral mRNA Translation</td>
    <td align="center">3.604e-09</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="even">
    <td align="center">Nonsense Mediated Decay (NMD) independent of the Exon Junction Complex (EJC)</td>
    <td align="center">8.263e-09</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="odd">
    <td align="center">L13a-mediated translational silencing of Ceruloplasmin expression</td>
    <td align="center">1.02e-08</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="even">
    <td align="center">GTP hydrolysis and joining of the 60S ribosomal subunit</td>
    <td align="center">1.176e-08</td>
    <td align="center">REACTOME</td>
    </tr>
    </tbody>
    </table>

-   **pathwayV186.3DOWN**:

    <table>
    <colgroup>
    <col width="41%" />
    <col width="13%" />
    <col width="18%" />
    </colgroup>
    <thead>
    <tr class="header">
    <th align="center">Pathway Name</th>
    <th align="center">P Value</th>
    <th align="center">Source.Name</th>
    </tr>
    </thead>
    <tbody>
    <tr class="odd">
    <td align="center">Nonsense Mediated Decay (NMD) enhanced by the Exon Junction Complex (EJC)</td>
    <td align="center">0.0003508</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="even">
    <td align="center">Nonsense-Mediated Decay (NMD)</td>
    <td align="center">0.0003508</td>
    <td align="center">REACTOME</td>
    </tr>
    <tr class="odd">
    <td align="center">RNA transport</td>
    <td align="center">0.0009187</td>
    <td align="center">KEGG</td>
    </tr>
    <tr class="even">
    <td align="center">Gene Expression</td>
    <td align="center">0.03728</td>
    <td align="center">REACTOME</td>
    </tr>
    </tbody>
    </table>

<!-- end of list -->
SessionInfo()

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
    ##  [1] reshape2_1.4.1      ggplot2_1.0.1       stringr_1.0.0      
    ##  [4] pander_0.5.2        limma_3.22.7        lumi_2.18.0        
    ##  [7] Biobase_2.26.0      BiocGenerics_0.12.1 dplyr_0.4.3        
    ## [10] plyr_1.8.3         
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
    ## [55] nlme_3.1-122            nor1mix_1.2-1          
    ## [57] pkgmaker_0.22           preprocessCore_1.28.0  
    ## [59] proto_0.3-10            quadprog_1.5-5         
    ## [61] R6_2.1.1                RColorBrewer_1.1-2     
    ## [63] Rcpp_0.12.0             RCurl_1.95-4.7         
    ## [65] registry_0.3            reshape_0.8.5          
    ## [67] rmarkdown_0.8           rngtools_1.2.4         
    ## [69] Rsamtools_1.18.3        RSQLite_1.0.0          
    ## [71] rtracklayer_1.26.3      S4Vectors_0.4.0        
    ## [73] scales_0.3.0            sendmailR_1.2-1        
    ## [75] siggenes_1.40.0         splines_3.1.2          
    ## [77] stats4_3.1.2            stringi_0.5-5          
    ## [79] survival_2.38-3         tools_3.1.2            
    ## [81] XML_3.98-1.3            xtable_1.7-4           
    ## [83] XVector_0.6.0           yaml_2.1.13            
    ## [85] zlibbioc_1.12.0
