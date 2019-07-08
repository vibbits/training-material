|Build|Links|
|------|-----|
[![Build Status](https://travis-ci.org/galaxyproject/training-material.svg?branch=master)](https://travis-ci.org/galaxyproject/training-material) | [![Deploy Status](https://travis-ci.org/galaxyproject/training-material.svg?branch=gh-pages)](https://travis-ci.org/galaxyproject/training-material)|


VIB Bioinformatics Core training material
========================

This repository collects tutorials, slides, and exercises developed and maintained by VIB Bioinformatics Core.

# Usage

The content of the material is developed in Markdown and a templating system ([Jekyll](http://jekyllrb.com/)) is used to format the tutorials and generate a website ([http://training.bits.vib.be](http://training.bits.vib.be)).

# License

This work is licensed under the [Creative Commons Attribution 4.0 International License](https://creativecommons.org/licenses/by/4.0).

# Acknowledgment and Funding

We would like to thank all contributors, especially those mentioned in the [Contributors list](CONTRIBUTORS.yaml).

# Remarks:
Within the conda environment `base` you can add a new topic and tutorial with 
```
planemo training_init --topic_name "my-topic" --tutorial_name "my-new-tutorial2" --tutorial_title "Title of the tutorial"
```

Thereafter, remove any placeholder contributor and replace with the real ones in the files `topics/<new topic>/tutorials/<new tutorial>/tutorial.md` and `topics/<new topic>/slides/introduction.html`.

Adapt the file `topics/<new topic>/metadata.yaml` to follow this template, the keywords for `category` can be `software`, `omics`, `basics`, `advanced`, `programming`, `statistics`, and `admin-dev`.

The type must be `basics` to display the link to the slides and the hands-on materials.

```
---
name: QPCR-analysis-using-qbasePLUS
type: basics
category: software
title: 'QPCR analysis using qbasePLUS'
summary: Summary of the topic
requirements:
maintainers:
- chdeb
references:
- authors: authors et al
  title: the title
  link: link
  summary: ''
```
