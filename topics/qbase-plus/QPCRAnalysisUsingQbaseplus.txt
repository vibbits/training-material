---
layout: tutorial_hands_on

title: "qPCR analysis using qbase+"
questions:
  - "How do you perform a qPCR analysis using the qbase+ software?"
objectives:
  - "Design qPCR experiments"
  - "Design qPCR primers"
  - "Use the qbase+ software to analyze the qPCR experiment results."
time_estimation: "5m"
contributors:
  - chdeb 
---

qbase+ is software to visualize and analyze qPCR data. It allows you to perform various types of analyses:
  - statistical analysis of gene expression
  - advanced copy number analysis
  - miRNA profiling
  - ChIP-qPCR analysis
# Installation and licensing
You can find the installation instructions on [VIB qbase+ support page](https://www.bits.vib.be/index.php/software-overview/qbaseplus)
VIB only offers qbase+ to VIB scientists, you need a valid VIB email address to run the software. Biogazelle (the company who has developed the software) have written a manual with instructions on how to use the software. Download [Biogazelle's user manual](https://www.biogazelle.com/system/files/manuals/qbaseplus_manual_0.pdf). Before you can download the manual you have to log on to [the qbase+ website](https://www.qbaseplus.com/) using your qbase+ account. Use your VIB email address for setting up this account.
# Training material
  - [slides](http://data.bits.vib.be/pub/trainingen/qbasePLUS/qbase_2018.pdf)
  
  **Extra**
  - [clean log10 transformed CNRQs](http://data.bits.vib.be/pub/trainingen/qbasePLUS/Log10CNRQsClean.xlsx) for checking normality in Prism
  - [clean untransformed CNRQs](http://data.bits.vib.be/pub/trainingen/qbasePLUS/CNRQsClean.xlsx) for visualization in Prism
  - [R script](http://data.bits.vib.be/pub/trainingen/qbasePLUS/qPCR.R) for analysis and visualization
  - [log10 transformed CNRQs of control samples](http://data.bits.vib.be/pub/trainingen/qbasePLUS/resultslog.csv) for analysis and visualization in R
  - [log10 transformed CNRQs of treated samples](http://data.bits.vib.be/pub/trainingen/qbasePLUS/resultslogTreated.csv) for analysis and visualization in R
