---
layout: tutorial_hands_on

title: "Share: Data availability for reuse" 
zenodo_link: ''
questions:
- What does Open Science entail?
- What is FAIR data?
objectives:
- Discern various repositories to store and/or share your data;
- Understand that you should manage a license for use of data yourself;
- Identify ways to ensure that privacy-sensitive data can be shared
- Understand how shared datasets can be cited.
time_estimation: 35M
subtopic: share 
key_points:
- The take-home messages
- They will appear at the end of the tutorial
contributors:
- abotzki 

---

<!-- This is a comment. -->

## Introduction to data availability for reuse

Thanks to information and communication technology and globalisation new opportunities arise to exchange results of scientific research - publications and research data - and even of scientific methods and practices. This new way of practising science is called ‘open science’.

Open data is a part of this movement towards open science. It is the ambition of universities, governments, funders and publishers to make research data optimally suited for reuse.

There are different reasons why you may not be able to share your research data. Thinking about these issues and challenges when developing your data management plan will help you reflect on such reasons in an early stage.

**How frustrating a data request can be**

Not being prepared to share your data can lead to problems in using the data. In this short video, you see what shouldn't happen when a researcher makes a data sharing request! Topics include storage, documentation, and file formats. A made up, yet not unrealistic story.


<iframe src="https://www.youtube.com/embed/66oNv_DJuPc" allowfullscreen="" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" height="515px" style="display: inline-block;" width="800px" title=""></iframe>

## Introduction to data repositories

In order to preserve, manage, and provide access to your research data, you can deposit your data in a data repository. Data repositories allow permanent access to datasets in a trustworthy environment and enable search, discovery, and reuse of the data they host.

Click on the topics below to find out more about data repositories.

TODO: add repositories from Elixir

**A wide variety**

There is a wide variety of data repositories. Most have the option to publish your dataset using a persistent identifier and some provide the service of long-term preservation. Some repositories host data from various disciplines and others are domain- or discipline specific.

**Choosing a data repository**

When choosing a repository for your data be sure to check if the repository meets your criteria or the criteria set by your funder or journal editors.

Criteria to select a certain repository can be:

