---
layout: tutorial_hands_on

title: "03 Quality control of the data of the ChIP-Seq training"
zenodo_link: ""
questions:
  - "How to do quality control of the data"
objectives:
  - "Acquire basic knowledge of using GenePattern for data analysis"
time_estimation: "30m"
key_points:
  - "GenePattern"
  - "Quality control"
  - "ChIP-seq"
contributors:
  - janick-bits
  - morganeTC

---

## Quality control of the data of the ChIP-Seq training

Use FASTQC inside GenePattern to get basic information on the data (read length, number of reads, global quality of the datasets).

Read the GenePattern tutorial for more details on how to use GenePattern.
The data is already present on the GenePattern server. When you open a tool in GenePattern, you will find the **Add Paths or URLs button** in the **input files** section: 

![inputfiles](../../images/GPAddPaths.png)

Click the button and expand BITS trainingdata Chipseq: 

![inputfiles](../../images/GPSharedData.png)

The fastq file of the control data set is also available in the shared data folder (SRR576938.2.fastq)

> ### {% icon hands_on %} Generate and view the FASTQC report of SRR576933.2.fastq in GenePattern 
>
> - Search for **FASTQC** in the **Modules** section and open the parameter form.
> - Use the fastq file from the Shared Data folder as input file.
> - Leave the other parameters at their default values.
> - Run FASTQC
> FASTQC will generate a zip file and a html file. You can open the HTML report in your browser: 
> - Click the name of the output file at the bottom of the page.
> - Select **Open Link**
>   ![searchGEO](../../images/GP18.png)
{: .hands_on }

The only parameter you might want to change in if you work on your own data is the contaminants file. It contains a long list of known adapter sequences (see the Documentation in GenePattern). If for some reason the adapters you used are not in the list, you have to provide them as a fasta file. 

### {% icon question %} How many reads does the file contain?  

<details markdown='1'>
  <summary>Check the answer.</summary>

This is one of the results of the Basic statistics module in FASTQC (red): 

![fastqc9b](../../images/FASTQC9b.png)

Knowing that it is recommended for ChIPSeq to have around 30 million reads, the number of reads in this fastq file seems very low. 
</details>
{: .question }

### {% icon question %} Should we be concerned about the low number of reads in the sample?  

<details markdown='1'>
  <summary>Check the answer.</summary>

No it's not a problem because the sample comes from E. coli. This bacterium has a very small genome so 3 million reads will still generate high coverage. However, if this was a human or mouse sample the number of reads would be way too low and we would indeed be concerned. 

</details>
{: .question }

### {% icon question %} What is the length of the reads?  

<details markdown='1'>
  <summary>Check the answer.</summary>

This is one of the results of the Basic statistics module in FASTQC (green): 

![fastqc9b](../../images/FASTQC9b.png)

Again, you see that the data set consists of very short reads although this data set is very recent. This is because it has been shown that elongating the reads does not improve your results in ChIP-Seq analysis. It will just cost you more money.

</details>
{: .question }

### {% icon question %} Are there any positions with low sequence quality?  

<details markdown='1'>
  <summary>Check the answer.</summary>

This is shown in the Per base sequence quality module in FASTQC:

![fastqcpositions](../../images/FASTQC11b.png)

The overall sequence quality is good, although it drops sharply at the last position, but this is normal in Illumina data, so this feature is not raising hard concerns.

</details>
{: .question }

### {% icon question %} What could be the cause of the failure in the per base sequence content plot?  

<details markdown='1'>
  <summary>Check the answer.</summary>

The content of the 4 nucleotides is far from constant over all positions: 

![fastqcadapters](../../images/FASTQC12b.png)

This typically point the presence of adapter or other contaminating sequences in your reads. 

</details>
{: .question }

### {% icon question %} Which FASTQC module allows you to confirm this suspicion?  

<details markdown='1'>
  <summary>Check the answer.</summary>

The **Overrepresented sequences** module will show if your read file is enriched in known contaminants.

</details>
{: .question }

### {% icon question %} What does this module tell you?  

<details markdown='1'>
  <summary>Check the answer.</summary>

The **Overrepresented sequences** module shows a high percentage of adapter sequencess (29% !).

![fastqcadapters](../../images/FASTQC13b.png)

Again you see that adapter contamination is a frequently occurring problem of Illumina NGS data.

</details>
{: .question }

### {% icon question %} What about sequence duplication levels?  

<details markdown='1'>
  <summary>Check the answer.</summary>

