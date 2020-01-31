---
layout: tutorial_hands_on

title: "02 OTU creation using LotuS"

questions:
  - "How to use the LotuS pipeline?"

objectives:
  - "learn how to create a genus abundance tablei with LotuS"
  - "learn what information is needed in the experiment annotation file"
  - "learn how to apply quality filters with sdm"
  - "learn how to demultiplex the raw data files"
  - "learn how to execute LotuS pipeline"
  - "learn how to assign various taxonomies"

time_estimation: "60m"

key_points:
  - "We showed how to use the LotuS pipeline with 454 and Miseq raw data"
  - "We showed how to assign taxonomies to output of LotuS pipeline"
  - "We showed how to create a genus abundance table"

contributors:
  - hildebra 

---

# OTU creation using LotuS 
{:.no_toc}

In this tutorial we will create a genus abundance table from two 454 sequencer runs using a pipeline called LotuS. A genus abundance table contains counts of different genera in a several of samples – Rows are the different genera and columns the samples. As a simple example, take a look at this table:

|                     |        |       |        |       |      |
|:--------------------|:-------|:------|:-------|:------|:-----|
|Genus	              | bl10   |bl11   |bl12	|bl128	|bl13  |
|Bacteria             |24      |52     |39	|63	|181   |
|Bacteroides	      |169     |27     |7	|42	|6     |
|Porphyromonadacea    |370     |346    |621	|565	|224   |

This table tells us how often we observe unclassified Bacteria, Bacteroides and unclassified Porphyromonadaceae in the 5 samples bl10, bl11, bl12, bl128 and bl13. A matrix like this will be used for the next tutorial on numerical ecology and created from raw sequence data within this tutorial.

## The data

In a recent experiment, we sequenced 73 samples in two 454 runs, the raw fasta and quality files are in `/home/VIBTrainingX/metagenomics/` on the bits server. For each run we have a fasta (.fna) and quality (.qual) file. Go to this directory using the command `cd` and become aware of the files required from the experimenter (command `ls`). You can always take a look at files and their contents using viewing commands like `less`.

The sequence files were multiplexed before the experiment, that is a small nucleotide sequence – the barcode - was attached to each read, specific for each experiment. A mapping file is typically used, containing the link between a sequence barcode and the name of the experiment and is essential to demultiplex the fasta files. 

## The tools

