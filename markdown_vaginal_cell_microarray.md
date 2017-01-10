    ## Inputting the data ...
    ## Perform Quality Control assessment of the LumiBatch object ...

SOME PLOTS OF NON NORMALIZED DATA: LMF left sample 3E out of the analysis because it was determined that there was some kind of pipetting error. FH told me that when he looked at the analyzed data, 3E (donor 4, 24 hr, 186) looked very similar to the SD90 data but very different from the other 2 V186.24 replicates (samples 6D and 3D) so he didn't feel comfortable leaving it in the analysis. I am also leaving it out here.

Density plot, cdf plot, sample relations, boxplot. Looks like 3D and 6D are outliers, both are V186 24hrs.

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/raw%20data%20plots-1.png)![](markdown_vaginal_cell_microarray_files/figure-markdown_github/raw%20data%20plots-2.png)![](markdown_vaginal_cell_microarray_files/figure-markdown_github/raw%20data%20plots-3.png)![](markdown_vaginal_cell_microarray_files/figure-markdown_github/raw%20data%20plots-4.png)

    ## Perform vst transformation ...
    ## 2017-01-09 17:40:03 , processing array  1 
    ## 2017-01-09 17:40:03 , processing array  2 
    ## 2017-01-09 17:40:03 , processing array  3 
    ## 2017-01-09 17:40:03 , processing array  4 
    ## 2017-01-09 17:40:03 , processing array  5 
    ## 2017-01-09 17:40:03 , processing array  6 
    ## 2017-01-09 17:40:03 , processing array  7 
    ## 2017-01-09 17:40:03 , processing array  8 
    ## 2017-01-09 17:40:04 , processing array  9 
    ## 2017-01-09 17:40:04 , processing array  10 
    ## 2017-01-09 17:40:04 , processing array  11 
    ## 2017-01-09 17:40:04 , processing array  12 
    ## 2017-01-09 17:40:04 , processing array  13 
    ## 2017-01-09 17:40:04 , processing array  14 
    ## 2017-01-09 17:40:04 , processing array  15 
    ## 2017-01-09 17:40:04 , processing array  16 
    ## 2017-01-09 17:40:04 , processing array  17 
    ## 2017-01-09 17:40:04 , processing array  18 
    ## 2017-01-09 17:40:04 , processing array  19 
    ## 2017-01-09 17:40:04 , processing array  20 
    ## 2017-01-09 17:40:04 , processing array  21 
    ## 2017-01-09 17:40:04 , processing array  22 
    ## 2017-01-09 17:40:04 , processing array  23 
    ## 2017-01-09 17:40:04 , processing array  24 
    ## 2017-01-09 17:40:04 , processing array  25 
    ## 2017-01-09 17:40:04 , processing array  26

    ## Perform rsn normalization ...
    ## 2017-01-09 17:40:05 , processing array  1 
    ## 2017-01-09 17:40:06 , processing array  2 
    ## 2017-01-09 17:40:06 , processing array  3 
    ## 2017-01-09 17:40:06 , processing array  4 
    ## 2017-01-09 17:40:06 , processing array  5 
    ## 2017-01-09 17:40:06 , processing array  6 
    ## 2017-01-09 17:40:06 , processing array  7 
    ## 2017-01-09 17:40:06 , processing array  8 
    ## 2017-01-09 17:40:06 , processing array  9 
    ## 2017-01-09 17:40:06 , processing array  10 
    ## 2017-01-09 17:40:06 , processing array  11 
    ## 2017-01-09 17:40:06 , processing array  12 
    ## 2017-01-09 17:40:06 , processing array  13 
    ## 2017-01-09 17:40:06 , processing array  14 
    ## 2017-01-09 17:40:06 , processing array  15 
    ## 2017-01-09 17:40:07 , processing array  16 
    ## 2017-01-09 17:40:07 , processing array  17 
    ## 2017-01-09 17:40:07 , processing array  18 
    ## 2017-01-09 17:40:07 , processing array  19 
    ## 2017-01-09 17:40:07 , processing array  20 
    ## 2017-01-09 17:40:07 , processing array  21 
    ## 2017-01-09 17:40:07 , processing array  22 
    ## 2017-01-09 17:40:07 , processing array  23 
    ## 2017-01-09 17:40:07 , processing array  24 
    ## 2017-01-09 17:40:07 , processing array  25 
    ## 2017-01-09 17:40:07 , processing array  26

    ## Perform Quality Control assessment of the LumiBatch object ...

PLOTS OF NORMALIZED DATA

-   Note that 3D and 6D are still off by themselves. They represent V186 infection after 24hrs for TissueID 1 and 3. ![](markdown_vaginal_cell_microarray_files/figure-markdown_github/normalized%20plots-1.png)![](markdown_vaginal_cell_microarray_files/figure-markdown_github/normalized%20plots-2.png)![](markdown_vaginal_cell_microarray_files/figure-markdown_github/normalized%20plots-3.png) FILTERING PROBES BASED ON DETECTION Limma suggests to keep probes that are expressed above bg on at least n arrays where n is smallest number of replicates assigned to any of the treatment combinations.

Our treatment combinations are TissueID/Treatment/Time We have 3 Tissue IDs x 3 Treatments x 3 time points = 27 so the smallest number of replicates possible for any of those 3 arrays is 3

How many probes did we have before and after filtering?

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

    ## # A tibble: 6 x 3
    ##           variable  down    up
    ##             <fctr> <int> <int>
    ## 1   V186.3vsMock.3    97   321
    ## 2   V186.8vsMock.8    79   335
    ## 3 V186.24vsMock.24  6150  4926
    ## 4   SD90.3vsMock.3    47   101
    ## 5   SD90.8vsMock.8    74   402
    ## 6 SD90.24vsMock.24   287   254

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/number%20of%20up%20and%20down%20probes-1.png)

V186 vs mock at 3hr

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/tt1%20heatmap-1.png)

V186 vs mock at 8hr

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/tt2%20heatmap-1.png)

V186 vs mock at 24hr

\*There are only 2 samples for V186 because we removed a sample that may have had a pipetting error.

![](markdown_vaginal_cell_microarray_files/figure-markdown_github/tt3%20heatmap-1.png)

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

SessionInfo()
