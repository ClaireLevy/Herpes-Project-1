Gene Set Testing
================
Claire Levy
March 11, 2016

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

-   if we test &gt;1 gene set, we are given a corrected p-value (FDR)

Test 1
------

For the first test I used the following gene set:

Probes from the epithelial cell microarray that I found to be DE in the V186 infected, 24 hr timepoint(V186.24) condition.

Here is the test result

<table style="width:89%;">
<colgroup>
<col width="15%" />
<col width="12%" />
<col width="19%" />
<col width="16%" />
<col width="12%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">NGenes</th>
<th align="center">Correlation</th>
<th align="center">Direction</th>
<th align="center">PValue</th>
<th align="center">FDR</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>DOWN</strong></td>
<td align="center">9236</td>
<td align="center">0.007301</td>
<td align="center">Up</td>
<td align="center">0.00104</td>
<td align="center">0.002081</td>
</tr>
<tr class="even">
<td align="center"><strong>UP</strong></td>
<td align="center">6224</td>
<td align="center">0.02635</td>
<td align="center">Down</td>
<td align="center">0.2304</td>
<td align="center">0.2304</td>
</tr>
</tbody>
</table>

This is weird.

Test 2
------

Also DE probes from the CELLS experiment, V186 treatment, but they are for all 3 time points (3hr, 8hr, 24hr) and are separated by whether the direction of DE was up or down.

<table style="width:89%;">
<colgroup>
<col width="15%" />
<col width="12%" />
<col width="19%" />
<col width="16%" />
<col width="12%" />
<col width="12%" />
</colgroup>
<thead>
<tr class="header">
<th align="center"> </th>
<th align="center">NGenes</th>
<th align="center">Correlation</th>
<th align="center">Direction</th>
<th align="center">PValue</th>
<th align="center">FDR</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center"><strong>DOWN</strong></td>
<td align="center">9278</td>
<td align="center">0.007276</td>
<td align="center">Up</td>
<td align="center">0.001109</td>
<td align="center">0.002218</td>
</tr>
<tr class="even">
<td align="center"><strong>UP</strong></td>
<td align="center">6790</td>
<td align="center">0.01879</td>
<td align="center">Down</td>
<td align="center">0.1679</td>
<td align="center">0.1679</td>
</tr>
</tbody>
</table>

This is also weird and makes me think there is a mistake somewhere.

Test 3
------

