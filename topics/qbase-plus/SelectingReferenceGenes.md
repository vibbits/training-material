---
layout: tutorial_hands_on

title: "Selecting reference genes: exercises"
questions:
  - "How do you perform a qPCR analysis using the qbase+ software?"
objectives:
  - "Use the qbase+ software to analyze the qPCR experiment results."
time_estimation: "5m"
contributors:
  - chdeb 
---
Since normalization of qPCR data is based on the assumption that the reference targets have the same expression level in all samples it is crucial that the expression of the chosen reference genes is stable.
However, none of the so-called **housekeeping** genes is universally stably expressed.

[Genevestigator](https://www.genevestigator.com/gv/), both the commercial and the free version, contains a tool, called RefGenes, that allows to identify candidate reference genes that display very stable expression in the context that you are working in, typically a certain tissue of a certain organism.

Genevestigator is a platform that contains curated public microarray data from thousands of experiments/conditions.

RefGenes allows you to select the conditions that are relevant for you, e.g. mouse liver, human fibroblasts, or Arabidopsis thaliana leaves. In a next step, RefGenes identifies the genes with the most stable expression in the selected conditions.

## Starting the RefGenes tool

| How to start the RefGenes tool ? |
| :-------------------------------- |
| - Open the [RefGenes page](http://www.refgenes.org/rg/).
 - Click **start GENEVESTIGATOR**
 - Click the **Install/Start** button
 - This will automatically open a Genevestigator startup page. Keep this page open during the analysis. Closing this page will close Genevestigator.
 - Login. Also for the free version you need to create an account (use your academic email for this since you will need your vib email to get access to the commercial version).
 - Genevestigator is opened automatically

## The Genevestigator user interface

The Genevestigator consists of the following components:
  - **Sample Selection** panel: to choose the experimental conditions you're interested in (green)
  - **Gene Selection** panel: to choose the genes you're interested in (blue)
  - Center panel shows an overview of all available tools (purple). Once you have selected a tool, the panel will show the results of the analysis that is done by the tool.
  - **Home** button (red) allows to return to the overview of the tools at any time. The text next to the home button indicates the toolset that you have selected.

Click the **RefGenes** tool at the bottom.

## Using the RefGenes tool to find reference genes

### STEP 1: Choose samples from a biological context similar to those in your qPCR expriment

| How to choose the samples you want to analyze ? |
| :-------------------------------- |
|
 - Click the **New** button in the **Sample Selection** panel. The selection of samples defines which data are used for the analysis.
 - Select the organism you're interested in (in this example: human)
 - Select the array type you want to analyze (in this example: human 133_2).
For most organisms Genevestigator contains expression data from multiple types of microarrays, e.g. different generations of Affymetrix GeneChips®. On these arrays, genes are sometimes represented by different sets of probes. To keep the analysis results easily interpretable, data from different array types are not mixed.
 - Click the **Select particular conditions** button to select all samples with a certain annotation, e.g. all data from a certain tissue type.
 - Select the type of conditions (red) you want to base your selection on (in this example: Anatomy). For each type (anatomy, neoplasms, perturbations, development...) you can browse the corresponding ontologies and select the desired condition(s) (green) (in this example: cardiac muscle).
 - Click **OK**

Note that you can select multiple tissues.
When you select samples for use in the RefGenes tool, you have to focus on microarrays from samples that were collected in conditions similar to those in your qPCR experiment. Don't make a too general selection, e.g. all human samples: you might end up with genes that are stable in most conditions but not in yours. Don't make a very specific selection either, e.g. human heart samples from patients taking the same medication as yours. If you want to broaden your study later on with samples from other patients, your reference genes might not be valid anymore. It is recommended to select reference genes in the same organism and the same / a similar tissue type as the one that you used in your experiments.

### STEP 2: Select the gene(s) you want to measure in your qPCR experiment

This step is not essential, but it helps you to see whether your target gene(s) is (are) strongly or weakly expressed in the conditions of interest selected in STEP1. This allows you to search for candidate reference genes in a similar range of expression.

| How to choose the genes you want to analyze ? |
| :-------------------------------- |
|
 - Click the **New** button in the **Gene Selection** panel.
 - Enter the name of your target gene in the text area (in this example: GOT1) and click **OK**
 - Open the RefGenes tool (if you haven't done that already). A red box plot representing the distribution of the expression levels of GOT1 in the 68 selected human heart samples appears in the center panel. As you can see, this gene is highly expressed in heart.




### STEP 3: Find candidate reference genes

The reference genes that are suggested by GeneVestigator have the
following characteristics:

  - They have the most stable expression levels across all selected samples (a small boxplot)
  - Their overall expression level is similar to that of the target gene(s) of your qPCR experiment
| How to find the candidate reference genes ? |
| :-------------------------------- |
|Click the **Run** button in the RefGenes tool. RefGenes will show the top 20 most stable genes with similar expression levels:



## Exercises

### Finding candidate reference genes in the free version of Genevestigator

Now we will make a more elaborate exercise on finding candidate reference genes. We will do the analysis in the free version of RefGenes but the analysis in the commercial version is very similar.
Suppose we want to compare the expression stability of the 4 commonly used reference genes for qPCR on mouse liver samples (ACTB, GAPDH, HPRT and TUBB4B) to that of 4 reference genes that are suggested by Genevestigator.
To this end we open the RefGenes tool and select the liver samples of the mouse 430_2 arrays.

| Check the expression stability of the 4 commonly used reference genes ? |
| :-------------------------------- |
|
 - Click the **New** button in the **Gene Selection** panel to create a new selection. The selection of samples defines which data are used for the analysis.
 - Enter the name of your target gene in the text area (for example: ACTB) and click **OK**

When you are using the commercial version, you may enter multiple genes at the same time, in the free version you have to enter them one by one. This means that you have to add the first gene as described above and then add the next gene by clicking the **Add** button and so on...

Finally you end up with an expandable list of the genes you asked for and you can tick or untick them to control the display of their expression data in the main window. When you tick the 4 commonly used reference genes you can see how stable they are expressed in the 651 mouse liver samples that are stored in Genevestigator:

As you can see, the expression levels of the commonly used reference genes in the selected mouse liver samples is pretty variable which is also confirmed by their relatively high SD values.
Often there are multiple probe sets for the same gene. When you use the free version you may only choose one probe set per gene so you have to make a choice. How to make that choice ?
Affymetrix probe set IDs have a certain meaning: what comes after the underscore tells you something about the quality of the probes:

  - **_at** means that all the probes of the probe set hit one known transcript. This is what you want: probes specifically targeting one transcript of one gene
  - **_a_at** means that all the probes in the probe set hit alternate transcripts from the same gene. This is still ok the probes bind to multiple transcripts but at least the transcripts come from the same gene (splice variants)
  - **_x_at** means that some of the probes hit transcripts from different genes. This is still not what you want: the expression level is based on a combination of signals of all the probes in a probe set so also probes that cross-hybridize
  - **_s_at** means that all the probes in the probe set hit transcripts from different genes. This is definitely not what you want: if the probes bind to multiple genes you have no idea whose expression you have measured on the array

So I always ignore probe sets with s or x. If you have two specific probe sets for a gene, they should more or less give similar signals. If this is not the case, I base my choice upon the expression level that I expect for that gene based on previous qPCR results.

As you can see, each of these 4 commonly used reference genes has a high expression level. Most genes do not have such high expression levels. In most qPCR experiments your genes of interest will have low or medium expression levels, so these reference genes will not be representative for the genes of interest.

Reference genes should ideally have similar expression levels as the genes of interest. Therefore, we will select the four most stably expressed genes with a medium expression level (between 8 and 12) according to the RefGenes tool.

| Select the 4 most stably expressed candidate reference gene with medium expression levels. |
| :-------------------------------- |
|
 - Untick all target genes.
 - Click the **Run** button at the top of the main window and check if the range is set correctly

Select the 4 candidates with the lowest SD: Then, we performed qPCR on a representative set of 16 of our liver samples to measure the expression of these 8 candidate reference genes and analyzed the data ([See how to select the best reference genes using geNorm in qbase+](http://wiki.bits.vib.be/index.php/Analyzing_data_from_a_geNorm_pilot_experiment_in_qbase%2B)).


### Finding candidate reference genes in the commercial version of Genevestigator

We will do the same exercise as above in the commercial version of Genevestigator. The difference between the free and commercial version of RefGenes is the number of target genes you can select. In the free version you have to select one gene and then gradually add all other genes one at a time. The commercial version allows you to load as many target genes as you want simultaneously. As a consequence, you can select multiple probe sets for the same gene.
All VIB scientists have free access to the commercial version of Genevestigator via their VIB email address. If you don't know your VIB email address, check [the Who's Who of VIB](http://www.vib.be/en/whoiswho/Pages/default.aspx).

  - Open a browser and go to the [Genevestigator website](https://www.genevestigator.com/)
  - If it's your **first time to access Genevestigator**, create an account by clicking **join now** button. You will be redirected to a new window in which you will give some personal information including a valid VIB email address. Click **Register** and check your email to activate your new account. Go back to the [GeneVestigator website](https://www.genevestigator.com/)
  - Choose the research field you want to investigate: **pharma/biomediacal** or **plant biology** by clicking the corresponding button
  - Click **Start**
  - Use your VIB email address and password to login to Genevestigator.
  - This will automatically open a Genevestigator startup page in your browser. Keep this page open during the analysis. Closing this page will close Genevestigator.
  - Genevestigator is opened automatically

Open the RefGenes tool by clicking its icon in the **Further tools** secion and select the liver samples of the mouse 430_2 arrays [as explained in the previous exercise](http://wiki.bits.vib.be/index.php/Using_GeneVestigator_to_select_candidate_reference_genes#STEP_1:_Choose_samples_from_a_biological_context_similar_to_those_in_your_qPCR_expriment).
| Check the expression stability of the 4 commonly used reference genes ? |
| :-------------------------------- |
| - Click the **New** button in the **Gene Selection** panel to create a new selection. The selection of samples defines which data are used for the analysis.
 - Enter the names of the 4 commercial reference genes in the text area and click **OK**

I still remove probe sets with an _s or _x since they do not specifically bind to one single gene:
Finally you end up with an expandable list of the genes you asked for and you can tick or untick them to control the display of their expression data in the main window. By default all probe sets are ticked so you can see how stable the commonly used reference genes are expressed in the 651 mouse liver samples that are stored in Genevestigator:
As you can see, the expression levels of the commonly used reference genes in the selected mouse liver samples is pretty variable which is also confirmed by their relatively high SD values.

The next step of selecting the 4 most stable candidate reference genes with medium expression levels is exactly the same as described above for the free version of RefGenes.

| Create a new gene selection with 20 found candidate reference genes and call it mouse_references. |
| :-------------------------------- |
|Click the **New** button at the top of the main window to create a new selection.

To change the name of the selection right click the name in the **Gene selection** panel and select **Rename**

| Identify perturbations where the mouse_references genes show more than 1,5 fold differential expression using the Condition perturbations tool. |
| :-------------------------------- |
|Click the **Home** button at the top to go back to the tools overview page.

Click the **Perturbations** tool in the **Condition Search tools** section


Make a **New Sample selection** including all mouse 430_2 arrays.
Untick all genes except for the first one and filter the long heatmap for at least 1.5 fold change differential expression:


You now get a list of mouse samples in which the gene is not stably expressed so you can check if any of these samples is related to the samples in your study. Hover your mouse over the name of a sample to see more details about the sample.
You can do this for each of the candidate reference genes and select the ones that best fit your needs

[Exercise on selecting reference genes for metacaspases in Arabidopsis thaliana](http://wiki.bits.vib.be/index.php/GV_Exercise.1).


In a geNorm pilot experiment you analyze a set of candidate reference genes in a representative set of samples that you want to test in your final experiment. Based on the M-values and CVs that are calculated by qbase+, you can choose the genes that most satisfy the criteria for a good reference gene.

### Exercise 1: reference genes for mouse liver

We come back on the 8 candidate reference genes that we selected for mouse liver:

  - 4 commonly used reference genes: ACTB, TUBB4B, GAPDH and HPRT
  - 4 candidate reference genes with very stable medium expression levels selected based on expression data coming from more than 600 microarrays of mouse liver samples using Genevestigator: Gm16845, MUSK, OTOP3, EDN3

We have measured their expression in a represetative set of 16 of our mouse liver samples, each in triplicate. We will now analyze the stability of these candidate reference genes in our samples.

#### Creating a new Experiment

| Create a new Experiment called GeNormMouse in Project1 |
| :------------------------------------------- |
| Open qbase+ or, if the software is already open, click the Launch Wizard button.

You can find the details on how to create a new experiment in Creating a project and an experiment

#### Loading the data into qbase+

The data is stored in [the RefGenes folder](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/RefGenes.zip). It consists of 8 Excel files, one file for each candidate reference gene. If you are not working on a BITS laptop, download and unzip the folder.

| Import the data. This files are in qBase format. |
| :------------------------------------------- |
| You can find the details on how to start the data import in Loading data into qbase+

Unlike the previous exercise, qbase+ does not allow you to do a quick import this time. In the Import Run window Manual import is selected:
Make sure that Upload file to Biogazelle support for further analysis is NOT selected and click Next
Make sure the correct File type is selected (qBase) and click Finish.
This file contains the data of the geNorm pilot experiment. In the pilot experiment, 8 candidate reference genes were measured in 16 representative mouse liver samples.
#### Analyzing the geNorm pilot data

| Specify the aim of the experiment. |
| :------------------------------------------- |
| In this experiment we want to select the ideal reference genes for our next experiments so we choose selection of reference genes (geNorm)

| Check the quality of the replicates (use default parameter settings). |
| :------------------------------------------- |
| You can find the details on how to check the quality of the replicates in the Checking the quality of technical replicates and controls section of Analyzing gene expression data in qbase+

We haven't included any positive or negative controls so you don't need to show their details.

| Select the Amplification efficiencies strategy you want to use. |
| :------------------------------------------- |
| You can find the details on how to select the Amplification effciencies strategy in the Taking into account amplification efficiencies section of Analyzing gene expression data in qbase+

We haven't included dilution series nor do we have data from previous qPCR experiments regarding the amplification efficiencies so we choose to use the same efficiency for all genes.
It is of course better to include a dilution series for each gene to have an idea of the amplification efficiencies of each primer pair.

| Convert all genes to Reference genes. |
| :------------------------------------------- |
| You can convert all the genes simultaneously by selecting Use all targets as candidate reference genes

Click Finish.

| Which genes are you going to use as reference targets in further experiments ? |
| :------------------------------------------- |
| Upon clicking Finish, the geNorm window containing the analysis results is automatically opened. The geNorm window consists of three tabs. The tabs are located at the bottom of the window: geNorm M, geNorm V and Interpretation.
The first tab, geNorm M, shows a ranking of candidate genes according to their stability, expressed in M values, from the most unstable genes at the left (highest M value) to the best reference genes at the right (lowest M value):
The second tab, geNorm V, shows a bar chart that helps determining the optimal number of reference genes to be used in subsequent analyses:

The number of reference genes is a trade-off between practical considerations and accuracy. It is a waste of resources to quantify more genes than necessary if all candidate reference genes are relatively stably expressed and if normalization factors do not significantly change when more genes are included. However, Biogazelle recommends the minimal use of 3 reference genes and stepwise inclusion of more reference genes until the next gene has no significant contribution to the normalization factors.
To determine the need of including more than 3 genes for normalization, pairwise variations Vn/n+1 are calculated between two sequential normalization factors. Simply stated: V is measure of the added value of adding a next reference gene to the analysis. A large variation means that the added gene has a significant effect and should be included.
In normal experiments like the Gene expression experiment (see Analyzing gene expression data in qbase+), we only have 3 reference genes so we will see only 1 bar here. But in this geNorm pilot experiment, we analyzed 8 candidate reference genes, so we see 6 bars.
All pairwise variations are very low, so even the inclusion of a third gene has no significant effect. Based on a preliminary experiment that was done by Biogazelle, 0.15 is taken as a cut-off value for V, below which the inclusion of an additional reference gene is not required. Normally this threshold is indicated by a green line on the geNorm V bar chart. However since all V-values fall below the threshold in this geNorm pilot experiment, you don’t see this line on the bar chart.
So, these results mean that for all subsequent experiments on these samples, two reference genes, EDN3 and MUSK, would be sufficient. However, as stated before, Biogazelle recommends to always include at least three reference genes in case something goes wrong with one of the reference genes (so also include Gm16845). |
These are artificial data. But when you read [the paper by Hruz et al., 2011](http://www.biomedcentral.com/1471-2164/12/156/abstract) you see that the genes that are selected by Genevestigator are often outperforming the commonly used reference genes.

### Exercise 2: reference genes for human heart

#### Creating a new Experiment

| Create a new Experiment called GeNormHuman in Project1        |
| :------------------------------------------------------------ |
| You can find the details on how to create a new experiment in Creating a project and an experiment |

#### Loading the data into qbase+
| Import (http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run6.xls) Run6. This file is in qBase format. |
| :------------------------------------------- |
| You can find the details on how to start the data import in Loading data into qbase+. Unlike the previous exercise, qbase+ does not allow you to do a quick import this time. In the Import Run window Manual import is selected:

Make sure that Upload file to Biogazelle support for further analysis is NOT selected and click Next. Select the correct File type (qBase) and click Finish. This file contains the data of the geNorm pilot experiment. In the pilot experiment, 10 candidate reference genes were measured in 20 representative samples.

#### Analyzing the geNorm pilot data

| Specify the aim of the experiment.        |
| :---------------------------------------- |
| In this experiment we want to select the ideal reference genes for our next experiments so we choose selection of reference genes (geNorm) |

| Check the quality of the replicates and the controls (use default parameter settings). |
| :------------------------------------------- |
| You can find the details on how to check the quality of the replicates in the Checking the quality of technical replicates and controls section of Analyzing gene expression data in qbase+

All replicates and controls have met the quality criteria so there's no need to inspect them further. |
| Select the Amplification efficiencies strategy you want to use. |
| :------------------------------------------- |
| You can find the details on how to select the Amplification effciencies strategy in the Taking into account amplification efficiencies section of Analyzing gene expression data in qbase+. We haven't included dilution series nor do we have data from previous qPCR experiments regarding the amplification efficiencies so we choose to use the same efficiency (E=2) for all genes. |

It is of course better to include a dilution series for each gene to have an idea of the amplification efficiencies of each primer pair.
| Convert all genes to Reference genes.                                                                         |
| :------------------------------------------------------------------------------------------------------------ |
| You can convert all the genes simultaneously by selecting Use all targets as candidate reference genes |

Click Finish.

| Which genes are you going to use as reference targets in further experiments ? |
| :------------------------------------------- |
| Upon clicking Finish, the geNorm window containing the analysis results is automatically opened. The geNorm window consists of three tabs. The tabs are located at the bottom of the window: geNorm M, geNorm V and Interpretation.
The first tab, geNorm M, shows a ranking of candidate genes according to their stability, expressed in M values, from the most unstable genes at the left (highest M value) to the best reference genes at the right (lowest M value):
The second tab, geNorm V, shows a bar chart that helps determining the optimal number of reference genes to be used in subsequent analyses:

The number of reference genes is a trade-off between practical considerations and accuracy. It is a waste of resources to quantify more genes than necessary if all candidate reference genes are relatively stably expressed and if normalization factors do not significantly change when more genes are included. However, Biogazelle recommends the minimal use of the 3 most stable candidate reference genes and stepwise inclusion of more reference genes until the next gene has no significant contribution to the normalization factors.
To determine the need of including more than 3 genes for normalization, pairwise variations Vn/n+1 are calculated between two sequential normalization factors. Simply stated: V is measure of the added value of adding a next reference gene to the analysis. A large variation means that the added gene has a significant effect and should be included.
In normal experiments like the Gene expression experiment, see Analyzing_gene_expression_data_in_qbase+, we only have 3 reference genes so we will see only 1 bar here. But in this geNorm pilot experiment, we analyzed 10 candidate reference genes, so we see 8 bars.
All pairwise variations are very low, so even the inclusion of a third gene has no significant effect. Based on a preliminary experiment that was done by Biogazelle, 0.15 is taken as a cut-off value for V, below which the inclusion of an additional reference gene is not required. Normally this threshold is indicated by a green line on the geNorm V bar chart. However since all V-values fall below the threshold in this geNorm pilot experiment, you don’t see this line on the bar chart.
So, these results mean that for all subsequent experiments on these samples, two reference genes, HPRT1 and GADP, would be sufficient. However, as stated before, Biogazelle recommends to always include at least three reference genes in case something goes wrong with one of the reference genes (so also include YHWAZ). 



In this example we will analyze data from an artificial expression study containing the following samples:
  - 6 treated samples: treated1, treated2, ... treated6
  - 6 control samples: control1, control2, ... control6

In this study, the expression of the following genes was measured:
  - 4 commonly used reference genes: ACTB, HPRT, GAPDH, and TUBB4. We have seen in [the previous exercise](http://wiki.bits.vib.be/index.php/Analyzing_data_from_a_geNorm_pilot_experiment_in_qbase%2B#Exercise_1:_reference_genes_for_mouse_liver) that the expression of these reference genes in mouse liver samples is not as stable as generally thought.
  - 3 genes of interest:
      - Low: a gene with low expression levels
      - Medium: a gene with moderate expression levels
      - HighVar: a gene with low and very noisy expression

In general, the lower the expression level, the more noisy the qPCR results will become. For each of the genes of interest we have included a run in which a 2-fold difference in expression between control and treated samples was created (Low1, Medium1 and HighVar1) and a run with a 4-fold difference in expression (Low2, Medium2 and HighVar2).
There are three technical replicates per reaction. In a second experiment we used [the reference genes that were obtained via Genevestigator](http://wiki.bits.vib.be/index.php/Using_GeneVestigator_to_select_candidate_reference_genes#Finding_candidate_reference_genes_in_the_free_version_of_Genevestigator) and that proved to be [more stably expressed in mouse liver samples than the commonly used references](http://wiki.bits.vib.be/index.php/Analyzing_data_from_a_geNorm_pilot_experiment_in_qbase%2B#Exercise_1:_reference_genes_for_mouse_liver).
The data can be found in the NormGenes folder on the BITS laptops or can be downloaded: [from our website](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/NormGenes.zip).

#### Creating a new experiment

| Create a new Experiment called NormGenes1 in Project1 |
| :---------------------------------------------------- |
| You can find the details on how to create a new experiment in Creating a project and an experiment |

#### Loading the data

| Import Run1 to Run5. These files are in qBase format. |
| :---------------------------------------------------- |
| You can find the details on how to import the data file in the Loading the data into qbase+ section of Analyzing data from a geNorm pilot experiment in qbase+ |

We are going to compare expression in treated versus untreated samples so we need to tell qbase+ which samples are treated and which not. To this end, we have constructed [a sample properties file](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Sample_Properties_Norm.xlsx) in Excel containing the grouping annotation as a custom property called Treatment.

| Import the Sample Properties file. |
| :---------------------------------------------------- |
| You can find the details on how to import the data file in the Adding annotation to the data section of Loading data into qbase+.

| Select to import the custom property. |
| :---------------------------------------------------- |
| So as you can see we have 6 treated and 6 untreated samples and we have measured the expression of the 4 commonly used reference genes and 6 genes of interest:

#### Analyzing the data

| Which amplification efficiencies strategy are you going to use ?     |
| :------------------------------------------------------------------- |
| You don't have data of serial dilutions of representative template to build standard curves so the only choice you have is to use the default amplification efficiency (E = 2) for all the genes. |

| Appoint the reference genes. |ACTB, GAPDH, HPRT and TUBB4B are the reference genes:
You can find the details on how to appoint reference targets in the Normalization section of Analyzing gene expression data in qbase+ |

| Is the stability of the reference genes ok ?                                                                 |
| :----------------------------------------------------------------------------------------------------------- |
| The M and CV values of the reference genes are shown in green so the stability of the reference genes is ok. |

| Which scaling strategy are you going to use ? |Since you have a treated and a control group, it seems logical to use the average of the control group for scaling.

You can find the details on how to specify the scaling strategy in the Scaling section of Analyzing gene expression data in qbase+
Look at the target bar charts.

| In the target bar charts plot the average expression level of each group. |In the Grouping section at the bottom of the chart you can select Plot group average: Now do exactly the same for the second experiment with the same genes of interest but with other reference genes. This means that you have to return to the Analysis wizard. To this end, click the Launch wizard button a the top of the page:

| Create a new Experiment called NormGenes2 in Project1 |
| :---------------------------------------------------- |
| You can find the details on how to create a new experiment in Creating a project and an experiment |

| Import Run5 to Run9. These files are in qBase format. |
| :---------------------------------------------------- |
| You can find the details on how to import the data file in the Loading the data into qbase+ section of Analyzing data from a geNorm pilot experiment in qbase+ |

| Import the Sample Properties file.                    |
| :---------------------------------------------------- |
| You can find the details on how to import the data file in the Adding annotation to the data section of Loading data into qbase+. Select to import the custom property. |

So as you can see we have 6 treated and 6 untreated samples and we have measured the expression of the 4 new reference genes and 6 genes of interest:
| Appoint the reference genes. |EDN3, Gm16835, MUSK and OTOP3 are the reference genes:
| :---------------------------------------------------- |
| You can find the details on how to appoint reference targets in the Normalization section of Analyzing gene expression data in qbase+ |

| Is the stability of the reference genes ok ?                                                                 |
| :----------------------------------------------------------------------------------------------------------- |
| The M and CV values of the reference genes are shown in green so the stability of the reference genes is ok. |

As you can see the M and CV values of these reference genes is much lower than these of the 4 commonly used reference genes pointing to the fact that genes are more stably expressed. It's not that the commonly used reference genes are bad references. Then qbase+ would not display them in green. It's just that the other reference genes are more stable. But this can have a big impact on the results of your analysis...

| Use the average of the control group for scaling |You can find the details on how to specify the scaling strategy in the Scaling section of Analyzing gene expression data in qbase+

Plot the average expression level of each group. Now we will compare the target bar charts of the second and the first experiment to assess the influence of the stability of the reference targets on the analysis results.

| How to display the target bar charts of the second and the first experiment next to each other ? |You can display the bar charts next to each other by clicking the tab of the bar chart of the second experiment. Drag the tab to the right while you hold down the mouse button until you see and arrow at the right side of the qbase+ window and a dark grey box in the right half of qbase+ window. Release the mouse button when you see the arrow and the box. Now the two bar charts should be next to each other. Some laptop screens are too small to nicely display the two bar charts next to other. If this is the case switch to full screen mode by double clicking the tab of the first experiment. |

Now you can compare the expression of each gene in the first and in the second experiment.

When we do this for HighVar1 for instance, you see that the average expression levels of both groups are the same in the first and the second experiment (check the scales of the Y—axis\!). Both experiments detect the two-fold difference in expression level between the groups. However, the error bars are much larger in the first experiment than in the second. The variability of the reference genes does have a strong influence on the errors and the size of the error bars will influence the outcome of the statistical test to determine if a gene is differentially expressed or not. The larger the error bars the smaller the less likely it is that the test will say that the groups differ.

Remember that the error bars represent 95% confidence intervals:
  - if the error bars of the two groups do not overlap: you are certain that the difference between the means of the two groups is significant
  - if they do not overlap: you know nothing with certainty: the means can be different or they can be the same. Of course the more they overlap the smaller the chance that there is a significant difference between the groups.

Check out the results of HighVar2. Here, you clearly see the influence of the reference genes. Again, the fourfold difference in expression is detected by both experiments but:

  - the least stable reference genes (experiment 1) give large overlapping error bars
  - the most stable reference (experiment 2) give smaller, barely overlapping error bars

This means that in experiment 2, a statistical test will probably declare that HighVar2 is differentially expressed while in experiment 1 this will not be the case. We will test this assumption by performing a statistical test.

#### Statistical analysis of differential expression

| Use a non-parametric test to identify DE genes in experiment 1 ? |
| :---------------------------------------------------- |
| You can find full details on statistical analyses in qbase+ in the statistical analysis section of analyzing gene expression data in qbase+. In brief, you need to perform the following steps:

Open the Statistical wizard

The goal of this analysis is to compare the mean expression levels of our genes of interest in treated and untreated samples

Use the Treatment property to identify treated and untreated samples

Analyze all genes of interest

Use the default settings to perform the non-parametric Mann-Whitney test

As you can see, none of the genes is considered DE by the very conservative non-parametric test. Additionally most genes have the same p-value. That's normal when you don't have many replicates. In our case, we have 6 replicates. Non-parametric tests are based on a ranking of the data values and there are not so many ways to rank 6 data points. This is why you see the same p-values for many genes.
As said before, the non-parametric test is very stringent. If the data do come from a normal distribution, the test will generate false positives. Some of the genes might have have been labeled not DE while in fact they are DE so you might have missed some differential expression. The choice of statistical test with 6 biological replicates depends on what you prefer: false negatives or false positives. Most people will choose false negatives since they don't want to invest time and money in research on a genes that was labeled DE while in fact it is not DE.

Suppose I don't mind false positives but I don't want to miss any potential DE genes. In that case, it's better to go for a t-test. Let's repeat the test n ow choosing a parametric t-test.
| Use a t-test to identify DE genes in experiment 1 ? |
| :---------------------------------------------------- |
| You can find full details on statistical analyses in qbase+ in the statistical analysis section of analyzing gene expression data in qbase+.
In brief, you need to perform the following steps:
Open the Statistical wizard
The goal of this analysis is to compare the mean expression levels of our genes of interest in treated and untreated samples
Use the Treatment property to identify treated and untreated samples
Analyze all genes of interest
Describe the data set as log-normally distributed

Still none of the genes is considered DE but you do see that the p-values of the t-test are lower than these of the Mann-Whitney test.

| Use a non parametric test to identify DE genes in experiment 2 ? |
| :---------------------------------------------------- |
| You can find full details on statistical analyses in qbase+ in the statistical analysis section of analyzing gene expression data in qbase+.
In brief, you need to perform the following steps:

Open the Statistical wizard
The goal of this analysis is to compare the mean expression levels of our genes of interest in treated and untreated samples
Use the Treatment property to identify treated and untreated samples
Analyze all genes of interest
Use default settings

Now you see that 4 out of the 6 genes are considered DE. This is also what we expected since 3 of our genes of interst have a 4-fold difference in expression level between the two groups. It's understandable that it's hard to detect 2-fold differences in expression especially when the expression of the gene is somewhat variable as is the case for Low1 and HighVar1 but a 4-fold difference is a difference that you would like to detect.
| Use a t-test to identify DE genes in experiment 2 ? |
| :---------------------------------------------------- |
| You can find full details on statistical analyses in qbase+ in the statistical analysis section of analyzing gene expression data in qbase+.
In brief, you need to perform the following steps:

Open the Statistical wizard
The goal of this analysis is to compare the mean expression levels of our genes of interest in treated and untreated samples
Use the Treatment property to identify treated and untreated samples
Analyze all genes of interest
Describe the data as log normally distributed

Again the t-test generates lower p-values than the Mann-Whitney test but realize that choosing the t-test when the data is not normally distributed will generate false positives \!