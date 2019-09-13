---
layout: tutorial_hands_on

title: "02 Experiment design exercises"
questions:
  - "How do you perform a qPCR analysis using the qbase+ software?"
objectives:
  - "Design qPCR experiments"
  - "Use the qbase+ software to analyze the qPCR experiment results."
time_estimation: "5m"
contributors:
  - chdeb 
---
### Exercise 1: simple gene expression study

In my qPCR experiment I want to study the expression of 12 genes of interest in 8 samples of interest. I want to use 2 PCR replicates for each reaction.

> How many 96 well plates do I need for this experiment ?
> > I have 12 genes in 8 samples which gives a total of 96 reactions (one plate). I want to perform each reaction twice (2 PCR replicates) so I need two plates. However, I need to include reference genes in my experiment, preferably more than one. I can put these reference genes on a separate plate, I do not have to include them on each plate.
Ideally, you need to include 3 reference genes so having 8 samples and 2 replicates this gives an additional 48 reactions. Thus, I need three 96 well plates to perform this experiment.

| Do I need to include IRCs (inter-run calibrators) ?                      |
| :--------------------------------------------------- |
| No, I can easily fit all samples of the same gene on the same plate so I don't need to include IRCs. |

### Exercise 2: a large study

In my qPCR experiment I want to study the pattern of expression of 96 genes (genes of interest and reference genes) in 96 samples of interest, divided into a few groups. I want to use 2 PCR replicates for each reaction.

| Do I need to include IRCs (inter-run calibrators) ?                    |
| :------------------------------------------------------- |
| No, I can fit all samples of the same gene on the same plate so I don't need to include IRCs. |

I want to include PCR replicates.

| Do I need to include IRCs when I work on a 96 well plate ?                                                                                    |
| :-------------------------------------------------------------------------------------------------------------------------------------------- |
| Yes, I have 192 reactions per gene so I cannot place them on the same plate. Remember that replicates have to be located on the same plate \! |

| Do I need to include IRCs when I work on a 384 well plate ?                        |
| :--------------------------------------------------------------------------------- |
| No, I have 192 reactions per gene so I can even place two genes on the same plate. |

I want to include no template controls but I don't want to increase the
number of plates.

| What is the most elegant strategy to make room for including negative controls ?      |                                                      
| :------------------------------------------------------------------------------------ |
| This kind of study screen for expression patterns and requires statistical analysis. Since you have many samples divided over a few groups it means you have many biological replicates so you could easily do without the PCR replicates. By doing so you preserve the biological variability which is often far greater than the technical variation. |

### Exercise 3: how to fill plates ?

In my qPCR experiment I want to study the pattern of expression of 5 genes (genes of interest and reference genes) in 38 samples (samples of interest and control samples). I want to use 2 PCR replicates for each reaction.

| What is the minimum number of 96 well plates I need for this experiment ? |
| :------------------------------ |
| 5 genes * 38 samples * 2 replicates = 380 reactions.
I need a minimum of 4 plates for this experiment.

| If I use the minimum number of 96 well plates do I need to include IRCs ?                                                      |
| :----------------------------------------------------------------------------------------------------------------------------- |
| Yes, 5 genes spread over 4 plates with 72 reactions per gene means that at least one gene will be spread over multiple plates. |

| What can I do to avoid inter-run variability ?                                                                                                                                                                                         |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| I can use 5 plates and fill them with one gene each. They will not be completely filled (72 reactions) but at least I do not have to use IRCs (which are additional reactions that also cost money) and I have no inter-run variation. |

Suppose there's only one 96-well plate left in your lab. You have 10 samples (samples of interest + control samples) and you want to make the most of what you have.

| How many genes of interest would you measure ? |
| :------------------------------ |
| Since you want to make most of what you have, let's assume you are omitting PCR replicates.
Theoretically, you could fit 9 genes on your 96-well plate. However, to avoid pipetting mistakes I would measure only 8 genes so I can work with one row / gene. This is very handy for multichannel pipets.

### Exercise 4: a growing study

In my qPCR experiment I want to study the pattern of expression of 24 genes (genes of interest and reference genes) in 48 samples (samples of interest and control samples). I want to use 2 PCR replicates for each reaction.

| How many genes can I analyze on one 384 well plate ? |
| :------------------------------ |
| 48 samples * 2 replicates = 96 reactions per gene.
I can analyze 4 genes on each 384 well plate.