Now the Hallmark gene set from MSigDB (prepared for R here: <http://bioinf.wehi.edu.au/software/MSigDB/>, accessed 22Apr16). Note that ENTREZ\_GENE\_ID is the ID provided for these gene sets, so I'll have to use that for my identifiers.

More info on the MSigDB gene sets is here: <http://software.broadinstitute.org/gsea/msigdb/collections.jsp#H>

<table>
<caption>Table continues below</caption>
<colgroup>
<col width="54%" />
<col width="12%" />
<col width="18%" />
<col width="14%" />
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
<td align="center"><strong>HALLMARK_FATTY_ACID_METABOLISM</strong></td>
<td align="center">195</td>
<td align="center">0.0226</td>
<td align="center">Up</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_DNA_REPAIR</strong></td>
<td align="center">213</td>
<td align="center">0.02181</td>
<td align="center">Up</td>
</tr>
<tr class="odd">
<td align="center"><strong>HALLMARK_GLYCOLYSIS</strong></td>
<td align="center">254</td>
<td align="center">0.01161</td>
<td align="center">Up</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_ALLOGRAFT_REJECTION</strong></td>
<td align="center">249</td>
<td align="center">0.01737</td>
<td align="center">Up</td>
</tr>
<tr class="odd">
<td align="center"><strong>HALLMARK_INTERFERON_ALPHA_RESPONSE</strong></td>
<td align="center">131</td>
<td align="center">0.06882</td>
<td align="center">Up</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_MTORC1_SIGNALING</strong></td>
<td align="center">309</td>
<td align="center">0.02886</td>
<td align="center">Up</td>
</tr>
</tbody>
</table>

<table style="width:78%;">
<colgroup>
<col width="56%" />
<col width="12%" />
<col width="8%" />
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
<td align="center"><strong>HALLMARK_FATTY_ACID_METABOLISM</strong></td>
<td align="center">0.01128</td>
<td align="center">0.5639</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_DNA_REPAIR</strong></td>
<td align="center">0.03692</td>
<td align="center">0.5995</td>
</tr>
<tr class="odd">
<td align="center"><strong>HALLMARK_GLYCOLYSIS</strong></td>
<td align="center">0.0477</td>
<td align="center">0.5995</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_ALLOGRAFT_REJECTION</strong></td>
<td align="center">0.04908</td>
<td align="center">0.5995</td>
</tr>
<tr class="odd">
<td align="center"><strong>HALLMARK_INTERFERON_ALPHA_RESPONSE</strong></td>
<td align="center">0.05995</td>
<td align="center">0.5995</td>
</tr>
<tr class="even">
<td align="center"><strong>HALLMARK_MTORC1_SIGNALING</strong></td>
<td align="center">0.09725</td>
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
<col width="72%" />
<col width="11%" />
<col width="16%" />
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
<td align="center"><strong>GSE24142_ADULT_VS_FETAL_EARLY_THYMIC_PROGENITOR_DN</strong></td>
<td align="center">268</td>
<td align="center">0.006701</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE17721_CTRL_VS_POLYIC_2H_BMDM_UP</strong></td>
<td align="center">231</td>
<td align="center">0.00543</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE15659_RESTING_TREG_VS_NONSUPPRESSIVE_TCELL_DN</strong></td>
<td align="center">226</td>
<td align="center">0.007273</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE3982_EOSINOPHIL_VS_NKCELL_DN</strong></td>
<td align="center">258</td>
<td align="center">0.0105</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE11864_CSF1_IFNG_VS_CSF1_PAM3CYS_IN_MAC_UP</strong></td>
<td align="center">265</td>
<td align="center">0.00826</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE14308_INDUCED_VS_NATURAL_TREG_UP</strong></td>
<td align="center">257</td>
<td align="center">0.005849</td>
</tr>
</tbody>
</table>

<table>
<caption>Table continues below</caption>
<colgroup>
<col width="74%" />
<col width="15%" />
<col width="10%" />
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
<td align="center"><strong>GSE24142_ADULT_VS_FETAL_EARLY_THYMIC_PROGENITOR_DN</strong></td>
<td align="center">Up</td>
<td align="center">0.001194</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE17721_CTRL_VS_POLYIC_2H_BMDM_UP</strong></td>
<td align="center">Up</td>
<td align="center">0.006042</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE15659_RESTING_TREG_VS_NONSUPPRESSIVE_TCELL_DN</strong></td>
<td align="center">Up</td>
<td align="center">0.00613</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE3982_EOSINOPHIL_VS_NKCELL_DN</strong></td>
<td align="center">Up</td>
<td align="center">0.006811</td>
</tr>
<tr class="odd">
<td align="center"><strong>GSE11864_CSF1_IFNG_VS_CSF1_PAM3CYS_IN_MAC_UP</strong></td>
<td align="center">Up</td>
<td align="center">0.007115</td>
</tr>
<tr class="even">
<td align="center"><strong>GSE14308_INDUCED_VS_NATURAL_TREG_UP</strong></td>
<td align="center">Up</td>
<td align="center">0.007375</td>
</tr>
</tbody>
</table>

<table style="width:88%;">
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

    ## R version 3.3.0 (2016-05-03)
    ## Platform: x86_64-w64-mingw32/x64 (64-bit)
    ## Running under: Windows 7 x64 (build 7601) Service Pack 1
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
    ## [1] dplyr_0.5.0         pander_0.6.0        lumi_2.18.0        
    ## [4] Biobase_2.26.0      BiocGenerics_0.12.1 limma_3.22.7       
    ## 
    ## loaded via a namespace (and not attached):
    ##  [1] nor1mix_1.2-1           splines_3.3.0          
    ##  [3] foreach_1.4.3           assertthat_0.1         
    ##  [5] bumphunter_1.6.0        affy_1.44.0            
    ##  [7] stats4_3.3.0            doRNG_1.6              
    ##  [9] Rsamtools_1.18.3        methylumi_2.12.0       
    ## [11] yaml_2.1.13             minfi_1.12.0           
    ## [13] RSQLite_1.0.0           backports_1.0.4        
    ## [15] lattice_0.20-33         quadprog_1.5-5         
    ## [17] digest_0.6.10           checkmate_1.8.1        
    ## [19] GenomicRanges_1.18.4    RColorBrewer_1.1-2     
    ## [21] XVector_0.6.0           colorspace_1.2-6       
    ## [23] htmltools_0.3.5         preprocessCore_1.28.0  
    ## [25] Matrix_1.2-6            plyr_1.8.4             
    ## [27] siggenes_1.40.0         XML_3.98-1.4           
    ## [29] biomaRt_2.22.0          genefilter_1.48.1      
    ## [31] zlibbioc_1.12.0         xtable_1.8-2           
    ## [33] brew_1.0-6              affyio_1.34.0          
    ## [35] BiocParallel_1.0.3      tibble_1.1             
    ## [37] openssl_0.9.4           annotate_1.44.0        
    ## [39] nleqslv_3.0.3           beanplot_1.2           
    ## [41] mgcv_1.8-14             pkgmaker_0.22          
    ## [43] IRanges_2.0.1           GenomicFeatures_1.18.7 
    ## [45] lazyeval_0.2.0          survival_2.39-5        
    ## [47] magrittr_1.5            mclust_5.2             
    ## [49] evaluate_0.9            fail_1.3               
    ## [51] nlme_3.1-128            MASS_7.3-45            
    ## [53] BiocInstaller_1.16.5    tools_3.3.0            
    ## [55] registry_0.3            BBmisc_1.10            
    ## [57] formatR_1.4             matrixStats_0.50.2     
    ## [59] stringr_1.1.0           sendmailR_1.2-1        
    ## [61] S4Vectors_0.4.0         locfit_1.5-9.1         
    ## [63] rngtools_1.2.4          AnnotationDbi_1.28.2   
    ## [65] Biostrings_2.34.1       base64_2.0             
    ## [67] GenomeInfoDb_1.2.5      grid_3.3.0             
    ## [69] RCurl_1.95-4.8          iterators_1.0.8        
    ## [71] base64enc_0.1-3         bitops_1.0-6           
    ## [73] rmarkdown_1.2           codetools_0.2-14       
    ## [75] multtest_2.22.0         DBI_0.5                
    ## [77] reshape_0.8.5           R6_2.1.3               
    ## [79] illuminaio_0.8.0        GenomicAlignments_1.2.2
    ## [81] knitr_1.14              rtracklayer_1.26.3     
    ## [83] rprojroot_1.1           KernSmooth_2.23-15     
    ## [85] stringi_1.1.1           BatchJobs_1.6          
    ## [87] Rcpp_0.12.6
