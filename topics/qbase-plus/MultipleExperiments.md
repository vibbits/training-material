You need to do inter-run calibration if you want to compare samples from different runs e.g.:

  - when it is not possible to get all samples for the same gene on the same plate
  - when you do additional runs weeks or months after your initial experiment

Of course there is a lot of variability between runs on a qPCR instrument:

  - thermal block is not always heating uniformously
  - quality of the lamp, the filters and the detector decreases over time
  - data analysis settings on the qPCR instrument (baseline correction and threshold) can be slightly different
  - efficiency of reagents (polymerase, fluorophores) is variable
  - optical properties of the plastic plates vary

Fortunately, inter-run calibration allows you to eliminate most of this variability.

In this experiment we will analyze the data from the gene expression experiment (see Analyzing gene expression data in qbase+) together with data from 2 runs (Run4 and Run5) that were done weeks after the initial gene expression experiment.

Because the data comes from two different experiments spread over time, we have included three inter-run calibrators on the plates: Sample01, Sample02 and Sample03.

The principle of the IRCs is very similar to that of the reference genes:
In theory, the IRCs should have the same NRQ in each run. In practice, the difference in NRQ between two runs is a measure of the inter-run variation and can be used to adjust the NRQs to remove the inter-run variation.

#### Creating a new Experiment
| Import [Run1](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run1.xls), [Run2](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run2.xls), [Run3(all three in CFX format)](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run3.xls), [Run4](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run4.xls) and [Run5 (the latter two are in qBase format)](http://data.bits.vib.be/pub/trainingen/qbasePLUS/DataTraining/Run5.xls).
| :----------------------------- |
| Since the data is in files of two different format, you have to do a separate import for each format. So first import Run1, Run2 and Run3, then import Run4 and Run5. You can find the details on how to import CFX files in [](Loading_data_into_qbase+" title="wikilink)Loading data into qbase+.
The details of importing qBase files are in [](Analyzing_data_from_a_geNorm_pilot_experiment_in_qbase+" title="wikilink)Analyzing data from a geNorm pilot experiment in qbase+

#### Analyzing the data

| Use assay specific amplification efficiencies.
| :----------------------------- |
| You can find the details on how to convert the targets in the **Taking into account amplification efficiencies** section of Analyzing gene expression data in qbase+

In Analyzing gene expression data in qbase+ we have already checked the stability of the reference genes (see **Normalization** section). We determined that Flexible did not show stable expression.

| Convert Stable and Nonregulated to Reference targets.
| :----------------------------- |
| You can find the details on how to convert the targets in the **Normalization** section of Analyzing gene expression data in qbase+
| Appoint Sample01, Sample02 and Sample03 as IRCs.
| :----------------------------- |
| Leave the Analysis wizard by clicking the **Close wizard** button in the top menu.

 - Expand **Intermediate results** (red) in the **Project Explorer**
 - Double click **Interrun calibration** (green)

This opens the **Interrun calibration window**:

 - Click the **New** button (blue) to create a IRC
 - Once the IRC is created you have to appoint samples to it: select **Sample01** in the list of **Other samples**
 - Click the **Add Sample** button (purple)
 - Remember that you cannot give IRCs the same name in different runs: the software would think that they are technical replicates spread over different plates (which is not allowed). Therefore, in Run4 and Run5 we have given Sample01 another name: Sample01_2. Select **Sample01_2** in the list of **Other samples**
 - Click the **Add Sample** button (purple)

You have appointed the first IRC (grey), now do the same for the other two IRCs.

Remember that for each target the variability of the normalized
expression levels of the IRCs between different runs will be used to
adjust the other normalized expression levels of that target gene. The
adjustment is done by amplifying the normalized expression levels with a
calibration factor that is calculated based on the normalized expression
levels of the IRCs.
Since variability between runs is the same for each IRC, you expect that
all IRCs measure the variability between the runs to the same extent,
hence leading to similar calibration factors.

| Do these IRCs generate similar calibration factors ?
| :----------------------------- |
| Open the **Calibration Factors** tab (red) of the **Interrun calibration window** and look at the result for Duvel:

You see that IRC2 returns a substantially different calibration factor in Run5 (green) so the validity of this IRC should be interpreted with care.
For Leffe the IRCs also gives inconsistent results in Run5. Switch to the results for Leffe by selecting **Leffe** in the **Targets** list (blue)
| Do you still see the same expression pattern for Palm as you did in the first three runs ?
| :----------------------------- |
| Open the target bar chart for Palm.

You see that the pattern Palm showed in the first three runs (sample01 to sample16): high expression in the odd and low expression in the even samples is reversed in the samples from Run4 and Run5 (sample17 to sample25). In the latter runs you see high expression in the even and low expression in the odd samples. However, without annotation for Run4 and Run5 (which samples are treated and which not) it's impossible to interpret the bar chart.

1. [Link](http://youtu.be/OJFsuZqNUHs)