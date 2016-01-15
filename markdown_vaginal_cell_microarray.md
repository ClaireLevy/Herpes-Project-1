"Vaginal cell herpes infection experiment"

    ## Inputting the data ...
    ## Perform Quality Control assessment of the LumiBatch object ...

SOME PLOTS OF NON NORMALIZED DATA: LMF left sample 3E out of the analysis because it was determined that there was some kind of pipetting error. FH told me that when he looked at the analyzed data, 3E looked very similar to the SD90 data but very different from the other 2 V186.24 replicates (samples 6D and 3D) so he didn't feel comfortable leaving it in the analysis. I am also leaving it out here.

Density plot, cdf plot, sample relations, boxplot. Looks like 3D and 6D are outliers, both are V186 24hrs.

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-2-1.png) ![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-2-2.png) ![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-2-3.png) ![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-2-4.png)

    ## Perform vst transformation ...
    ## 2016-01-15 13:49:16 , processing array  1 
    ## 2016-01-15 13:49:16 , processing array  2 
    ## 2016-01-15 13:49:16 , processing array  3 
    ## 2016-01-15 13:49:16 , processing array  4 
    ## 2016-01-15 13:49:16 , processing array  5 
    ## 2016-01-15 13:49:16 , processing array  6 
    ## 2016-01-15 13:49:17 , processing array  7 
    ## 2016-01-15 13:49:17 , processing array  8 
    ## 2016-01-15 13:49:17 , processing array  9 
    ## 2016-01-15 13:49:17 , processing array  10 
    ## 2016-01-15 13:49:17 , processing array  11 
    ## 2016-01-15 13:49:17 , processing array  12 
    ## 2016-01-15 13:49:17 , processing array  13 
    ## 2016-01-15 13:49:17 , processing array  14 
    ## 2016-01-15 13:49:17 , processing array  15 
    ## 2016-01-15 13:49:17 , processing array  16 
    ## 2016-01-15 13:49:17 , processing array  17 
    ## 2016-01-15 13:49:17 , processing array  18 
    ## 2016-01-15 13:49:17 , processing array  19 
    ## 2016-01-15 13:49:17 , processing array  20 
    ## 2016-01-15 13:49:17 , processing array  21 
    ## 2016-01-15 13:49:18 , processing array  22 
    ## 2016-01-15 13:49:18 , processing array  23 
    ## 2016-01-15 13:49:18 , processing array  24 
    ## 2016-01-15 13:49:18 , processing array  25 
    ## 2016-01-15 13:49:18 , processing array  26

    ## Perform rsn normalization ...
    ## 2016-01-15 13:49:19 , processing array  1 
    ## 2016-01-15 13:49:19 , processing array  2 
    ## 2016-01-15 13:49:19 , processing array  3 
    ## 2016-01-15 13:49:19 , processing array  4 
    ## 2016-01-15 13:49:19 , processing array  5 
    ## 2016-01-15 13:49:20 , processing array  6 
    ## 2016-01-15 13:49:20 , processing array  7 
    ## 2016-01-15 13:49:20 , processing array  8 
    ## 2016-01-15 13:49:20 , processing array  9 
    ## 2016-01-15 13:49:20 , processing array  10 
    ## 2016-01-15 13:49:20 , processing array  11 
    ## 2016-01-15 13:49:20 , processing array  12 
    ## 2016-01-15 13:49:20 , processing array  13 
    ## 2016-01-15 13:49:20 , processing array  14 
    ## 2016-01-15 13:49:20 , processing array  15 
    ## 2016-01-15 13:49:21 , processing array  16 
    ## 2016-01-15 13:49:21 , processing array  17 
    ## 2016-01-15 13:49:21 , processing array  18 
    ## 2016-01-15 13:49:21 , processing array  19 
    ## 2016-01-15 13:49:21 , processing array  20 
    ## 2016-01-15 13:49:21 , processing array  21 
    ## 2016-01-15 13:49:21 , processing array  22 
    ## 2016-01-15 13:49:21 , processing array  23 
    ## 2016-01-15 13:49:22 , processing array  24 
    ## 2016-01-15 13:49:22 , processing array  25 
    ## 2016-01-15 13:49:22 , processing array  26

    ## Perform Quality Control assessment of the LumiBatch object ...

PLOTS OF NORMALIZED DATA: all data, then just 6D and 3D

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-3-1.png) ![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-3-2.png) ![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-3-3.png) FILTERING PROBES BASED ON DETECTION Limma suggests to keep probes that are expressed above bg on at least n arrays where n is smallest number of replicates assigned to any of the treatment combinations.

Our treatment combinations are TissueID/Treatment/Time We have 3 Tissue IDs x 3 Treatments x 3 time points = 27 so the smallest number of replicates possible for any of those 3 arrays is 3

how many probes did we have before and after filtering?

    ##          detection exprs se.exprs
    ## Features     47323 47323    47323
    ## Samples         26    26       26

    ##          detection exprs se.exprs
    ## Features     22894 22894    22894
    ## Samples         26    26       26

How many removed?

    ##          detection exprs se.exprs
    ## Features     24429 24429    24429
    ## Samples          0     0        0

How many probes are up and down regulated for each contrast?

    ## Source: local data frame [6 x 3]
    ## 
    ##           variable  down    up
    ##             (fctr) (int) (int)
    ## 1   V186.3vsMock.3    97   321
    ## 2   V186.8vsMock.8    79   335
    ## 3 V186.24vsMock.24  6150  4926
    ## 4   SD90.3vsMock.3    47   101
    ## 5   SD90.8vsMock.8    74   402
    ## 6 SD90.24vsMock.24   287   254

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-9-1.png)

V186 vs mock at 3hr

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-10-1.png)

V186 vs mock at 8hr

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-11-1.png)

V186 vs mock at 24hr

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/unnamed-chunk-12-1.png)

    ## $CELLS_V186.3
    ## NULL
    ## 
    ## $CELLS_V186.8
    ## NULL
    ## 
    ## $CELLS_V186.24
    ## NULL

    ## $CELLS_V186.3
    ## NULL
    ## 
    ## $CELLS_V186.8
    ## NULL
    ## 
    ## $CELLS_V186.24
    ## NULL
