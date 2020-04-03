---
layout: tutorial_hands_on

title: "05 Peak calling with MACS"
zenodo_link: "https://data.bits.vib.be/pub/trainingen/PSA/"
questions:
  - "Download the data from GEO or ENA"
objectives:
  - "Basic knowledge of downloading data from GEO or ENA"
time_estimation: "15m"
key_points:
  - "SRA ID"
  - "GEO"
  - "ENA"
contributors:
  - janick-bits
  - morganeTC
---

Using the mapping results we can define the peaks, the regions with a high density of reads in the ChIP sample, where the transcription factor was bound.
There are multiple programs to perform the peak calling. Some are more directed towards histone marks (broad peaks) while others are specific to narrow peaks (transcription factors). Here we will use MACS because it's known to produce generally good results, and it is well-maintained by the developer.

MACS is installed on GenePattern. Check the documentation on GenePattern or read the manual on [the MACS github](https://github.com/taoliu/MACS/). Let's see the parameters of MACS before launching the peak calling.

> How to define the input files?  
> **treatment** and **control**: the treatment mapped read file (SRR576933.bam) and the control mapped read file (SRR576938.bam)

Note that the bam files need to be sorted according to genomic location. At this point they are not, the reads are in the same order as they were in the fastq file, according to position on the flow cell.

> Which Picard tool can we use to sort the files? 
> You can use Picard.SortSam for this.

> Sort the bam files so that they can be used as input for MACS. 
> Use the default parameter settings.

Let's go over the different parameters of MACS: 
The **effective genome size** is the size of the genome considered "usable" for peak calling. This value is given by the MACS developers on their website. It is smaller than the complete genome because many regions are excluded (telomeres, highly repeated regions...). The default value is for human (2700000000), so we need to change it. As the value for <i>E. coli</i> is not provided, we will take the complete genome size **4639675**.

MACS needs the length of the fragments, which are longer than the read length, because the sequencer sequences only parts starting from the end of the fragments. MACS2 does this by making a model of enrichment of reads in the ChIP sample versus the background, searching pairs of peaks within a bandwidth of 300 bases with an enrichment ratio between 5 and 50. If there are not enough pairs of peaks, as is the case in our data, you can fall back on using a preset fragment length by setting the **model** parameter to **no**. The default of **shift 0 extsize 200** is adequate for ChIPSeq. It means that reads are extended to a length of 200 bases before they are counted.

The **duplicates** specifies how MACS should treat the reads that are mapped to the exact same location (duplicates). The manual specifies that keeping only 1 representative of these "stacks" of reads is giving the best results.

The **make BedGraph** parameter will output a file in BEDGRAPH format to visualize the peak profiles in a genome browser. There will be one file for the treatment, and one for the control.

**FDR** and **FDR for broad peaks** indicates that MACS will report peaks if their associated p-value is lower than the value specified here. Use a relaxed threshold as you want to keep a high number of peaks (even if some of them are false positives).

> Perform peak calling on the sorted bam files. 
> Set the parameters as described above: 

- Load sorted bam files for treatment and control
- Set effective genome size to 4639675
- Don't use a model
- Make a bedgraph file

Look at the files that were created by MACS.

> Which files contains which information?
> 
- macs_summits.bed: location of the summit base for each peak (BED format).If you want to find the motifs at the binding sites, this file is recommended. The file can be loaded directly to the UCSC genome browser. Remove the beginning track line if you want to analyze it by other tools.
- macs_peaks.xls: peak coordinates with more information, to be opened with Excel. Information include:

- chromosome name
- start position of peak
- end position of peak
- length of peak region
- absolute peak summit position
- pileup height at peak summit
- -log10(pvalue) for the peak summit (e.g. pvalue =1e-10, then this value should be 10)
- fold enrichment for this peak summit against random Poisson distribution with local lambda
- -log10(qvalue) at peak summit

Coordinates in XLS is 1-based which is different from BED format. 

- MACS_peaks.narrowPeak is a BED file which contains the peak locations together with peak summit, p-value, and q-value. You can load it to the UCSC genome browser. Definition of some specific columns are:

- 5th: integer score for display. It's calculated as int(-10*log10pvalue) or int(-10*log10qvalue) depending on whether -p (pvalue) or -q (qvalue) is used as score cutoff.
- 7th: fold-change at peak summit
- 8th: -log10pvalue at peak summit
- 9th: -log10qvalue at peak summit
- 10th: relative summit position to peak start

The file can be loaded directly to the UCSC genome browser. Remove the beginning track line if you want to analyze it by other tools.
- The MACS_treat_pileup.bdg and MACS_control_lambda.bdg files are in bedGraph format which can be imported to the UCSC genome browser or be converted into even smaller bigWig files. The MACS_treat_pileup.bdg contains the pileup signals (normalized) from the ChIP sample. The MACS_control_lambda.bdg contains local biases estimated for each genomic location from the control sample.
