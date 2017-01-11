Comparing CAMERA results when treatments in pData are reversed
================
Claire Levy
January 10, 2017

When I do a CAMERA gene set test using the up and down DE probes from V186.24 HVE as a gene set and compare with the explant data for the same virus and timepoint, I get a significant result for the DOWN regulated gene set, but the corresponding (tested)probes from the explant study are UP regulated relative genes not in the set. This seemed strange and made me wonder what would happen if I reversed the designations for "Mock" and "Treatment"

I did the following here:

-   Subset the explant microarray to only include V186 and Mock data

-   Reverse the labels for V186 and Mock

-   Differential expression analysis as for the original microarray

-   Do a CAMERA test with the new label-reverse microarray data

CAMERA results
--------------

A CAMERA test using the DE probes for V186.24 from the HVE experiment as the gene set gives the following result:

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
<td align="center">8681</td>
<td align="center">0.01534</td>
<td align="center">Down</td>
<td align="center">0.01985</td>
<td align="center">0.03969</td>
</tr>
<tr class="even">
<td align="center"><strong>UP</strong></td>
<td align="center">5590</td>
<td align="center">0.01861</td>
<td align="center">Up</td>
<td align="center">0.1442</td>
<td align="center">0.1442</td>
</tr>
</tbody>
</table>
