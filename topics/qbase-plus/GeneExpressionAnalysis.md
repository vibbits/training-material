---
layout: tutorial_hands_on

title: "Gene expression analysis"
questions:
  - "How do you perform a qPCR analysis using the qbase+ software?"
objectives:
  - "Use the qbase+ software to analyze the qPCR experiment results."
time_estimation: "5m"
contributors:
  - chdeb 
---
#### Create a project

When you use qbase+ for the first time, you can't do anything unless you
create a project to store your experiments in.

| Create a new Project |
| :----------------------------------- |
| When you double click the qbase+ icon, the software starts up automatically opens the Start page where you can create a new project by clicking the Create new project button : This will create a new project with a default name like Project 1 . |

#### Create an experiment

To open actual data (one/more runs) in qbase+, creating a project is not sufficient. You need to create an experiment in this project to hold the run data.

| Create a new Experiment called GeneExpression in the new project. |
| :----------------------------------- |
| Select the Create a new qbase+ experiment option  in the Start page. Type a name for th new experiment . Click the Next button at the bottom of the page . This will create the experiment.

When you leave the **Start page**, the **Import run** page is automatically opened allowing you to import the actual qPCR data into qbase+.

#### Loading the data

First a few quick words about the data set. We’ll be working with data coming from 3 runs (plates in the qPCR instrument): [Run1](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run1.xls), [Run2](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run2.xls) and [Run3](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run3.xls)

The data consist of Cq values for:

  - 3 reference target genes: Stable, Nonregulated, and Flexible
  - 3 target genes of interest: Duvel, Leffe, and Palm

each measured twice (= technical replicates) in 16 different samples. Half of the samples have undergone a treatment, half of them are untreated control samples.

The data set also contains a series of standard samples consisting of a four-fold dilution series of cDNA for each target gene. These measurements allow to generate a standard curve from which target-specific amplification efficiencies can be calculated. Finally, negative controls (No Template Controls) have been measured. The goal of the analysis is to identify target genes of interest that have different expression levels in the treated samples compared to the untreated control samples.

| In GeneExpression load CFX run files [Run1](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run1.xls), [Run2](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run2.xls) and [Run3](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run3.xls).
| :---------------------------- |
|  
* Click the **Import runs** button  to open the **Import Run** window
* Click the **Browse** button  to go to the directory that stores the files containing the qPCR data

Select the 3 run files simultaneously by holding the **Ctrl** key on your keyboard during the selection in Windows or the command button in MacOSX.

Click the **Open** button 

Now you go back to the **Import Run** window, click the **Next** button (purple)

* 
qbase+ tries to recognize the format of the selected import files. If only one format matches the files (as in our case CFX), it is selected and the quick import option is enabled. Click the **Finish** button.

In the Imported run names area on the **Import run** page you should now see the names of the 3 run files. If these are the correct files, click the **Next** button at the bottom of the page.

#### Adding annotation to the data

