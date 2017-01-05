Looking for housekeeping genes in human vaginal epithelial cell MA data
================

We would like to find a good housekeeping gene to use for qPCR with HSV2 infected and un-infected human vaginal epithelial cells. Here I will analyze the results of the microarray experiment that Lamar did for the Herpes P01 project to look for probes with the following criteria:

-   Probes for which there were at least 3 samples with detection p-values that were &lt;0.05. See documentation in my script that analyzes the HVE microarray data for rationale behind this choice.

-   Probes with small difference in log2 fold change (&lt;0.5) between mock and infected conditions.

-   Probes with large p-value between mock and infected (p &gt; 0.05)

The following plot shows all probes that meet the adjusted p-value and log2 fold change criteria with the endogenous controls highlighted in red.

![](HVE_housekeeping_genes_files/figure-markdown_github/plot%20probes-1.png)

Log2 fold change and Adjusted P-values for common endogenous controls that met filtering criteria
-------------------------------------------------------------------------------------------------

<table style="width:67%;">
<colgroup>
<col width="23%" />
<col width="15%" />
<col width="12%" />
<col width="15%" />
</colgroup>
<thead>
<tr class="header">
<th align="center">contrast</th>
<th align="center">TargetID</th>
<th align="center">logFC</th>
<th align="center">adj.P.Val</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td align="center">SD90.24vsMock.24</td>
<td align="center">B2M</td>
<td align="center">0.03754</td>
<td align="center">0.7134</td>
</tr>
<tr class="even">
<td align="center">SD90.24vsMock.24</td>
<td align="center">GAPDH</td>
<td align="center">0.05161</td>
<td align="center">0.6472</td>
</tr>
<tr class="odd">
<td align="center">V186.24vsMock.24</td>
<td align="center">GAPDH</td>
<td align="center">0.1</td>
<td align="center">0.2814</td>
</tr>
<tr class="even">
<td align="center">SD90.24vsMock.24</td>
<td align="center">HPRT1</td>
<td align="center">0.1236</td>
<td align="center">0.2358</td>
</tr>
<tr class="odd">
<td align="center">SD90.24vsMock.24</td>
<td align="center">RNA18s5</td>
<td align="center">-0.09868</td>
<td align="center">0.7396</td>
</tr>
<tr class="even">
<td align="center">SD90.24vsMock.24</td>
<td align="center">PGK1</td>
<td align="center">0.08576</td>
<td align="center">0.3095</td>
</tr>
<tr class="odd">
<td align="center">SD90.24vsMock.24</td>
<td align="center">PGK1</td>
<td align="center">-0.07011</td>
<td align="center">0.4036</td>
</tr>
<tr class="even">
<td align="center">SD90.24vsMock.24</td>
<td align="center">PPIA</td>
<td align="center">0.01263</td>
<td align="center">0.8428</td>
</tr>
<tr class="odd">
<td align="center">SD90.24vsMock.24</td>
<td align="center">RPLP0</td>
<td align="center">-0.1406</td>
<td align="center">0.3956</td>
</tr>
<tr class="even">
<td align="center">V186.24vsMock.24</td>
<td align="center">RPLP0</td>
<td align="center">0.3135</td>
<td align="center">0.08251</td>
</tr>
<tr class="odd">
<td align="center">V186.24vsMock.24</td>
<td align="center">RPLP0</td>
<td align="center">-0.0493</td>
<td align="center">0.7349</td>
</tr>
<tr class="even">
<td align="center">SD90.24vsMock.24</td>
<td align="center">TFRC</td>
<td align="center">0.01302</td>
<td align="center">0.8998</td>
</tr>
</tbody>
</table>
