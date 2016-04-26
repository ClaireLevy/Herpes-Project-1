Gene set tests of explant data
------------------------------

From the description of the `camera` function from limma:

"Test whether a set of genes is highly ranked relative to other genes in terms of differential expression, accounting for inter-gene correlation."

The user provides:

-   a filtered set of expression data (the same set that I used for doing differential expression analysis)

-   a design matrix (also the same as for DE analysis)

-   a contrast, or, the parts of the expression data we want to compare (in our case V186 24 hours vs Mock 24hrs)

-   a gene set of interest

How CAMERA works
----------------

`camera` looks at how many of the genes that were expressed in the contrast we specified are also in the gene set we provided. The test result gives

-   The number of genes in the input data that were in the gene set

-   a p-value that tells us whether the genes that are in the set are more differentially expressed compared with the complement ( i.e. our genes that *weren't* in the set)

-   The correlation between the genes that were in the set

-   the direction of change, relative to the gene set. For example, if the direction is DOWN, genes that were in the set have lower DE than genes not in the set.

-   if we test \>1 gene set, we are given a corrected p-value (FDR)

Test 1
------

For the first test I used the following gene set:

Probes from the epithelial cell microarray that I found to be DE in the V186 infected, 24 hr timepoint(V186.24) condition.

Here is the test result

<table>
<colgroup>
<col width="12%" />
<col width="19%" />
<col width="16%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">NGenes</th>
<th align="center">Correlation</th>
<th align="center">Direction</th>
<th align="center">PValue</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">9434</td>
<td align="center">0.004606</td>
<td align="center">Up</td>
<td align="center">0.0001851</td>
</tr>
</tbody>
</table>

Test 2
------

Also DE probes from the CELLS experiment, V186 treatment, but they are for all 3 time points (3hr, 8hr, 24hr) and are separated by whether the direction of DE was up or down.

<table>
<caption>Table continues below</caption>
<colgroup>
<col width="33%" />
<col width="12%" />
<col width="19%" />
<col width="15%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">NGenes</th>
<th align="center">Correlation</th>
<th align="center">Direction</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>CELLS_V186.24DOWN</strong></td>
<td align="center">5930</td>
<td align="center">0.04091</td>
<td align="center">Up</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.24UP</strong></td>
<td align="center">3504</td>
<td align="center">0.04293</td>
<td align="center">Down</td>
</tr>
<tr class="odd">
<td align="center"><strong>CELLS_V186.3DOWN</strong></td>
<td align="center">95</td>
<td align="center">0.05727</td>
<td align="center">Up</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.3UP</strong></td>
<td align="center">314</td>
<td align="center">0.04873</td>
<td align="center">Down</td>
</tr>
<tr class="odd">
<td align="center"><strong>CELLS_V186.8UP</strong></td>
<td align="center">333</td>
<td align="center">0.0555</td>
<td align="center">Down</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.8DOWN</strong></td>
<td align="center">78</td>
<td align="center">0.09047</td>
<td align="center">Up</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col width="33%" />
<col width="12%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">PValue</th>
<th align="center">FDR</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>CELLS_V186.24DOWN</strong></td>
<td align="center">0.01197</td>
<td align="center">0.07179</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.24UP</strong></td>
<td align="center">0.2867</td>
<td align="center">0.5387</td>
</tr>
<tr class="odd">
<td align="center"><strong>CELLS_V186.3DOWN</strong></td>
<td align="center">0.4069</td>
<td align="center">0.5387</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.3UP</strong></td>
<td align="center">0.42</td>
<td align="center">0.5387</td>
</tr>
<tr class="odd">
<td align="center"><strong>CELLS_V186.8UP</strong></td>
<td align="center">0.4489</td>
<td align="center">0.5387</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.8DOWN</strong></td>
<td align="center">0.7301</td>
<td align="center">0.7301</td>
</tr>
</tbody>
</table>

Test 3
------

Now the Hallmark gene set from MSigDB (prepared for R here: <http://bioinf.wehi.edu.au/software/MSigDB/>, accessed 22Apr16). Note that ENTREZ\_GENE\_ID is the ID provided for these gene sets, so I'll have to use that for my identifiers.

More info on the MSigDB gene sets is here: <http://software.broadinstitute.org/gsea/msigdb/collections.jsp#H>

<table>
<caption>Table continues below</caption>
<colgroup>
<col width="56%" />
<col width="12%" />
<col width="18%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">NGenes</th>
<th align="center">Correlation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>HALLMARK_FATTY_ACID_METABOLISM</strong></td>
<td align="center">195</td>
<td align="center">0.0226</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_DNA_REPAIR</strong></td>
<td align="center">213</td>
<td align="center">0.02181</td>
</tr>
<tr class="odd">
<td align="center"><strong>HALLMARK_GLYCOLYSIS</strong></td>
<td align="center">254</td>
<td align="center">0.01161</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_ALLOGRAFT_REJECTION</strong></td>
<td align="center">249</td>
<td align="center">0.01737</td>
</tr>
<tr class="odd">
<td align="center"><strong>HALLMARK_INTERFERON_ALPHA_RESPONSE</strong></td>
<td align="center">131</td>
<td align="center">0.06882</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_MTORC1_SIGNALING</strong></td>
<td align="center">309</td>
<td align="center">0.02886</td>
</tr>
</tbody>
</table>

<table>
<caption>Table continues below</caption>
<colgroup>
<col width="56%" />
<col width="16%" />
<col width="11%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">Direction</th>
<th align="center">PValue</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>HALLMARK_FATTY_ACID_METABOLISM</strong></td>
<td align="center">Up</td>
<td align="center">0.01128</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_DNA_REPAIR</strong></td>
<td align="center">Up</td>
<td align="center">0.03692</td>
</tr>
<tr class="odd">
<td align="center"><strong>HALLMARK_GLYCOLYSIS</strong></td>
<td align="center">Up</td>
<td align="center">0.0477</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_ALLOGRAFT_REJECTION</strong></td>
<td align="center">Up</td>
<td align="center">0.04908</td>
</tr>
<tr class="odd">
<td align="center"><strong>HALLMARK_INTERFERON_ALPHA_RESPONSE</strong></td>
<td align="center">Up</td>
<td align="center">0.05995</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_MTORC1_SIGNALING</strong></td>
<td align="center">Up</td>
<td align="center">0.09725</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col width="56%" />
<col width="8%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">FDR</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>HALLMARK_FATTY_ACID_METABOLISM</strong></td>
<td align="center">0.5639</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_DNA_REPAIR</strong></td>
<td align="center">0.5995</td>
</tr>
<tr class="odd">
<td align="center"><strong>HALLMARK_GLYCOLYSIS</strong></td>
<td align="center">0.5995</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_ALLOGRAFT_REJECTION</strong></td>
<td align="center">0.5995</td>
</tr>
<tr class="odd">
<td align="center"><strong>HALLMARK_INTERFERON_ALPHA_RESPONSE</strong></td>
<td align="center">0.5995</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_MTORC1_SIGNALING</strong></td>
<td align="center">0.6225</td>
</tr>
</tbody>
</table>

Test 4
------

Now trying with the immunologic gene sets ("c7") from MSigDB

<table>
<caption>Table continues below</caption>
<colgroup>
<col width="79%" />
<col width="11%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">NGenes</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>GSE24142_ADULT_VS_FETAL_EARLY_THYMIC_PROGENITOR_DN</strong></td>
<td align="center">268</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE17721_CTRL_VS_POLYIC_2H_BMDM_UP</strong></td>
<td align="center">231</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE15659_RESTING_TREG_VS_NONSUPPRESSIVE_TCELL_DN</strong></td>
<td align="center">226</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE3982_EOSINOPHIL_VS_NKCELL_DN</strong></td>
<td align="center">258</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE11864_CSF1_IFNG_VS_CSF1_PAM3CYS_IN_MAC_UP</strong></td>
<td align="center">265</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE14308_INDUCED_VS_NATURAL_TREG_UP</strong></td>
<td align="center">257</td>
</tr>
</tbody>
</table>

<table>
<caption>Table continues below</caption>
<colgroup>
<col width="79%" />
<col width="18%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">Correlation</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>GSE24142_ADULT_VS_FETAL_EARLY_THYMIC_PROGENITOR_DN</strong></td>
<td align="center">0.006701</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE17721_CTRL_VS_POLYIC_2H_BMDM_UP</strong></td>
<td align="center">0.00543</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE15659_RESTING_TREG_VS_NONSUPPRESSIVE_TCELL_DN</strong></td>
<td align="center">0.007273</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE3982_EOSINOPHIL_VS_NKCELL_DN</strong></td>
<td align="center">0.0105</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE11864_CSF1_IFNG_VS_CSF1_PAM3CYS_IN_MAC_UP</strong></td>
<td align="center">0.00826</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE14308_INDUCED_VS_NATURAL_TREG_UP</strong></td>
<td align="center">0.005849</td>
</tr>
</tbody>
</table>

<table>
<caption>Table continues below</caption>
<colgroup>
<col width="79%" />
<col width="15%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">Direction</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>GSE24142_ADULT_VS_FETAL_EARLY_THYMIC_PROGENITOR_DN</strong></td>
<td align="center">Up</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE17721_CTRL_VS_POLYIC_2H_BMDM_UP</strong></td>
<td align="center">Up</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE15659_RESTING_TREG_VS_NONSUPPRESSIVE_TCELL_DN</strong></td>
<td align="center">Up</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE3982_EOSINOPHIL_VS_NKCELL_DN</strong></td>
<td align="center">Up</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE11864_CSF1_IFNG_VS_CSF1_PAM3CYS_IN_MAC_UP</strong></td>
<td align="center">Up</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE14308_INDUCED_VS_NATURAL_TREG_UP</strong></td>
<td align="center">Up</td>
</tr>
</tbody>
</table>

<table>
<caption>Table continues below</caption>
<colgroup>
<col width="79%" />
<col width="11%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">PValue</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>GSE24142_ADULT_VS_FETAL_EARLY_THYMIC_PROGENITOR_DN</strong></td>
<td align="center">0.001194</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE17721_CTRL_VS_POLYIC_2H_BMDM_UP</strong></td>
<td align="center">0.006042</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE15659_RESTING_TREG_VS_NONSUPPRESSIVE_TCELL_DN</strong></td>
<td align="center">0.00613</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE3982_EOSINOPHIL_VS_NKCELL_DN</strong></td>
<td align="center">0.006811</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE11864_CSF1_IFNG_VS_CSF1_PAM3CYS_IN_MAC_UP</strong></td>
<td align="center">0.007115</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE14308_INDUCED_VS_NATURAL_TREG_UP</strong></td>
<td align="center">0.007375</td>
</tr>
</tbody>
</table>

<table>
<colgroup>
<col width="79%" />
<col width="8%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">FDR</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>GSE24142_ADULT_VS_FETAL_EARLY_THYMIC_PROGENITOR_DN</strong></td>
<td align="center">0.3285</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE17721_CTRL_VS_POLYIC_2H_BMDM_UP</strong></td>
<td align="center">0.3285</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE15659_RESTING_TREG_VS_NONSUPPRESSIVE_TCELL_DN</strong></td>
<td align="center">0.3285</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE3982_EOSINOPHIL_VS_NKCELL_DN</strong></td>
<td align="center">0.3285</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE11864_CSF1_IFNG_VS_CSF1_PAM3CYS_IN_MAC_UP</strong></td>
<td align="center">0.3285</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE14308_INDUCED_VS_NATURAL_TREG_UP</strong></td>
<td align="center">0.3285</td>
</tr>
</tbody>
</table>

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
    ## [1] dplyr_0.4.3         pander_0.5.2        lumi_2.18.0        
    ## [4] Biobase_2.26.0      BiocGenerics_0.12.1 limma_3.22.7       
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
    ## [53] nlme_3.1-124            nor1mix_1.2-1          
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