When you leave the **Import run** page, you are redirected to the **Sample target list** page, which gives you an overview of the targets (= genes) and samples qbase+ detected when reading in the datafiles.
Take a look at the data. You see that the list of samples and targets matches the description of the qPCR experiment at the top of this page. The samples in this experiment are divided into two groups: samples that received some kind of treatment and untreated control samples. This information was not included in the run files so qbase+ does not know which sample belongs to which group. However, this is relevant information: in our analysis we are going to compare the expression of our genes of interest between treated and untreated samples. This means that qbase+ needs the grouping annotation to be able to perform the analysis we want to do. So we have to give qbase+ this annotation: we can do this by adding a custom sample property. To do this we need to create a sample properties file with a specific format that is described in [the tutorial](http://data.bits.vib.be/pub/trainingen/qbasePLUS/TutorialIII.pdf). You can find the file in the qbase+ folder on the BITS laptops or you can [download the file here](http://data.bits.vib.be/pub/trainingen/qbasePLUS/Sample_Properties_file.xlsx).

| How to add the grouping annotation ?
| :---------------------------- |
|  To import the file containing to grouping annotation:

* select **Add samples and targets** 
* click **Import sample list** 
* browse to the folder that contains the samples file
* select the file and click **Open**
* click **Next**

In the **Importing samples** window, you have to tell qbase+ which sample annotation you want to import from the sample properties file

In our case we could import Quantities (this annnotation is available in the sample properties file) but the quantities of the standard samples were included in the run files so qbase+ has already imported this annotation from the run files during data import.
We definitely need to import the Custom properties since they were not a part of the run files. The Treatment property will tell qbase+ which samples belong to the group of control samples and which samples belong to the group of treated samples.
Click the **Next** button at the bottom of the page to finish the import.

At this point you don't see the custom annotation that you have imported, you will see it later in the analysis during scaling
Leaving the **Sample target list** page takes you to the **Run annotation** page, where you have to confirm again that the sample and gene names are ok. If this is not the case you can adjust the annotation here.

Click the **Next** button at the bottom of the page

Our data file contains all required annotation:

  - Cq values
  - sample and target names
  - sample types
  - quantities for the standard samples
  - grouping of the samples



Once runs are imported, you can start analyzing the data. Data consist
of Cq values for all the wells.

#### Specifying the aim of the experiment

On the **Aim** page you tell the software what type of analysis you want to do. Different types of analyses require different parameters, parameter settings and different calculations. By selecting the proper analysis type, qbase+ will only show the relevant parameters and parameter settings.

Since we are doing a **gene expression analysis** in this exercise, this the option we should select. Click the **Next** button on the bottom of the page to go to the **Technical quality control** page.

#### Checking the quality of technical replicates and controls

The **Technical quality control** page handles the settings of the requirements that the data have to meet to be considered high quality. For instance the maximum difference between technical replicates is defined on this page. If there are technical replicates in the data set, qbase+ will detect them automatically (they have the same sample and target name) and calculate the average Cq value. In theory, technical replicates should generate more or less identical signals.

| How to set the maximum difference in Cq values for technical replicates ?
| :---------------------------- |
|  The quality criterium that the replicates must meet to be included for further analysis is one of the parameters in qbase+. You can set it on the **Technical quality control** page:

The default maximum allowed difference in Cq values between technical replicates is 0.5

Additionally, you can do quality checks based on the data of the positive and negative controls.
| How to set quality requirements for the control samples ?
| :---------------------------- |
|  On the same **Technical quality control** page you can define the minimum requirements for a well to be included in the calculations:

* **Negative control threshold** : minimum allowed difference in Cq value between the sample with the highest Cq value and the negative control with the lowest Cq value: the default is 5 which means that negative controls should be more than 5 cycles away from the sample of interest.
* **Lower and upper boundary** : allowed range of Cq values for positive controls.

Excluded means that the data are ignored in the calculations.

| How to check if there are wells that do not meet these criteria ?
| :---------------------------- |
|  You can see flagged and excluded data by ticking the **Show details…** options  on the **Technical quality control** page and clicking the **Next** button (purple) at the bottom of the page.

Qbase+ will open the results of the quality checks for the replicates  and the controls  on two different tabs. These tabs show lists of samples that failed the quality control criteria. When you open the replicates tab  you can get an overview of the flagged  or the excluded (purple) wells. Select the **failing**  wells.

When the difference in Cq between technical replicates exceeds 0.5, the wells end up in the flagged or failing list. They are included in calculations unless you exclude them by unticking them. You see that the two replicates of Palm in Sample05 have very different Cq values. All other bad replicates are coming from standard samples.
If you are finished checking the data quality, click **Next** to go to the **Amplification efficiencies** page.

#### Taking into account amplification efficiencies

Qbase+ calculates an amplification efficiency (E) for each primer pair (= gene). Genes have different amplification efficiencies because:

  - some primer pairs anneal better than others
  - the presence of inhibitors in the reaction mix (salts, detergents…) decreases the amplification efficiency
  - inaccurate pipetting

Qbase+ has a parameter that allows you to specify how you want to handle amplification efficiencies on the **Amplification efficiencies** page.

| How to specify the amplification efficiencies strategy you want to use ?
| :---------------------------- |
|  Since we have included a dilution series for creating a standard curve in our qPCR experiment, we will select

* **Use assay specific amplification efficiencies**
* **Calculate efficiencies from included standard curves**

Amplification efficiencies are calculated based on the Cq values of a serial dilution of representative template, preferably a mixture of cDNAs from all your samples. Since you know the quantity of the template in each dilution, you can plot Cq values against template quantities for each primer pair. Linear regression will fit a standard curve to the data of each gene, and the slope of this curve is used to calculate the amplification efficiency.

| How to check the amplification efficiencies of the genes ?
| :---------------------------- |
|  Once you have made this selection, qbase+ starts calculating the efficiencies and the results are immediately shown in the **calculation efficiencies** table.

In this way, one amplification efficiency (E) for each gene is calculated and used to calculate **Relative Quantities (RQ)**:
∆Cq is calculated for each well by subtracting the Cq of that well from the average Cq across all samples for the gene that is measured in the well. So ∆Cq is the difference between the Cq value of a gene in a given sample and the average Cq value of that gene across all samples. Cq is subtracted from the average because in this way high expression will result in a positive ∆Cq and low expression in a negative ∆Cq. 
**So at this point the data set contains one RQ value for each gene in each sample.**

Click **Next** to go to the **Normalization** page.

#### Normalization

Differences in amplification efficiency are not the only source of variability in a qPCR experiment. Several factors are responsible for noise in qPCR experiments e.g. differences in:

  - amount of template cDNA between wells
  - RNA integrity of samples
  - efficiency of enzymes used in the PCR or in the reverse
    transcription

Normalization will eliminate this noise as much as possible. In this way it is possible to make a distinction between genes that are really upregulated and genes with high expression levels in one group of samples simply because higher cDNA concentrations were used in these samples.
In qPCR analysis, normalization is done based on housekeeping genes.

Housekeeping genes are measured in all samples along with the genes of interest. In theory, a housekeeping gene should have identical RQ values in all samples. In reality, noise generates variation in the expression levels of the housekeeping genes. This variation is a direct measure of the noise and is used to calculate a normalization factor for each sample.
These normalization factors are used to adjust the RQ values of the genes of interest accordingly so that the variability is eliminated.

These adjusted RQ values are called **Normalized Relative Quantities (NRQs)**. In qbase+ housekeeping genes are called reference genes. In our data set there are three reference genes: Stable, Non-regulated and Flexible. On the **Normalization page** we can define the normalization strategy we are going to use, appoint the reference genes and check their stability of expression.

| How to specify the normalization strategy you want to use ?
| :---------------------------- |
|  You can specify the normalization strategy you want to use on the Normalization method page:

* **Reference genes** normalization is based on the RQ values of the housekeeping genes
* **Global mean** normalization calculates normalization factors based on the RQ values of all genes instead of only using the reference genes. This strategy is recommended for experiments with more than 50 random genes. Random means that the genes are randomly distributed over all biological pathways.
* **Custom value** normalization is used for specific study types. This strategy allows users to provide custom normalization factors such as for example the cell count.
* **None** means that you choose to do no normalization at all. This option should only be used for single cell qPCR.

We have incorporated 3 housekeeping genes in our experiment so we select the **Reference genes** strategy.

| How to appoint reference targets ?
| :---------------------------- |
|  You have to indicate which targets should be used as reference genes since qbase+ treats all genes as targets of interest unless you explicitly mark them as reference genes on the Normalization method page:

We have measured 3 housekeeping genes: Stable, Flexible and Non-regulated so we tick the boxes in front of their names.

It's not because you have appointed genes as reference genes that they necessarily are **good** reference genes. They should have stable expression values over all samples in your study. Fortunately, qbase+ checks the quality of the reference genes. For each appointed reference gene, qbase+ calculates two indicators of expression stability

  - **M** (geNorm expression stability value): calculated based on the pairwise variations of the reference genes.
  - **CV** (coefficient of variation): the ratio of the standard deviation of the NRQs of a reference gene over all samples to the mean NRQ of that reference gene.

It is considered that the higher these indicators the less stable the reference gene.

| Are Flexible, Stable and Nonregulated good reference targets ?
| :---------------------------- |
|  M and CV values of the appointed reference genes are automatically calculated by qbase+ and shown on the Normalization method page:

The default limits for M and CV were determined by checking M-values and CVs for established reference genes in a pilot experiment that was done by Biogazelle. Based on the results of this pilot experiment, the threshold for CV and M was set to 0.2 and 0.5 respectively.
If a reference gene does not meet these criteria it is displayed in red. As you can see the M and CV values of all our reference exceed the limits and are displayed in red.

If the quality of the reference genes is not good enough, it is advised to remove the reference gene with the worst M and CV values and re-evaluate the remaining reference genes.

| Which reference target are you going to remove ?                                                                                                                                    |
| :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Both the M-value and the CV are measures of variability. The higher these values the more variable the expression values are. So we will remove the gene with the highest M and CV. |

You can remove a reference gene simply by unticking the box in front of its name.

| Are the two remaining reference genes good references ?
| :---------------------------- |
|  After removing Flexible as a reference gene the M and CV values of the two remaining reference genes decrease drastically to values that do meet the quality criteria. M and CV values that meet the criteria are displayed in green.

This exercise shows the importance of using a minimum of three reference genes. If one of the reference genes does not produce stable expression values as is the case for Flexible, you always have two remaining reference genes to do the normalization.

[See how to select reference genes for your qPCR experiment](http://wiki.bits.vib.be/index.php/Using_GeneVestigator_to_select_candidate_reference_genes).

**So after normalization you have one NRQ value for each gene in each sample.**

Click **Next** to go to the **Scaling** page.

#### Scaling

Rescaling means that you calculate NRQ values relative to a specified reference level.

Qbase+ allows you to rescale the NRQ values using one of the following as a reference:

  - the sample with the minimal expression
  - the average expression level of a gene across all samples
  - the sample with the maximal expression
  - a specific sample (e.g. untreated control)
  - the average of a certain group (e.g. all control samples): this is
    often how people want to visualize their results
  - positive control: only to be used for copy number analysis

After scaling, the expression values of the choice you make here will be set to 1 e.g. when you choose **average** the average expression level across all samples will be set to 1 and the expression levels of the individual samples will be scaled accordingly.

| How to scale to the average of the untreated samples ?
| :---------------------------- |
|  You can specify the scaling strategy on the **Scaling** page. Select **Scale to group** and set the **Scaling group** to the **untreated** samples . This is one of the reasons why you need the grouping annotation.

Rescaling to the average of a group is typically used to compare results between 2 groups, e.g. treated samples against untreated controls. After rescaling, the average of the NRQs across all untreated samples is 1 and the NRQs of the treated samples are scaled accordingly.

Click **Next** to go to the **Analysis** page.

#### Visualization of the results

One of the things you can select to do on the **Analysis** page is viewing the relative expression levels (= scaled NRQs) of each of the genes in a bar chart per gene. It is recommended to visualize your results like this.

It is possible to view the relative expression levels of all genes of interest on the same bar chart. You can use this view to see if these genes show the same expression pattern but you cannot directly compare the heights of the different genes because each gene is independently rescaled\!

| How to visualize single gene expression bar charts ?
| :---------------------------- |
|  Select **Visually inspect results For individual targets** on the **Analysis** page and click **Finish**

| How to visualize the expression levels of Palm in each sample ?
| :---------------------------- |
|  Select **Visually inspect results For individual targets** on the **Analysis** page and click **Finish**

The **Target** select box allows you to select the gene you want to view the expression levels of. Relative expression levels are shown for each sample. Error bars are shown and represent the technical variation in your experiment (variation generated by differences in amounts pipetted, efficiency of enzymes, purity of the samples...).

You see that Palm has a low expression level and a very large error bar in Sample05 because the two replicates of this sample had very different Cq values. You can group and colour the bars according to a property.

| How to group the bars of Palm according to treatment (so treated at one side and untreated at the other side)
| :---------------------------- |
|  In the **Grouping** section you can specify the property you want to group by.

| How to view average expression levels in each group ?
| :---------------------------- |
|  In the **Grouping** section you can choose to plot individual samples as shown above but you can also choose to **plot group average** expression levels.

The error bars that you see here represent biological variation and will be used later on in the statistical analysis. The error bars are 95% confidence intervals which means that they represent the range that will contain with 95% certainty the real average expression level in that group of samples.
The nice characteristic of 95% confidence intervals is the following:

  - if they do not overlap you are sure that the expression levels in the two groups are significantly different, in other words the gene is differentially expressed
  - if they do overlap you cannot say that you are sure that the expression levels are the same. You simply don’t know if the gene is differentially expressed or not.

| Assess the effect of switching the Y-axis to a logarithmic scale for Palm.
| :---------------------------- |
|  In the **Y axis** section you can specify if you want a linear or logarithmic axis.
As you can see you do not change the expression values, you just change the scale of the Y axis. Switching the Y-axis to a logarithmic scale can be helpful if you have large differences in NRQs between different samples

| Assess the effect of switching the Y-axis to a logarithmic scale for Flexible.
| :---------------------------- |
|  Switch to the bar charts of Flexible. By switching the Y-axis to logarithmic you can now see more clearly the differences between samples with small NRQs.

#### Statistical analysis

Once you generate target bar charts you leave the **Analysis wizard** and you go to the regular qbase+ interface. Suppose that you want to perform a statistical test to prove that the difference in expression that you see in the target chart is significant.
At some point, qbase+ will ask you if your data is coming from a normal distribution. If you don't know, you can select **I don't know** and qbase+ will assume the data are not coming from a normal distribution and perform a stringent non-parametric test.
However, when you have **7 or more replicates per group**, you can check if the data is normally distributed using a statistical test. If it is, qbase+ will perform a regular t-test. The upside is that the t-test is less stringent than the non-parametric tests and will find more DE genes. However, you may only perform it on normally distributed data. If you perform the t-test on data that is not normally distributed you will generate false positives i.e. qbase+ will say that genes are DE while in fact they are not. Performing a non-parametric test on normally distributed data will generate false negatives i.e. you will miss DE genes.

Checking if the data is normally distributed can be easily done in GraphPad Prism. To this end you have to export the data.
| How to export the data ?
| :---------------------------- |
|  To export the results click **the upward pointing arrow** in the qbase+ toolbar:
You want to export the normalized data so select **Export Result Table (CNRQ)**:
You will be given the choice to export results only (CNRQs) or to include the errors (standard error of the mean) as well . We don't need the errors in Prism so we do not select this option.
The scale of the Result table can be linear or logarithmic (base 10) . Without user intervention, qbase+ will automatically log10 transform the CNRQs prior to doing statistics. So we need to check in Prism if the log transformed data are normally distributed.
Additionally, you need to tell qbase+ where to store the file containing the exported data. Click the **Browse** button for this .

Exporting will generate an Excel file in the location that you specified. However, the file contains the results for all samples and we need to check the two groups (treated and untreated) separately. The sample properties show that the even samples belong to the treated group and the odd samples to the untreated group.
This means we have to generate two files:

  - [a file containing the data of the untreated samples](http://data.bits.vib.be/pub/trainingen/qbasePLUS/resultslog.csv)
  - [a file containing the data of the treated samples](http://data.bits.vib.be/pub/trainingen/qbasePLUS/resultslogTreated.csv)

Now we can open these files in Prism to check if the data is normally distributed.

| How to import the data of the untreated samples in Prism ?
| :---------------------------- |
|  
* Open Prism
* Expand **File** in the top menu
* Select **New**
* Click **New Project File**
* In the left menu select to create a **Column** table. Data representing different groups (in our case measurements for different genes) should always be loaded into a column table.
* Select **Enter replicate values, stacked into columns** (this is normally the default selection) since the replicates (measurements for the same gene) are stacked in the columns.
* Click **Create**

Prism has now created a table to hold the data of the untreated samples but at this point the table is still empty. To load the data:

* Expand **File** in the top menu
* Select **Import**
* Browse to the resultslog.csv file, select it and click **Open**
* In the **Source** tab select **Insert data only**
* Since this is a European csv file commas are used as decimal separators so in contrast to what its name might imply, semicolons and not commas are used to separate the columns in the csv file (you can open the file in a text editor to take a look). In American csv files dots are used as decimal separator and the comma is used to separate the columns. Prism doesn't know the format of your csv file so you have to tell him the role of the comma in your file. Select **Separate decimals**
* Go to the **Filter** tab and specify the rows you want to import (the last rows are these of the standard and the water samples, you don't want to include them)
* Click **Import**

As the file is opened in Prism you see that the first column containing the sample names is treated as a data column. Right click the header of the first column and select **Delete**

| How to check if the data of the untreated samples comes from a normal distribution ?
| :---------------------------- |
|  
* Click the **Analyze** button in the top menu
* Select to do the **Column statistics** analysis in the **Column analyses** section of the left menu
* In the right menu, deselect **Flexible**. It's a bad reference gene so you will not include it in the qbase+ analysis so there's no point checking its normality (it is probably not normally distributed). In that respect you could also deselect the other two reference genes since you will do the DE test on the target genes and not on the reference genes.
* Click **OK**
* In the **Descriptive statistics** and the **Confidence intervals** section deselect everything except **Mean, SD, SEM**. These statistics is not what we are interested in: we want to know if the data comes from a normal distribution. The only reason we select Mean, SD, SEM is because if we make no selection here Prism throws an error.
* In the **Test if the values come from a Gaussian distribution** section select the **D'agostino-Pearson omnibus test** to test if the data are drawn from a normal distribution. Although Prism offers three tests for this, the D'Agostino-Pearson test is the safest option.
* Click **OK**

Prism now generates a table to hold the results of the statistical analysis: As you can see, the data for Palm are not normally distributed.

Since we found that there's one group of data that does not follow a normal distribution, it's no longer necessary to check if the treated data are normally distributed but you can do it if you want to. We will now proceed with the statistical analysis in qbase+. Statistical analyses can be performed via the **Statistics wizard**.

| How to open the Statistics wizard ?
| :---------------------------- |
|  You can open it in the **Project Explorer** (window at the left):

* expand **Project1** if it's not yet expanded
* expand the **Experiments** folder in the project if it's not yet expanded
* expand the **GeneExpression** experiment if it's not yet expanded
* expand the **Analysis** section if it's not yet expanded
* expand the **Statistics** section
* double click **Stat wizard**

This opens the **Statistics wizard** that allows you to perform various kinds of statistical analyses.

| Which kind of analysis are you going to do ?                                                                                                                                                                                                                                                      |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| On the **Goal** page: Select **Mean comparison** since you want to compare expression between two groups of samples so what you want to do is comparing the mean expression of each gene in the treated samples with its mean expression level in the untreated samples. Click **Next**. |

| How to define the groups that you are going to compare ?
| :---------------------------- |
|  On the **Groups** page: specify how to define the two groups of samples that you want to compare. Select **Treatment** as the grouping variable to compare treated and untreated samples. Click **Next**.

| How to define the genes that you want to analyze ?
| :---------------------------- |
|  On the **Targets** page: specify for which targets of interest you want to do the test. Deselect **Flexible** since you do not want to include it in the analysis. It's just a bad reference gene. Click **Next**.

On the **Settings** page you have to describe the characteristics of your data set, allowing qbase+ to choose the appropriate test for your data. 

The first thing you need to tell qbase+ is whether the data was drawn from a normal or a non-normal distribution. Since we have 8 biological replicates per group we can do a test in Prism to check if the data are normally distributed.

| Which gene(s) is/are differentially expressed ?
| :---------------------------- |
|  On the **Settings** page you describe the characteristics of your data set so that qbase+ can choose the ideal test for your data. For our data set we can use the default settings. Click **Next**. In the results **Table** you can see that the p-value for Palm is below 0.05 so Palm is differentially expressed.



In this example we will analyze data from another expression study with the following characteristics:

All samples fit in a single run: [Run7](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run7.xls)
We have the following samples:

  - 5 control samples: control1, control2…
  - 5 treated samples: treated1, treated2…
  - 1 no template control: NTC

The expression of the following genes was measured:

  - 2 reference genes: refgene1 and refgene2
  - 2 genes of interest: gene1 and gene2

There are two technical replicates per reaction

#### Creating a new experiment

| Create a new Experiment called GeneExpression2 in Project1
| :---------------------------- |
| You can find the details on how to create a new experiment in [](Creating_a_project_and_an_experiment" title="wikilink)Creating a project and an experiment

#### Loading the data

| Import [Run7](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run7.xls). This file is in qBase format.                    |
| :-------------------------------------------------------------------------------------------------------------------------------------- |
| You can find the details on how to import the data file in the **Loading the data into qbase+** section of [Analyzing data from a geNorm pilot experiment in qbase+](Analyzing_data_from_a_geNorm_pilot_experiment_in_qbase+ "wikilink") |

#### Adding sample annotation

Download the [the sample properties
file](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Sample_Properties_GE2.xlsx).
| Add a custom sample property called Treatment.
| :---------------------------- |
| You can find the details on how to add a custom sample property in the **Adding annotation to the data** section of [](Loading_data_into_qbase+" title="wikilink)Loading data into qbase+

#### Analyzing the data

| Choose the type of analysis you want to perform.
| :---------------------------- |
| 

| Check controls and replicates.
| :---------------------------- |
| First set the minimum requirements for controls and replicates 
You see that 6 replicates do not meet these requirements . Select to **Show details and manually exclude bad replicates**
All negative controls pass the test . Positive controls were not included in this analysis.
Qbase+ will now open the results for the failing replicates: as you can see the difference in Cq values between these replicates is not that big. They fail to meet the requirement just slightly.

| Which amplification efficiencies strategy are you going to use ?
| :---------------------------- |
| You don't have data of serial dilutions of representative template to build standard curves so the only choice you have is to use the default amplification efficiency (E = 2) for all the genes.

| Appoint the reference genes as reference targets.
| :---------------------------- |
| You can find the details on how to appoint reference targets in the **Normalization** section of [](Analyzing_gene_expression_data_in_qbase+" title="wikilink)Analyzing gene expression data in qbase+

| Is the stability of the reference genes ok ?
| :---------------------------- |
| In the **Reference target stability window** the M and CV values of the reference genes are shown in green so the stability of the reference genes is ok. You can find the details on how to check reference target stability in the **Normalization** section of [](Analyzing_gene_expression_data_in_qbase+" title="wikilink)Analyzing gene expression data in qbase+

| Which scaling strategy are you going to use ?
| :---------------------------- |
| Since you have a treated and a **control** group, it seems logical to use the average of the control group for scaling. You can find the details on how to specify the scaling strategy in the **Scaling** section of [](Analyzing_gene_expression_data_in_qbase+" title="wikilink)Analyzing gene expression data in qbase+

Look at the target bar charts.

| In the target bar charts group the samples according to treatment.
| :---------------------------- |
| You can find the details on how to group the samples in the **Visualization of the results** section of [](Analyzing_gene_expression_data_in_qbase+" title="wikilink)Analyzing gene expression data in qbase+

The samples of each group are biological replicates so you might want to generate a plot that compares the average expression of the treated samples with the average expression of the untreated samples.

| In the target bar charts plot the group averages instead of the individual samples.
| :---------------------------- |
| In the **Grouping** section at the bottom of the chart you can select **Plot group average**:

| Are there any genes for which you see a clear difference in expression between the two groups ?
| :---------------------------- |
| For gene 1, the mean expression levels in the two groups are almost the same and the error bars completely overlap.

When you look at the title of the Y-axis, you see that 95% confidence levels are used as error bars. In case of 95% confidence intervakls you can use the following rules:

* if they do not overlap: you are certain that the difference between the means of the two groups is significant
* if they do not overlap: you know nothing with certainty: the means can be different or they can be the same

So for gene 1 the means are very close but just based on the plot we may not make any conclusions with certainty. For gene 2, the mean expression levels in the two groups are very different and the error bars do not overlap. So the 95% confidence intervals do not overlap meaning that we can be certain that the difference between the means of the two groups is significant.

| Use a statistical test to compare the expression levels between the two groups of samples ?
| :---------------------------- |
| You only have 5 replicates per group so you cannot test if the data comes from a normal distribution. Qbase+ will assume they're not normally distributed and perform a non-parametric Mann-Whitney test.

The p-value of gene2 is smaller than 0.05 so it has a statistically significant difference in expression levels in treated samples compared to untreated samples. For gene1 the p-value is 1 so we have no evidence to conclude that the expression of gene1 is different in treated compared to untreated samples. You can find the details on how to compare the means of the two groups in the **Statistical analysis** section of [](Analyzing_gene_expression_data_in_qbase+" title="wikilink)Analyzing gene expression data in qbase+