There is sequence duplication. Adapter contamination will be partly responsible for the high duplication levels (the blue peaks at the far right of the plot) but the main cause lies in the technique itself. Typically, after ChIP, you end up with a very small initial amount of DNA (antibodies are not that effective, many cleanup steps in the protocol,...) and you have to do PCR to get your library up to a proper size for sequencing. So naturally, you expect many clones of the same DNA fragment due to the small initial size of the library. 

![fastqcadapters](../../images/FASTQC17b.png)

</details>
{: .question }

Now do the same for the control data set: **SRR576938.2.fastq**.

In theory one expects that regions with high read count in the ChIP sample represent the regions that were enriched by the immunoprecipitation, i.e. the regions that were bound to the protein. However many studies have shown that the read count is affected by many factors, including GC content, mappability, chromatin structure, copy number variations... To account for these biases, a control sample is used consisting of fragmented genomic DNA that was not subjected to immunoprecipitation or that was precipitated using a non-specific antibody.

### {% icon question %} How many reads does the control data set contain?  

<details markdown='1'>
  <summary>Check the answer.</summary>

This is one of the results of the **Basic statistics** module in FASTQC. You see that the control data set contains the double amount of reads as the ChIP data set.

The ChIP and control samples are usually sequenced at different depths, generating files with different total number of reads. This means that these two samples have to be made comparable later on in the analysis by normalization (see ChIP-Seq training).

</details>
{: .question }

### {% icon question %} What is the length of the reads in the control data set?  

<details markdown='1'>
  <summary>Check the answer.</summary>

This is one of the results of the **Basic statistics** module in FASTQC. You see that the control data set contains reads of 36 bases just like the ChIP data set.
</details>
{: .question }

### {% icon question %} Are there any positions with low sequence quality?  

<details markdown='1'>
  <summary>Check the answer.</summary>

This is shown in the Per base sequence quality module in FASTQC: 

![fastqc9b](../../images/FASTQC14b.png)

The overall sequence quality is good, although it drops sharply at the last position, but this is normal in Illumina data, so this feature is not raising hard concerns.

</details>
{: .question }

### {% icon question %} Why did the per base sequence quality plot raise a failure in the ChIP sample and not in the control?  

<details markdown='1'>
  <summary>Check the answer.</summary>

In the slides you can see that the thresholds for a warning are: 

- end of box < 10
- median < 25

![fastqcpositions](../../images/FASTQC14c.png)

On the figure you see that the culprit is the median:

- In the ChIP sample the median Phred score of the last position is 21 (so below 25) raising a failure
- In the control sample the median Phred score of the last position is 26 (so above 25)

</details>
{: .question }

### {% icon question %} Which FASTQC module gives a failure?  

<details markdown='1'>
  <summary>Check the answer.</summary>

The **Per tile sequence quality** module. The quality of one of the tiles is consistently different from the rest of the tiles

![fastqcadapters](../../images/FASTQC15b.png)

</details>
{: .question }

### {% icon question %} Is this also the case in the ChIP sample?  

<details markdown='1'>
  <summary>Check the answer.</summary>

Yes, you see exactly the same problem in the ChIP sample. Since both samples were probably loaded on the same lane, it seems normal that you see the same problem in the ChIP sample.

![fastqcadapters](../../images/FASTQC15c.png)

</details>
{: .question }

### {% icon question %} Why does the Sequence duplication levels modules give a failure in the control sample?  

<details markdown='1'>
  <summary>Check the answer.</summary>

The duplication levels in the control data set are high. 

![fastqcadapters](../../images/FASTQC15d.png)

There are a high number of sequences with low duplication levels which could be due to high coverage. Remember that you are working with E. coli which has a small genome.

</details>
{: .question }

### Estimation of coverage

Knowing your organism size is important to evaluate if your data set has sufficient coverage to continue your analyses, e.g. for the human genome (3 Gb), 10 million reads are considered sufficient.

### {% icon question %} What is the size of the genome of the E. coli K-12 strain substr. MG1655??  

<details markdown='1'>
  <summary>Check the answer.</summary>

- Go to the [NCBI website](http://www.ncbi.nlm.nih.gov/)
- Select the **Genome** database to search in
- Type **Escherichia coli** in the search term box
- Click **Search**

![fastqcadapters](../../images/Genome2.png)

The genome is 4.64 Mbase. 

</details>
{: .question }

The FASTQC report has shown that the fastq files of the ChIP and control sample contain 3.6 and 6.7 million reads respectively. As you aim for 10 million reads for 3 Gb in human, we can assume that these data sets contain enough reads for proper analysis. 