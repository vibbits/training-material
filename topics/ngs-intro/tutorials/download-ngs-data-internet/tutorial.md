---
layout: tutorial_hands_on

title: "01 Downloading NGS data from the internet"
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
---

### Introduction

#### NGS data repositories

First of all, you need data to analyze. You can generate your own data but there's a lot of NGS data available on the internet.

The main repositories for NGS data:

{|class="wikitable"
| align="center" style="background:#f0f0f0;"|''''''
| align="center" style="background:#f0f0f0;"|'''NCBI - US'''
| align="center" style="background:#f0f0f0;"|'''EBI - Europe'''
|-
| ||||Close-by so faster downloads
|-
|'''Gene expression database'''||[http://www.ncbi.nlm.nih.gov/geo/ GEO]||[http://www.ebi.ac.uk/arrayexpress ArrayExpress]
|-
|Contain processed NGS data, no raw data||ID starts with G||ID starts with E-
|-
|'''NGS sequence database'''||[http://www.ncbi.nlm.nih.gov/sra SRA]||[http://www.ebi.ac.uk/ena ENA]
|-
|Contain raw NGS data||ID starts with SR||ID starts with ER
|-
| ||ENA IDs also used by SRA||SRA IDs also used by ENA 
|-
| ||stores reads in sra format||stores reads in fastq format
|}


Both GEO and SRA use multiple types of IDs, ordered according to a certain hierarchy:

{|class="wikitable"
| align="center" style="background:#f0f0f0;"|'''GEO ID'''
| align="center" style="background:#f0f0f0;"|'''points to'''
| align="center" style="background:#f0f0f0;"|'''definition'''
|-
|ID starts with GSE||experiment||Data of a full NGS experiment consisting of multiple samples The samples belong to different groups that are to be compared e.g. treated and control samples
|-
|ID starts with GSM||sample||Data of one single sample 
|-
| align="center" style="background:#f0f0f0;"|'''SRA ID'''
| align="center" style="background:#f0f0f0;"|'''points to'''
| align="center" style="background:#f0f0f0;"|'''definition'''
|-
|ID starts with SRP||study||Studies have an overall goal and may comprise several experiments. 
|-
|ID starts with SRX||experiment||An Experiment describes what was sequenced and the method used.
Info on the source of the DNA, samples, sequencing platform and the processing of the data. 
|-
|ID starts with SRR||run||Data of a particular sequencing experiment.
Experiments may contain many runs depending on the number of instrument runs that were needed.
|}


There are two other resources of NGS data:

- [https://insilicodb.org/ In Silico DB] from the ULB <ref name="insilicoDB">https://insilicodb.org/</ref>
- [http://www.illumina.com/science/data_library.ilmn Illumina's NGS data library] <ref name="Illumina Sequence Data Library">http://www.illumina.com/science/data_library.ilmn</ref>



If you have an article describing an NGS dataset that is of interest to you, you should search in the article for a sentence mentioning the ID of the data in one of these databases.


#### Metadata of NGS data sets

You do not only need the data, you also need extra inforrmation to be able to do the analysis. For instance, you need to know where each sample comes from: in clinical datasets it is important to know if the reads are coming from a patient or from someone in the control group...
This kind of information is called metadata and is stored together with the actual data.

### Exercise 1: Downloading a data set for the introduction training

For the introduction training we will use a data set containing short Illumina reads from *Arabidopsis thaliana* infected with a pathogen, *Pseudomonas syringae*, versus mock treated controls. The data set is described in [the article of Cumbie et al., 2011](http://www.ncbi.nlm.nih.gov/pmc/articles/PMC3188579/).

The authors provide an ArrayExpress ID (**E-GEOD-25818**) in the section **Analysis of a pilot RNA-Seq experiment**, but this ID points to Affymetrix microarray data and not to NGS data:
Go to [the ArrayExpress home page](https://www.ebi.ac.uk/arrayexpress/)

> Find the description of the experiment with ArrayExpress ID E-GEOD-25818 ?
|-
|
- Type the ID in the search box on the ArrayExpress home page
- Click **Search**

{{Wiki-img|NGS/Intro/AE1.png|500px}}

You see that the experiment is stored as a **Transcription profiling by array** experiment (red) and that **Affymetrix GeneChip Arabidopsis Genome [ATH1-121501]** is the platform that was used (green).
- Click the **Click for detailed sample information and links to data** link (blue)

{{Wiki-img|NGS/Intro/AE2.png|500px}}

You see that you will download .CEL files, the file type for storing raw Affymetrix **microarray** data.

|}

{{Warning | So you see that IDs that are provided in articles are not always accurate !}}

Fortunately I could find the data in NCBI's SRA database, so we know the SRA ID. Since the connection with NCBI is too slow, we will do the download from ENA using the SRA ID.

Go to [the EBI website](http://www.ebi.ac.uk/).

> Download the data set with SRA ID SRR074262 from ENA ?

- Type **SRR074262** in the search box
- Click **Search**

{{Wiki-img|NGS/Intro/SRA1.png|500px}}

Since we are using an SRA run ID as a search term, we do a very specific search so the search returns a single SRA record:

{{Wiki-img|NGS/Intro/SRA2.png|500px}}

- Click the SRA run ID on the results page to go to [http://www.ebi.ac.uk/ena/data/view/SRR074262&display=html the ENA record containing the actual data of the run]
- Scroll to the table at the bottom of the page
- Click the link in the **Fastq files (ftp)** column (red): 

{{Wiki-img|NGS/Intro/SRA6A.png|700px}}

|}

It can take some time to download the file since it's very big. Firefox will give you an estimate on how long it's going to take. If it takes too long, cancel the download and use the file that is already present on the BITS laptops in the **/Documents/NGSdata** folder as **SRR074262.fastq**.

In a normal analysis we would of course download all 6 data files of this study. It's only because of time limits that we will only use a single sample during the training. If you are analyzing the 6 samples you need to take a look at the metadata to know which samples represent controls and which samples represent the treatment (in this case treatment with a plant pathogen).

In ENA and SRA, annotation is found in the record of the NGS study.

> Go to the ENA record of the study the downloaded sample belongs to and look at the grouping of the samples.
|-
|

- Click the SRA ID of the study the downloaded sample belongs to (green) to access the record of the study:

{{Wiki-img|NGS/Intro/SRA6A.png|700px}}

- Click the **Select columns** link on the **Read files** tab to visualize all the fields with metadata that you can visualize.
{{Wiki-img|NGS/Intro/SRA6B.png|200px}}

- Deselect the fields that you are not interested in and select the fields you want to view; If you are interested in the grouping of the samples you need to select **Library name**(red): 

{{Wiki-img|NGS/Intro/SRA6C.png|700px}}

This adds a column called **Library name** in the table containing the grouping annotation of the samples.
- If you want to know exactly what the names mean, you have to consult [http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0025279 the paper that describes the analysis of the data set]. In the **RNA preparation and sequencing** section you see that hrcC means infected with the pathogen, while MgCL2 represent the control treatment
{{Wiki-img|NGS/Intro/SRA6D.png|500px}}


The sample that we have downloaded for the introduction training thus comes from the group of infected samples. 
|}


### Exercise 2: Downloading a data set for the ChIP-Seq training
*Exercise created by Morgane Thomas-Chollier*

For the ChIP-Seq training, we are going to use the data set that is described in [http://www.ncbi.nlm.nih.gov/pubmed/23818864 the article of Myers et al., 2013] <ref>http://www.ncbi.nlm.nih.gov/pubmed/23818864</ref>. The article contains the following sentence at the end of the Materials and Methods section:
"All genome-wide data from this publication have been deposited in NCBI’s Gene Expression Omnibus (GSE41195)."
In this case **GSE41195** is the ID of the experiment in the GEO database.

Go to [http://www.ncbi.nlm.nih.gov/geo/ the GEO home page]

> Download the data of the experiment with GEO ID GSE41195 ?
|-
|
- Type the ID in the search box on the GEO home page
- Click **Search**

{{Wiki-img|NGS/Intro/GEO1.png|200px}}

This redirects you to the GEO record of the experiment.

{{Wiki-img|NGS/Intro/GEO2.png|400px}}

In the **Experiment type** section you can see that this GEO record is a mixture of expression analysis and ChIP-Seq.
- Scroll to the bottom of the page:

{{Wiki-img|NGS/Intro/GEO3.png|400px}}

You can see that the data of the ChIP-Seq experiment have their own identifier: GSE41187

- Click the ChIP-Seq data identifier.
This brings us on the GEO record of the ChIP-Seq experiment.
- Scroll down to the **Samples** section:

{{Wiki-img|NGS/Intro/GEO4.png|400px}}

Note that GEO contains the grouping annotation here in the **Samples** section.
For time's sake, we will focus on a single sample: FNR IP ChIP-seq Anaerobic A
- Click the ID **GSM1010219** of that sample to go to the GEO record of the sample
- Scroll to the bottom of the page to the **Relations** section:

{{Wiki-img|NGS/Intro/GEO5.png|400px}}

GEO only contains processed NGS, no raw data. The corresponding raw data is stored in the SRA database. In the **Relations** section you can find the SRA ID of this data set. For the training we need a fastq file containing raw data.
- Copy the SRA ID of the ChIP-Seq experiment (SRX189773)

|}

Again, it will take too long to download the data from NCBI. So we will do the download from EBI.

Go to [http://www.ebi.ac.uk/ the EBI website].

> Download the data with SRA ID SRX189773 ?
|-
|
- Type the ID in the search box on the EBI home page
- Click **Search**

{{Wiki-img|NGS/Intro/ENA1.png|300px}}

This returns two results: a link to the record of the experiment and a link to the record of the run:

{{Wiki-img|NGS/Intro/ENA2.png|400px}}

- Click the record of the full experiment (red)

{{Wiki-img|NGS/Intro/ENA3.png|600px}}

The table at the bottom of the page contains a column called **Fastq files (ftp)**
- Click the link in this column to download the data in fastq format

|}

It took only a few minutes to download the data on my laptop at work, but the internet connection at work will be faster than the one in the training room. Firefox will give you an estimate of the time it takes for the download. If it is too long, cancel the download and use the file that has already been downloaded and is available on the BITS laptops:

- on Windows: in the **/Documents/NGSdata** folder as **SRR576933.fastq**
- In Linux: in the **/home/bits/NGS/ChIPSeq** folder as **SRR576933.fastq**


ChIP-Seq always compares the ChIP sample to a control sample, consisting of genomic DNA isolated from cells that were cross-linked and fragmented under the same conditions as the ChIP sample or of DNA fragments isolated in a “mock” ChIP reaction using an antibody that reacts with an irrelevant, non-nuclear protein.

In this data set, control samples consist of full genomic DNA. To download a control sample, we should redo the same steps starting from the GEO record of the ChIP-Seq experiment and click the GEO sample ID of the **anaerobic INPUT DNA** sample... However, the fastq file is available in the same data folders (SRR576938.fastq)


### Downloading data sets via Linux command line

See Linux command line training pages

### Downloading data sets via R

*Exercise created by Stephane Plaisance*

Once you know the SRA or ENA ID of the data set you can download the data and the metadata automatically via an R script.
See [http://wiki.bits.vib.be/index.php/NGS_RNASeq_DE_Exercise.1#Obtain_data_and_metadata_from_ENA_using_R the exercises of the RNA-Seq training] to learn how to do this.