Each week I receive 2 additional samples to analyze.

| Do I analyze them immediately after I get them ? |
| :------------------------------ |
| No. Since the samples are placed on different plates as in the previous experiment, you have to use IRCs. You typically need 3 IRCs and a no template control sample. It means that if you want to analyze these 2 samples you have to include 4 additional samples for each gene. This is a lot of overhead for just 2 samples !
Try to avoid this: it's better to wait a few weeks until you have 6 or 8 or even more samples.

### Exercise 5: a diagnostic copy number screen

In diagnostic screens all samples are important: you cannot leave out samples and all measurements need to be of the highest quality possible. In my qPCR experiment I want to study copy number variation of 16 genes
(genes of interest and reference genes) and 2 calibrator samples (samples with known copy number). Since we need high quality data we will use 4 technical replicates.

| Are we going to use sample maximization ?                                   |                   
| :------------------------------------------------------------------------- |
| No. In contrast to gene expression studies, where we want to compare expression levels of a gene between different groups of samples, copy number analyses do compare genes. It means that in this case the sample maximization approach (placing all samples of the same gene on the same plate) is not valid. Instead we use a gene maximization approach here (placing same sample for different genes on the same plate). |

| How many samples can I fit on a 384 well plate ? |
| :------------------------------ |
| We have 16 (genes) * 4 (replicates) = 64 reactions per sample.
This means that we can fit 6 samples on a 384 well plate: 4 unknowns and 2 calibrators.

### Exercise 6: fix experiments with bad or missing data

In my qPCR experiment I want to study gene expression of 6 genes (3 genes of interest and 3 reference genes) in 20 samples (samples of interest and control samples). I want to use 2 technical replicates. One of my genes of interest failed completely and I want to repeat the measurements for this gene in a new run.

| Do I need to include IRCs ?                                                                                |
| :--------------------------------------------------------------------------------------------------------- |
| No. We can put the 20 samples of the gene that failed on a single plate so we do not have to include IRCs. |

| Do I need to include reference genes ?                                                                 |
| :----------------------------------------------------------------------------------------------------- |
| No. We just repeat all samples for the gene that failed and replace the old data with the new results. |

One of the reference genes failed completely.

| What should I do ?                                                                                                                                                                                                                                                                                     |
| :----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Depending on the quality of the two remaining reference genes, you should either do nothing or do the same as in the previous example where one of your genes of interest failed. If the two remaining reference genes are stable you can do the normalization with the two remaining reference genes. |

Three samples failed completely.

| What's the first thing I need to do ?                                                                                                                             |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Since they failed completely, they are probably of low quality. Therefore, you have to prepare the samples again, check their quality and then use them for qPCR. |

| Do I need to include IRCs ?                                                                                             |
| :---------------------------------------------------------------------------------------------------------------------- |
| Yes. If you want to compare these samples with the samples that didn't fail, you have to perform inter-run calibration. |

Three samples failed for one of the genes of interest

| What is the first question I need to ask ? |
| :----------------------------------------- |
| Is the gene expressed in these samples ?   |

| Is it possible the RNA of these three samples was of low quality ?        |
| :------------------------------------------------------------------------ |
| Not likely, the measurements for the other genes in these samples are ok. |

Three samples failed for one of the reference genes

| Can I use the measurements of that reference gene in the non-failing samples for normalization ?                                         |
| :--------------------------------------------------------------------------------------------------------------------------------------- |
| No, qbasePLUS requires that you use the same reference genes for all samples so you have to discard all samples for that reference gene. |

### Exercise 7: dilution series for calculating amplification efficiencies

In my qPCR experiment I want to study 8 new genes for which I had to design new primer pairs in 12 samples (samples of interest and control samples). I want to use 2 technical replicates and 96 well plates.

| What is the first thing I need to do ?                                                        |
| :-------------------------------------------------------------------------------------------- |
| Perform a pilot experiment to determine the amplification efficiencies of these primer pairs. |

For this I need a dilution series of representative cDNA template.

| How many dilutions would you include ?                                           |
| :------------------------------------------------------------------------------- |
| A dilution series with 6 dilutions for 8 genes nicely fits into a 96 well plate. |

A few weeks after my initial qPCR experiment I want to test these 8 genes in a new set of samples.

| Do I have to repeat the pilot experiment ?      |
| :---------------------------------------------- |
| No, dilution series do not need to be repeated. |