* Is the repository certified with a [CoreTrustSeal](https://www.coretrustseal.org/) or Data Seal of Approval?
Repositories with a Data Seal of Approval are recognised in the community as a trustworthy source of data.
* Is long term archiving guaranteed or not?
Some repositories will guarantee the legibility of the data, even if the hardware and software become obsolete.
* What are the costs per dataset or gigabyte?
Repositories differ in their cost model, some allow free deposits up to a certain amount of storage
* What is the physical storage location of data?
The location of your data determines under which data protection law it falls. Some repositories store data in the US and others in the EU.
* What is the default license?
Some repositories allow for open or restricted access, or you can specify which license for use you want for your data.

You can use this [repository selection tool](https://www.uu.nl/en/research/research-data-management/tools-services/tools-for-storing-and-managing-data/decision-aid-data-repositories) to help you select a suitable repository.

**Registry of research data repositories**

You can browse or search for a data repository in re3data.org. This is a global registry of research data repositories covering different academic disciplines. You can search or browse by subject, content type or country. You can filter the search and browse results on criteria for choosing a data repository as described above.

[https://www.re3data.org/](https://www.re3data.org/)

**Some well-known and more generic repositories**

* [Zenodo](https://zenodo.org/) – a repository that enables researchers, scientists, EU projects and institutions to share and showcase multidisciplinary research results (data and publications) that are not part of the existing institutional or subject-based repositories of the research communities;
* [Dryad](http://www.datadryad.org/) – a curated general-purpose repository that makes the data underlying scientific publications discoverable, freely reusable and citable. Dryad has integrated data submission for a growing list of journals;
* [Open Science Framework (OSF)](https://osf.io/) - a scholarly commons to connect the entire research cycle. It is part network of research materials, part version control system, and part collaboration software;
* [Figshare](https://figshare.com/) – a repository that allows researchers to publish all of their research outputs in an easily citable, sharable and discoverable manner.

## Explore data repositories

You have just learned about the existence of a global registry of research data repositories that covers repositories from different academic disciplines.

Re3data.org makes it possible to search for a repository that meets your criteria.

Go to [www.re3data.org/search](http://www.re3data.org/search) and find a repository that meets all three of the following criteria:

* Certificate → CoreTrustSeal
* Data licenses → CC0 (Creative Commons 0)
* Persistent identifier (PID systems) → DOI (Digital Object Identifier)

Make use of the filters offered on the left side of the screen, as visualized here:

TODO: quiz with ELIXIR resources

### Give clarity with (Creative Commons) licenses

In order to publish your data and make it reusable, you require a license. A license creates clarity and certainty for potential users of your data. A license is not an option for all data; some of it may be too confidential or privacy-sensitive to be published.

**Creative Commons licenses**

Licenses such as the [Creative Commons](https://creativecommons.org/share-your-work/licensing-types-examples/) (CC) licenses replace 'all rights reserved' copyright with 'some rights reserved'. There are seven standard CC licenses. CC-BY is the most commonly used license, in which attribution is mandatory when using data. You can also choose restrictions like non-commercial, no derivatives, or share alike. Creative Commons offers a [guide](https://creativecommons.org/choose/?lang=en) to help you determine your preferred license.

![Creative Commons](../../images/CC.png "Creative Commons")

**Assigning a license to your data**

Assigning licenses to data can also have disadvantages. Licenses are static and do not change with the quick developments in the field of research data. Therefore, some data repositories work with a CC0 license whereby no rights are reserved. Instructions regarding use are completed with codes of conduct, which may be adapted more easily.

A short movie explaining the different Creative Commons elements is shown below. Remember that sharing without a license can still lead to conflicts.

TODO: add video on CC licenses?

**Question**

We are very interested to know what license you would choose if you were to share the underlying research data of your most recent publication.  

An explanation for each license can be found by clicking on the links below.

1. CC BY: [Attribution](https://creativecommons.org/share-your-work/licensing-types-examples/licensing-examples/#by)
2. CC BY-SA: [Attribution ShareAlike](https://creativecommons.org/share-your-work/licensing-types-examples/licensing-examples/#sa)
3. CC BY-ND: [Attribution-NoDerivs](https://creativecommons.org/share-your-work/licensing-types-examples/licensing-examples/#nd)
4. CC BY-NC: [Attribution-NonCommercial](https://creativecommons.org/share-your-work/licensing-types-examples/licensing-examples/#nc)
5. CC BY-NC-SA: [Attribution-NonCommercial-ShareAlike](https://creativecommons.org/share-your-work/licensing-types-examples/licensing-examples/#by-nc-sa)
6. CC BY-NC-ND: [Attribution-NonCommercial-NoDerivs](https://creativecommons.org/share-your-work/licensing-types-examples/licensing-examples/#by-nc-nd)
7. CC0: [Public Domain](https://creativecommons.org/share-your-work/public-domain/)

## Publishing in a data journal

Data journals are publications whose primary purpose is to publish datasets. They enable you as an author to focus on the data itself, rather than producing an extensive analysis of the data which occurs in the traditional journal model. Fundamentally, data journals seek to:

* Promote scientific accreditation and reuse;
* Improve transparency of scientific methods and results;
* Support good data management practices;
* Provide an accessible and permanent route to the dataset.

**The benefits of publishing in a data journal**

Publishing in a data journal may be of interest to researchers and data producers for whom data is a primary research output. In some cases, the publication cycle may be quicker than that of traditional journals, and where there is a requirement to deposit data in an "approved repository", long-term curation and access to the data is assured.

Publishing a data paper may be regarded as best practice in data management as it:

* Includes an element of peer review of the dataset;
* Maximises opportunities for reuse of the dataset;
* Provides academic accreditation for data scientists as well as for front-line researchers.
(source: [ANDS Guide](http://www.ands.org.au/working-with-data/publishing-and-reusing-data/data-journals))

**General and disciplinary data journals**

There are data journals for various disciplines and also more general data journals exist. A widespread standard PID is the DOI. DOI stands for ‘Digital Object Identifier’. A DOI is an alphanumeric string assigned to an object which allows for an object to be identified over time. Often a DOI will be presented as a link which looks like: https://doi.org/10.1109/5.771073. There are other identifiers available which some repositories may use instead. If you are depositing in a reputable repository then you should be given some type of persistent identifier which you can use to cite and link to your data.

Examples of generic data journals:

* [Scientific Data](http://www.nature.com/sdata/about)  
* [Data in Brief](http://www.journals.elsevier.com/data-in-brief)   
* [Data Science Journal](http://www.codata.org/publications/data-science-journal)

Examples of disciplinary data journals:

TODO: check for life science additions

Open archaeology data;
Earth System Science Data;
Research Data Journal for the Humanities and Social Sciences.

## How to cite a dataset

Citations to your data can add to your academic impact.

A citation should include enough information so that the exact version of the data being cited can be located. Including a Persistent Identifier (PID) in the citation ensures that even if the location of the data changes, the PID will always link to the data that were used.

You can indicate in your (Creative Commons) license or user agreement that you want your data cited when reused.

Data citations work just like book or journal article citations and can include the following information:

* Author;
* Year;
* Dataset title;
* Repository;
* Version;
* Persistent IDentifier (PID), often works as a functional link/URL.

**Examples**

A widespread standard PID is the DOI. DOI stands for ‘Digital Object Identifier’. A DOI is an alphanumeric string assigned to an object which allows for an object to be identified over time. Often a DOI will be presented as a link which looks like: https://doi.org/10.1109/5.771073. There are other identifiers available which some repositories may use instead. If you are depositing in a reputable repository then you should be given some type of persistent identifier which you can use to cite and link to your data.

Irino, T; Tada, R (2009): Chemical and mineral compositions of sediments from ODP Site 127‐797. Geological Institute, University of Tokyo. http://dx.doi.org/10.1594/PANGAEA.726855


**Tips**

Tip1: Get a PID at the data repository of your choice.
Tip2: Is your PID a DOI and do you want to cite it in the format of a specific journal? Use the [DOI formatter](https://citation.crosscite.org/) from CrossCite.


TODO: add short quiz

### FAIR data

FAIR stands for ‘Findable, Accessible, Interoperable, and Reusable’. The FAIR data principles act as an international guideline for the result of high-quality data management.

With the increase in volume, complexity and creation speed of data, humans are more and more relying on computational support for dealing with data. The principles were defined with the focus on machine-actionability, i.e. the capacity of computational systems to find, access, interoperate and reuse data with none or minimal human intervention.

* F – Findable

By using correct metadata to describe the data, it will be findable. By using a persistent identifier the data can be found by computer systems automatically.

* A – Accessible

The data should be accessible for the long term. Even when underlying data is not accessible, the describing metadata should remain available.

* I – Interoperable

The data can be used and combined with other datasets. To achieve this, the data should be stored in generic file types, not in software specific file types.

* R – Reusable

The options for reuse should be stated clearly in a license. Without a license there is no certainty about the options for reuse and creator rights are implicit.

**How to achieve FAIR data**

In general, having a good data management plan will lead to FAIR data. In the case of privacy-sensitive data, it is possible to meet the criteria, but not to share the data openly. In this case you can make sure that a well-described dataset can be found online, while preventing the underlying data to be downloaded and used without permission.

If you anonymise your data, presuming the data is of limited sensitivity and you are very sure the data cannot lead back to the persons involved, you can share your data openly.

The FAIR Guiding Principles were put together and published in Scientific Data (Mark D. Wilkinson et al., “The FAIR Guiding Principles for Scientific Data Management and Stewardship,” Scientific Data 3 (March 15, 2016): 160018.).

TODO: add question H5P quiz?

### Open science

“Open Science is the practice of science in such a way that others can collaborate and contribute, where research data, lab notes and other research processes are freely available, under terms that enable reuse, redistribution and reproduction of the research and its underlying data and methods.”

(Source:[ FOSTER](https://www.fosteropenscience.eu/foster-taxonomy/open-science-definition)).

You have learned that good data management contributes to the findability, accessibility, interoperability and reusability of your research data. This does not necessarily mean that you should make your data openly available. But to open up data, you do need good data management from the earliest possible stage of your research project.

TODO: add links to ORION course or other relevant elements
Flemish open science plan?

### Write your data management plan for your data reuse

Go to DMPonline and open your draft data management plan created in the Introduction.

You have now completed the module on data sharing and availability for reuse. You should be able to complete the following questions in the section ‘Data availability for reuse’:

* What secondary use of your data is intended or foreseeable?
* Where will you make your data available?
* What access and usage conditions will apply?
