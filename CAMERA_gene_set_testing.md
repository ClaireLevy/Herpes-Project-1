Gene set tests of explant data
------------------------------

From the description of the `camera` function from limma:

"Test whether a set of genes is highly ranked relative to other genes in terms of differential expression, accounting for inter-gene correlation."

The user provides:

-   a filtered set of expression data (the same set that I used for doing differential expression analysis)

-   a design matrix (also the same as for DE analysis)

-   a contrast, or, the parts of the expression data we want to compare (in our case V186 24 hours vs Mock 24hrs)

-   a gene set of interest

Results
-------

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
<td align="center">13476</td>
<td align="center">0.001321</td>
<td align="center">Up</td>
<td align="center">0.0001454</td>
</tr>
</tbody>
</table>

Test 2
------

Also DE probes from the CELLS experiment, V186 treatment, but they are for all 3 time points (3hr, 8hr, 24hr) and are separated by whether the direction of DE was up or down.

Result from the second test

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
<td align="center">9236</td>
<td align="center">0.007301</td>
<td align="center">Up</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.24UP</strong></td>
<td align="center">6224</td>
<td align="center">0.02635</td>
<td align="center">Down</td>
</tr>
<tr class="odd">
<td align="center"><strong>CELLS_V186.8UP</strong></td>
<td align="center">1890</td>
<td align="center">0.03871</td>
<td align="center">Down</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.3UP</strong></td>
<td align="center">513</td>
<td align="center">0.03635</td>
<td align="center">Down</td>
</tr>
<tr class="odd">
<td align="center"><strong>CELLS_V186.8DOWN</strong></td>
<td align="center">1477</td>
<td align="center">0.05549</td>
<td align="center">Down</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.3DOWN</strong></td>
<td align="center">133</td>
<td align="center">0.03115</td>
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
<td align="center">0.00104</td>
<td align="center">0.006242</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.24UP</strong></td>
<td align="center">0.2304</td>
<td align="center">0.6499</td>
</tr>
<tr class="odd">
<td align="center"><strong>CELLS_V186.8UP</strong></td>
<td align="center">0.3893</td>
<td align="center">0.6499</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.3UP</strong></td>
<td align="center">0.4332</td>
<td align="center">0.6499</td>
</tr>
<tr class="odd">
<td align="center"><strong>CELLS_V186.8DOWN</strong></td>
<td align="center">0.5586</td>
<td align="center">0.6703</td>
</tr>
<tr class="even">
<td align="center"><strong>CELLS_V186.3DOWN</strong></td>
<td align="center">0.8354</td>
<td align="center">0.8354</td>
</tr>
</tbody>
</table>
