---
layout: tutorial_hands_on

title: "01 Converting raw data from vendor format to open format (mzML) using msconvert tool of ProteoWizard"

questions:
  - "What tools are presented in this training?"

objectives:
  - "Converting raw data from vendor format to open format (mzML) using msconvert tool of ProteoWizard"

time_estimation: "15m"

key_points:
  - "We presented the tools for the training and the data files"

contributors:
  - janick-bits
  - abotzki

---

# Tools  
{:.no_toc}

## Lotus pipeline 
LotuS offers a lightweight complete 16S/18S/ITS pipeline to
- Demultiplex and filter fasta or fastq sequences
- Denoise, remove chimeric sequences and cluster sequences into very high quality OTUs that perform at a similar level to mothur / dada2
- Determine taxonomic origin of each OTU using >5 spezialized and general purpose database or statistical algorithms
- Construct OTU, genus, family, class, order and phylum abundance tables in .txt or .biom format
- Reconstruct OTU phylogenetic tree

More information at [LotuS home page](http://psbweb05.psb.ugent.be/lotus/downloads.html)

## usearch 

Download [usearch version 8](http://www.drive5.com/usearch/download.html) and copy the executable in a folder e.g. /usr.bin/tools/ which you can reach (you might to be superuser for this)

Make executable:
```
sudo chmod +x /usr/bin/tools/usearch8.1.1861_i86linux32
```

Create a symbolic link into the folder where Lotus will search for it:

``
sudo ln -s /usr/bin/tools/usearch8.1.1861_i86linux32 /usr/bin/tools/lotus_pipeline/bin/usearch_bin
```

## R package 

You also need R with the vegan package installed.