LotuS is actually a set of tools that were installed in the `/opt/` folder. First go to [the lotus website](http://psbweb05.psb.ugent.be/lotus/) and familiarize yourself with the basic documentation.

To start the exercises, go to the directory where Lotus is installed. 
```bash
cd /opt/lotus-1.62/lotus_pipeline/
```

From this directory you can run all the tools. To reach all data files (e.g. input files) you have to provide the path to the files: `~/metagenomics/`

## The analysis

### Creation of Mapping file. 

[An Excel](http://data.bits.vib.be/pub/trainingen/metagenomics/Mice_experiment.xlsx) is provided, with some basic experiment annotation. The fwd primer is given as `ACTYAAAKGAATTGACGG`, but if you search for the primer sequence in the reads (in one of the .fna files) you will not find it because you need to reverse translate the primer sequence first using [http://www.bioinformatics.org/sms/rev_comp.html this tool]. So you see annotation provided by the provider is not always correct.
 
Lotus needs experiment annotation to map input files to barcodes. Based on the documentation on [http://psbweb05.psb.ugent.be/lotus/documentation.html#MapFile the Lotus website], create a mapping file for this experiment. This means that you need to replace the column headers of the Excel file to terms that are accepted by Lotus and that you have to indicate that there is a .fna and a .qual file for each run. The header line should be preceeded by a `#`. The mapping file should at least contain four columns with the following headers:

* SampleID
* BarcodeSequence
* fnaFile
* qualFile

Save the file as a tab-delimited text file.

You can always test the validity of your mapping file with the command 
```bash
./lotus.pl -check_map [your mapping file]
```

If you have fastq files as input the fnaFile and qualFile columns would be replaced by one fastqFile column.

### Changing  the data format of the input files.

Sometimes you need to transcribe data from one format to another. For instance we could transform the fasta files (.fna) to fastq files (.fq). This can be done with the program `sdm`, that is part of the LotuS pipeline. Take a look at the sdm help by typing `./sdm` and exploring the options, e.g.
 
```bash
./sdm -help_commands
```

Then, using command line arguments, transcribe the fasta + qual files of the Anh experiment into fastq files. Take a look at output and log files created by sdm.

> ### {% icon hands_on %} Hands-on: Exercise 1 
>
>  > ### {% icon question %} Question
>  > 
>  > How to transform fasta + qual files into fastq files ?
>  >
>  > > <details markdown="1">
>  > > <summary>{% icon solution %} Solution
>  > > </summary>
>  > > ```bash
>  > > sudo ./sdm -i_fna ~/metagenomics/Anh.1.fna -i_qual ~/metagenomics/Anh.1.qual -o_fastq t1.fq
>  > > ```
>  > > </details>
>  >
>  {: .question }
{: .hands_on }

In the lotus_pipeline folder the fastq file t1.fq was generated, to take a look at the file use
```bash
head t1.fq
```

Do the same for the t1.log file: you see that sdm is not only used to transform fasta into fastq files but it is also capable of doing quality filtering on the raw reads files.

### Setting up a quality filter of the input sequence files.

Since we want to make sure the quality filtering of the input file is strict, LotuS offers several quality filtering options. Quality settings are different for different data formats, that´s why Lotus offers a file with specific settings for each platform. Since we have 454 data we will take a look at the file sdm_454.txt.
```bash
less sdm_454.txt
``` 

Read the comments (line starting with “#”) to each option and think which quality filtering options might be important in order to create OTUs from the raw sequences. (Hint: an OTU is a clustering of similar sequences with the aim to have one cluster of sequences for each species that was originally present in the samples. Take into account that sequencing machines make errors and that PCR amplification of the 16S rDNA is similarly with errors). Think about a set of parameters, including the statistical information from step 2, and save these in your copy of sdm_options.txt for later use.

Check the sdm [quality filter settings](http://psbweb05.psb.ugent.be/lotus/documentation.html#SDMconfig). Some of the default filter settings are:

* MinSeqLength=250 : Only use reads of at least 250 nt long after processing (remember we are working with long reads from 454 sequencing)
* TruncateSequenceLength = 250 : Cut all reads after 250 nt
* QualWindowWidth = 50 and QualWindowThreshold = 25 : Remove all reads where average quality is <= 25 over a 50bp window
* maxAccumulatedError = 0,5 : Remove all remaining bases when accumulated error score >= 0,5</li>
* maxHomonucleotide = 8 : Remove all reads with a homonucleotide run (repeat of same nt) >= 8
* RejectSeqWithoutFwdPrim = TRUE : Remove all reads that do not contain the forward primer

### Demultiplexing  and quality filter the input files.

For this step you will need the mapping file from Step 1 and the file with the quality filtering settings for 454 data. Use the sdm command to demultiplex and filter all input files at the same time into a local folder ''demultDir''. First create the folder where the demultiplexed files will be written in ~/metagenomics/:
```bash
mkdir ~/metagenomics/demultDir
```

Since the mapping file contains information on all files, you have to provide an input path to the folder that contains the input files (.fna + .qual) to sdm.

> ### {% icon hands_on %} Hands-on: Exercise 2 
>
>  > ### {% icon question %} Question
>  > How to demultiplex and quality filter files ? 
>  >
>  > > <details markdown="1">
>  > > <summary>{% icon solution %} Solution
>  > > </summary>
>  > > ```bash
>  > > ./sdm -i_path ~/metagenomics/ -o_fastq t1.fq -o_demultiplex ~/metagenomics/demultDir/ -map ~/metagenomics/map.txt -options sdm_454.txt 
>  > > ```
>  > > Input is the folder containing the .fna and .qual files. The demultiplexing will fill the demultDir folder with fastq files.
>  > > </details>
>  >
>  {: .question }
{: .hands_on }

Discuss the output files and what each of these represents. In this experiment multiple samples were sequenced in the same lane. Two lanes were used, each containing 37 samples. After sequencing, this results in two files with reads. To know which sample a read comes from, unique bar codes are incorporated into the adapter sequences. One specific bar code for each sample. In this step reads from different samples (but from the same lane thus in the same fasta file) are split over separate fastq files, one for each sample. 

### Mapping file creation when sequence provider provides demultiplexed files.

Now that you have demultiplexed the files into a single folder, you might be aware that sequence providers often deliver files in this format: already demultiplexed into single files. In this case slight modifications to the mapping file are enough to change the input from non-demultiplexed large file(s) to demultiplexed-many-small-files.

Note that lotus has a special script that creates the mapping file for you in this case. The script is autoMap.pl. It is used to link SampleIDs to demultiplexed files. Run autoMap.

```bash
./autoMap.pl ~/metagenomics/demultDir/ ~/metagenomics/automap.txt 1,1
```

### Running Lotus.

We will run Lotus on the demultiplexed files. Use the mapping file you generated in Step 5 and the settings file sdm_454.txt. Use the utax taxonomy to assign a phylogeny to the derived OTUs. Run lotus from out the /opt/lotus_pipeline/ and save the output in the folder ''testR''

> ### {% icon hands_on %} Hands-on: Exercise 3 
>
> > ### {% icon question %} Question
> > How to run lotus
> >
> > > <details markdown="1">
> > > <summary>{% icon solution %} Solution
> > > </summary>
> > > ```bash
> > > sudo ./lotus.pl -i ~/metagenomics/demultDir/ -o ~/metagenomics/testR/ -m ~/metagenomics/automap.txt 
> > > ```
> > > Input is the folder containing the .fna and .qual files. The demultiplexing will fill the demultDir folder with fastq files.
> > > </details>
> >
> {: .question }
{: .hands_on }

In case you haven't done any quality filtering yet, you can still do it now. The command would then be:
```bash
sudo ./lotus.pl -i ~/metagenomics/demultDir/ -o ~/metagenomics/testR/ -m ~/metagenomics/automap.txt -s sdm_454.txt
```

* Peek at the file hiera_RDP (using `head`). The file maps eachg OTU to a genus.
* Peek at the file OTU.txt (using `head`). The first line contains the number of reads that represent OTU_1 in each sample.
* Peek at the file otus.fa (using `head`). It contains the reads representing each OTU. You can use this file to blast the sequences to check if they are really from the OTU they were assigned to.
* Go to the folder higherLvl. This contains the data that we are going to use in the Ecology analysis.
* Go to the folder LotuSLogs. This contains the settings of the analysis. For instance, peek a the file demulti.log: it shows how many reads were rejected... The file citations.txt contains the references for reporting your LotuS results. 

### Using a different taxonomy assignment on a finished run.

In this step we want to reassign the taxonomy to a LotuS run, but keep exactly the same OTUs. In this exercise, assign the OTUs to the Silva taxonomy. 

This option is useful, if e.g. you want to keep your work on a given OTU set (as well as the phylogenetic tree), but want to try out what would have happened if you had used e.g. Silva as reference database instead of utax.

> ### {% icon hands_on %} Hands-on: Exercise 4 
>
> > ### {% icon question %} Question
> > How to reassign the taxonomy with Silva as reference database? 
> >
> > > <details markdown="1">
> > > <summary>{% icon solution %} Solution
> > > </summary>
> > > ```bash
> > > sudo ./lotus.pl -i ~/metagenomics/demultDir/ -o ~/metagenomics/testR2/ -m ~/metagenomics/automap.txt -s sdm_454.txt -refDB SLV -redoTaxOnly 1
> > > ```
> > > Input is the folder containing the .fna and .qual files. The demultiplexing will fill the demultDir folder with fastq files.
> > > </details>
> >
> {: .question }
{: .hands_on }

### Using  a custom database.

The research of honey bee gut communities have very specific taxonomic names for already known bacteria. In order to accomodate for their naming sheme, we will use a very specific database that contains 16S sequences of bacteria mostly found in the honey bee gut. Download the [bee taxonomy in tax format](http://psbweb05.psb.ugent.be/lotus/packs/DB/beeTax/beeTax.tax) and [http://psbweb05.psb.ugent.be/lotus/packs/DB/beeTax/beeTax.fna bee taxonomy in fna format].

Use the two provided files (fna, tax) to again redo the taxonomy, but this time assigning first using the honey bee DB and secondly everything with low hit should be assigned with the SILVA database. 

> ### {% icon hands_on %} Hands-on: Exercise 5 
>
> > ### {% icon question %} Question
> > Use honey bee taxonomy database ? 
> >
> > > <details markdown="1">
> > > <summary>{% icon solution %} Solution
> > > </summary>
> > > ```bash
> > > sudo ./lotus.pl -i XX -o ~/metagenomics/testR3/ -redoTaxOnly 1 \
> > > -m ~/metagenomics/LASI_Spring_2_bees_barn_3_map_lts_5.txt \
> > > -refDB ~/metagenomics/beeTax.fna,SLV -tax4refDB ~/metagenomics/beeTax.tax 
> > > ```
> > > Input is the folder containing the .fna and .qual files. The demultiplexing will fill the demultDir folder with fastq files.
> > > </details>
> >
> {: .question }
{: .hands_on }

### Get  everything assigned!

In this step we want to assign every OTU sequence to a database target – and we don’t care about false positive assignments! Of course this is per se wrong, but in some cases you just want to know what the best hit would be, even if it is only 90% similar to your OTU sequence. LotuS provides several options that allow tweaking towards more lenient assignments. Find all options related to this and try to create the most extreme case with these options, by reassigning the taxonomy again as in the previous step.

### Try a different sequence clustering algorithm.

Now rerun lotus, but try to optimize for a lot of small, hard defined OTUs (that might correspond to something like strain level). Which clustering algorithm might be suitable? Which clustering cutoffs make sense? For this specific run, use the first mapping file you created (step 1) and the non-demultiplexed input files. Save this output in the folder ''testR4''

### Your own best run.

Now that you have run LotuS with various databases and options, go back and look at the output folder of the different runs, look at the statistics provided in the ''LotuSLogS'' subfolder. Based on this, tune the sdm filtering parameter file from step 3 (again), choose the database you think best suited/most interesting, and choose a clustering algorithm. With this create run the sample set again, saving the output in folder ''testrun1.3''. This output folder you can use in the following session on numerical ecology.

If LotuS run has finished, go to the specified output folder and copy the genus.txt from the output folder to your home folder: 
```
cp testrun1.3/ higherLvl/genus.txt ~
```

### Using Illumina data as input.

In all the analysis before we were using 2 x 454 runs from an outdated next generation sequencing technology. For the next exercise we will look at the output of an Illumina miSeq sequencing platform, that is still being used a lot nowadays.

Set up the mapping file, using [http://data.bits.vib.be/pub/trainingen/metagenomics/Miseq.xlsx the provided Miseq.xlsx file]. Run LotuS, after you set up a custom sdm configuration file and using a combination of parameters you learned about in previous steps.

This run might take some time longer to finish. Be sure you set it to use all the cores of your computer and let it run over the lunch break.

Congratulations, now you know how to process raw sequence files to meaningful summary tables, that can be directly analyzed in R or even Excel! In the next tutorial this matrix will be analyzed with the help of R, after the lunch break.

