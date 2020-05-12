---
layout: tutorial_hands_on

title: "Prepare: Data documentation"
zenodo_link: ''
questions:
- What important tasks do you have to do to document data?
- What is metadata?
objectives:
- Understand why your research data needs to be documented and why other researchers rely on this documentation;
- Understand why metadata is used and when you need to use this;
- List different descriptions of data (record, study, code);
- Describe the purpose/goals of descriptions of data;
- State why standards are important and how to find and apply them;
- Name and apply the do’s and don’ts in arranging folders and naming files;
- Recognise the importance of managing data files;
- Apply the gained knowledge about data documentation to your own research data and write the data documentation section for your data management plan.
time_estimation: 50M
subtopic: prepare
key_points:
- The take-home messages
- They will appear at the end of the tutorial
contributors:
- abotzki

---

## Introduction to Documentation

By now you understand how to describe your data collection in terms of, for example, type, size, and format. You have identified this for your own research data.

Now we will look into the documentation and metadata which will accompany your data. Documentation and metadata are essential to understand what a dataset means and to make it reusable in the future.

### Why Document Your Data?

The importance of documenting your data during the collection and analysis phase of your research cannot be overestimated.

While collecting and analysing, you may be on intimate terms with your dataset. However, remembering that the variable *sgimemgp* means *single member of group* can become difficult months or years later. The same goes for the exact procedure you used to transform or derive particular variables.

In this part of the course you will learn to:

- Understand how documenting your data helps yourself and others understand, verify, review, replicate, access, reuse and build upon your findings;
- Discern between different ways to document your data;
- Understand the role of metadata in increasing data interoperability;
- Apply the presented information to your own data.

### Tips for Data Documentation

John MacInnes, professor of Sociology of the University of Edinburgh, explains why it is necessary to document each step of your research and how this will benefit you in the long term.

<iframe src="https://www.youtube.com/embed/EIZsxT-fIiQ" allowfullscreen="" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" height="515px" style="display: inline-block;" width="800px" title=""></iframe>

### Examples of Data Documentation

Since there is a wide variety of types of data and types of research, there are many different ways of documenting data. A few examples of data documentation are:

- Laboratory notebooks and experimental procedures
- Questionnaires, codebooks, data dictionaries
- Software syntax and outout files;
- Information about equipment settings & instrument calibrations
- Database schemes
- Methodology reports
- Provenance information about sources of derived or digitised data

#### {% icon question %} Question  

TODO H5P 02_WhatDataDocumentation.png
What data documentation will you use and why?

<details markdown='1'>
  <summary>Feedback on your reflections</summary>

Data documentation has as goal to be used by people to understand the dataset. Such as specific conditions in which it was collected, what each column means and which methods were used to collect the data. When creating documentation, you need to ask yourself, can others (or I, myself) understand my dataset if I give them this information.

</details>
{: .question }

### Different Levels of Data Documentation
There are many different ways to set up and organise your documentation.

#### Project Level

Project level documentation documents what the study sets out to do; how it contributes to new knowledge in the field, what research questions/hypotheses are, what methodologies are used, what samples are used, what intruments and measures are used, etc. A complete academic thesis normally contains this information in details, but a published article may not. If a dataset is shared, a detailed technical report needs to be included for the user to understand how the data were collected and processed. You should also provide a sample bibliographic citation to indicate how you would like secondary users of your data to cite it in any publication.

#### File or Database Level

File or database level documentation documents how all the files (or tables in a database) that make up the dataset relate to each other, what format they are in, whether they supersede or are superseded by previous files, etc. A readme.txt file is the classic way of accounting for all the files and folders in a project.

#### Variable or Item Level

Variable or item level documentation documents how an object of analysis came about. For example, it does not just document a variable name at the top of a spreadsheet file, but also the full label explaining the meaning of that variable in terms of how it was operationalised.

John MacInnes, professor of Sociology of the University of Edinburgh, speaks about how data documentation can help to find a way in often voluminous data collections of different copies, routings, syntaxes, samplings, etc.

### On the Necessity of Data Documentation in Secondary Data Analysis

<iframe src="https://www.youtube.com/embed/Ebaiwg08CW8" allowfullscreen="" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" height="515px" style="display: inline-block;" width="800px" title=""></iframe>

#### {% icon question %} Question  

Looking back at your previous research project: Did you ever have problems reusing other people's data because of lack of documentation?

- Never tried
- Successfully reused
- Had to ask clarification
- Had to abandon the reuse attempt

<details markdown='1'>
  <summary>Feedback on your reflections</summary>

Data documentation always provides advantages for yourself and for others such as better understandability, sharability and reusability in the future.

</details>

{: .question }

### Research and Lab Notebooks

Researchers can benefit by keeping a systematic record of their research. For many disciplines, this may take the form of a diary or notebook to record ideas, articles and references. Laboratory-based researchers usually complete lab notebooks as crucial components of data management. Look to the local practices in your research group or lab for guidance.
Research/lab notebooks can play an important role in:

- Supporting claims relating to intellectual property developed by University researchers;
- Defending claims of scientific fraud;
- Showing research is patent worthy during a patent registration process;
- Demonstrating adherence to standards of good practice, academic and ethical integrity;
- Demonstrating compliance with contractual provisions permitting sponsors to audit work carried out in pursuit of sponsored research.

Thorough and effective management of laboratory data and the routine documentation of all lab procedures is a highly important responsibility for all researchers.

If you want to learn more about the electronic lab notebook system at VIB, please see [these tutorials](https://material.bits.vib.be/topics/eln/)

## An Introduction to Metadata

Watch this web lecture to learn about the different types of metadata and how metadata can help make your research data better findable. You are pointed to useful sources for metadata standards.

<iframe src="https://www.youtube.com/embed/h0oZ3swbTJ0" allowfullscreen="" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" height="515px" style="display: inline-block;" width="800px" title=""></iframe>

### Identify Different Types of Metadata

TODO: HP5 quiz or matrix quiz see 02_IdentifyDifferentTypesofMetadata.png

### Metadata for Different Disciplines

Different disciplines like biology, earth sciences, physical sciences and social sciences and humanities have their own standards. By choosing a well-supported standard, you will maximise the chance that your data can be re)used and understood by other researchers.

<iframe src="https://www.youtube.com/embed/AvL7hEk8RJQ" allowfullscreen="" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" height="515px" style="display: inline-block;" width="800px" title=""></iframe>

Useful links to metadata standards:

- [Biology](http://www.dcc.ac.uk/resources/subject-areas/biology)
- [General Sciences](http://www.dcc.ac.uk/resources/subject-areas/general-research-data)

A community-maintained [directory of metadata schemas](http://rd-alliance.github.io/metadata-directory/) which has been set up under the auspices of the Research Data Alliance.

A list of metadata standards and other standards developed by [FairSharing](https://fairsharing.org/).

### Controlled Vocabulary

You are advised to use a ‘controlled’ vocabulary when you collaborate with others or when you regularly do the same type of research, A ‘controlled’ vocabulary uses predefined and authorised terms. This avoids that the same concept is given different names and ensures consistency. Hence it makes it easier to find and understand data.

Without you knowing, you may already use a generally accepted controlled vocabulary, for instance:

- Latin names for plants in plant studies
- Chemical names in chemistry
- Entry terms for genes
- Latin names for diseases
- Mesh terms for medical terms in general
- Standard units for your results

If there is no vocabulary available, you can consider making a custom list within your research team.

### Improve a Record Description

#### {% icon question %} Question  

Take a look at the record descriptions in the table below and answer the question below and in the following pages.

| Soil Sample | Condition | Length | Class\* |
|:-----------:|:---------:|:------:|:------:|
| A1          | Low       | 458    | III    |
| A2          | Low       | 391    | II     |
| A3          | Medium    | 422    | IV     |

\*according to the classification from last experiment

Is the value in the Soil Sample column clear?

<details markdown='1'>
  <summary>Click your answers!</summary>

  Yes, it is sufficient to say this is a sample. The identifier for the sample needs to be unique, the content of the sample comes from the other metadata fields and their values.

</details>
{: .question }

#### {% icon question %} Question  

Take a look at the record descriptions in the table below and answer the question below and in the following pages.

| Soil Sample | Condition | Length | Class\* |
|:------------|:---------:|:------:|:------:|
| A1          | Low       | 458    | III    |
| A2          | Low       | 391    | II     |
| A3          | Medium    | 422    | IV     |

\*according to the classification from last experiment

Is the value in the Condition column clear?

<details markdown='1'>
  <summary>Click your answers!</summary>

  No! It is not clear what low or medium as condition means.

</details>
{: .question }

#### {% icon question %} Question  

Take a look at the record descriptions in the table below and answer the question below and in the following pages.

| Soil Sample | Condition | Length | Class\* |
|:------------|:---------:|:------:|:------:|
| A1          | Low       | 458    | III    |
| A2          | Low       | 391    | II     |
| A3          | Medium    | 422    | IV     |

\*according to the classification from last experiment

Is the value in the Length column clear?

<details markdown='1'>
  <summary>Click your answers!</summary>

  No, it is not clear what is meant by length. Also a unit for the values is missing. Is it meters, centimeters, or seconds?

</details>
{: .question }

#### {% icon question %} Question  

Take a look at the record descriptions n the table below and answer the question below and in the following pages.

| Soil Sample | Condition | Length | Class\* |
|:------------|:---------:|:------:|:------:|
| A1          | Low       | 458    | III    |
| A2          | Low       | 391    | II     |
| A3          | Medium    | 422    | IV     |

\*according to the classification from last experiment

Is the value in the Class column clear?

<details markdown='1'>
  <summary>Click your answers!</summary>

  No! There is a reference that the classes are explained somewhere, but no link to the document is given.

</details>
{: .question }

Units are important, and metadata field names need explanations in for instance a codebook or another document explaining names. If metadata field names are from a standard, these are explained in the standard. This saves you time and you can simply refer to the standard in your data.

## Data Standards Explained

Your dataset can be standardised in various aspects. Standardisation, in general, makes data comparable and interpretable. In other words, your data becomes interoperable by applying standards. Datasets can be combined, compared or are simply easier to reuse. You have to plan standardisation, as it is for many aspects hard or impossible to apply afterwards.

Standardise as much as possible between you and your collaborators or research group. If there are standards established and used in your field of research you are advised to use these.

Here is a list of things you can standardise in your research.

- Standardise how, what and when you measure things by standardising your **protocol, or methods and materials**. For instance, is there a standard set of questions for ‘quality of life’? Is there a standard procedure to house mice for your purpose? What aspects do you measure? At what parameter values (age, concentration, etc.)? When do you measure (every two hours, every gram of weight gain, etc.)?
- Standardise your **file formats** so you can easily exchange results without technical difficulties. Check for standard taxonomies or coding systems within your research discipline.
- Standardise the **units** in which you note down your results. For instance, do you use mm, cm, m? It is extra work to transform units between experiments.
- Standardise the **metadata** you use to describe your records or study. What fields will fill in by default, and according to what standard do you define the fields’ names? Will you design a metadata spreadsheet where you specify all things that you will note down?
- Standardise the **vocabulary** you use. If everyone has the same terminology, it can avoid confusion or misinterpretation. Check for standard taxonomies or coding systems within your research discipline.

## Check Your Knowledge on Standards

Follow the links below for examples of standards. What type of standardisation do the links refer to?

- Find via Google: “general morphology score (GMS)”
- [Demographic market research](http://www.amplituderesearch.com/market-research-questions.shtml)
- [Marine Geoscience Data](http://www.marine-geo.org/submit/guidelines.php)
- [The Cultural Objects Name Authority](http://www.getty.edu/research/tools/vocabularies/cona/index.html))
- [International Union of crystallography](http://www.iucr.org/resources/cif/spec/ancillary/abbreviations)
- [SI Units](https://www.nist.gov/pml/weights-and-measures/metric-si/si-units)
- [UK data service](https://www.ukdataservice.ac.uk/manage-data/format/recommended-formats)

TODO: add H5P exercise - check 02_CheckKnowledgeOnStandards.png

## Folder Structure and File Naming

### Learning Objectives
During your research you will have numerous datasets and files which need to be managed. Logical folder structures and file names will help you throughout your research to understand what each file contains without opening it and looking in-depth.

In this part of the course you will leam to:

- Understand different concepts of data organisation and why consistently organising your data matters;
- Name the do's and don'ts in folder arrangements and file naming;
- Apply the presented information to your own data.

Note: this e-module is based on the online Research Data Management training ‘MANTRA’ of The University of Edinburgh

CC BY: [https://mantra.edina.ac.uk/](https://mantra.edina.ac.uk/)

### Introduction to Good File Management

Good file management practices enable you to identify, locate and use your research data files efficiently and effectively.

At the start of a research project, it is easy to believe that you'll remember what name you gave a file and where you put it. However, once your research gets under way you may have collected multiple files in various formats, multiple versions and multiple forms such as websites, citations, blogs, articles, methodologies, notes, spreadsheets, etc.

Naming your records consistently, logically and in a predictable way will distinguish similar records from one another at a glance. If properly executed, this will facilitate the storage and retrieval of your research records and will enable yourself or others users to browse file names more effectively and efficiently.

It is good practice to name your records according to agreed conventions such as group file naming protocols. This will not only make file naming easier for you and colleagues because you will not have to ‘rethink’ the process each time; it will also allow you to share your files in a share file space without confusion.

### On the Importance of Good File Management in Research

Trying to find a data file that you need which has been stored or named incorrectly or inaccurately can be both frustrating and a waste of valuable time. In this short video Jeff Haywood, professor at the University of Edinburg, explains his experiences with good and bad file management.

<iframe src="https://www.youtube.com/embed/i2jcOJOFUZg" allowfullscreen="" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" height="515px" style="display: inline-block;" width="800px" title=""></iframe>

### Four Best Practices for Organising Your File naming
Work through the following four best practices for organising your file naming and consider how you could apply these practices to your own (data) files.

#### 1. General Rules
There are four general rules which should be followed when developing a file naming strategy to optimize the potential of your research data:

- Do not use generic file names that may conflict when moved from one location to another (e.g. ‘Data.csv’). Ensure filenames are independent of your location.
- Make sure that file names outlast the file creator who originally named the file;
- Consider how scalable your file naming policy needs to be, e.g, if you want to include the project number, don't limit your project number to two digits, or you can only have ninety nine projects.
- Use fixed and short coded elements to build your filename and have a separate document explaining these coded elements. Determining content from filenames is efficient and easy this way.

#### 2. Data File Naming
Your research data files and folders need to be named and organised in a systematic way so that they are both identifiable and accessible to yourself and other (future) users. The benefits of consistent data file naming are:

- Data files are distinguishable from each other;
- Data file naming prevents confusion;
- Data files are easier to locate and browse;
- Data files can be retrieved not only by the creator but by other users;
- Data files are sorted in a logical sequence;
- Data files are not accidentally overwritten or deleted;
- Different versions of data files can be identified;
- If data files are moved to another storage platform their names will retain useful context.

Consider these criteria when naming and labelling your research data files:

- Organisation
  Ensure future access and retrieval by following a systematic approach to organising your folders and files.
- Context
  Include information about the context in which data is collected. This could include content specific or descriptive information, independent of where the data is stored.
- Consistency
  Choose a naming convention and ensure that the rules are followed systematically by always including the same information (such as date and time) in the same order (e.g. YYYYMMDD).

#### 3. Coded Elements in File Naming
When developing a file naming strategy the following elements, captured in a short code, could be considered:

- Version number;
- Date of creation;
- Name of creator;
- Description of content;
- Name of research team/department associated with the data;
- Publication date;
- Project number.

For instance: Pr01_WP4_MA_2016_09_12.txt
(project 1, workpackage 4, Microarray data, date)

#### 4. Practical Rules for File Naming
File and folder naming conventions are key to maintaining well-organised electronic directories and drive structures.

A filename is the principal identifier for a research data file. In most cases, the policy for naming a file is left to individuals or to groups of individuals. There are several easy-to-follow rules for naming data files:

- Keep file names short and relevant. Generally, about 25 characters is a sufficient length to capture enough descriptive information for naming a data file;
- Do not use special characters in a filename suchas *8 * % S£]1{! @* The characters are often used for specific tasks in different operating systems;
- Use underscores instead of full-stops or spaces because, like special characters, these are parsed differently on different systems;
- The filename should include as much descriptive information that will assist identification independent of where it is stored.
- Format dates consistently;
- Do not assume that the software application or instrument uses case dependency when naming or renaming files. Instead, assume that *TANGO*, *Tango* and *tango* are the same, even though some file systems may consider them as different;
- Where possible, use default file extensions to accurately reflect the software environment in which the file was created and the physical format of the file. E.g.. use .por for SPSS portable files, .xls or .xlsx for Excel files, .ssd or .sas7bdat for SAS files, .txt for text files, etc.

TODO H5P
### {% icon question %} Choose the best chronological file name

Which of the file names below is the most appropriate?

- 2019-03-24_Attachment
- 24 March 2006 Attachment
- 240306attach

<details markdown='1'>
  <summary>Click your answers!</summary>

2019-03-24_Attachment is correct! Using a date in the format Year-Month-Day will maintain the chronological order of your files.
</details>
{: .question }

TODO H5P
### {% icon question %} Choose the best descriptive file name

Which of the file names below is the most appropriate?

- labtox_recent_110810_old_version.sps
- 2010-08-11_bioasssay_tox_V1.sps
- FFTX_3776438656.sps

<details markdown='1'>
  <summary>Click your answers!</summary>

2010-08-11_bioasssay_tox_V1.sps is correct! Keep the file names short and relevant while using sufficient characters to capture information. Do not name files recent or final or definitive_final, a date or version number will suffice.

</details>### Batch Renaming of automatically Generated files
Although all operating systems have built-in tools for managing files, there are software tools that can organise research data files and folders in a consistent and automated way through batch renaming (also known as mass file renaming or bulk renaming). Batch renaming software exists for most operating systems. There are many situations for which batch renaming may be useful, such as:

- Images from digital cameras are automatically assigned base filenames consisting of sequential numbers;
- Proprietary software or instrumentation generates crude, default or multiple filenames;
- Files are transferred from a system that supports spaces and/or non-English characters in filenames to one that doesn't {or vice versa). In such cases, batch renaming software can be used to substitute characters or automatically assigned names with acceptable or descriptive ones.


{: .question }

### Batch Renaming of automatically Generated files

Although all operating systems have built-in tools for managing files, there are software tools that can organise research data files and folders in a consistent and automated way through batch renaming (also known as mass file renaming or bulk renaming). Batch renaming software exists for most operating systems. There are many situations for which batch renaming may be useful, such as: Images from digital cameras are automatically assigned base filenames consisting of sequential numbers; Proprietary software or instrumentation generates crude, default or muitiple filenames; Files are transferred from a system that supports spaces and/or non-English characters in filenames to one that doesn't {or vice versal. In such cases, batch renaming software can be used to substitute characters or automatically assigned names with acceptable or descriptive ones.


### A Strategy for Version Control

It is important to identify and distinguish versions of your research data files consistently. This ensures that a clear audit trail exists for tracking the development of a data file and identifying earlier versions when needed. When establishing a strategy for version control you can use the following tips:

- A common way to discem data file versions is to use ordinal numbers (1,2,3 etc.) for major version changes and decimals for minor ones, eg, v1.1, v2.6;
- Delete all versions with minor changes (which you already identified as less important) at set times, and other obsolete versions.
- Beware of using confusing labels. Labels such as *revision*, *final*, *final2*, *definitive_copy* are ambiguous as you may find that these accumulate during your research;
- Use an auto-backup facility (if available} rather than saving or archiving multiple versions;
- Turn on versioning or tracking in collaborative documents or storage utilities such as Wikis, Google Docs, etc.
- Consider using version control software such as Subversion or TortoiseSVN or Github.
- Keep your files in one place only and make sure you stick to that. Consider copies at other places as ‘not current’.

### How would you treat your data

#### {% icon question %} Choose the best descriptive file name

Why should you discard or delete obsolete versions of data?

- The most current version is the only relevant version.
- You have several versions of files in a state between versions
- You are exceeding the storage space available to you.

<details markdown='1'>
  <summary>Click your answers!</summary>

Correct answer: You have several versions of files in a state between versions! Too many similar or related files may be confusing to yourself and to anyone else wanting to access or use your data. You may think that you know which data file is which but that may not always be the case as time passes and the number of different versions increases. It is easier to maintain a manageable number of versions with a clear naming structure. As long as the original raw or definitive copy is retained and processing is well documented, the intermediate working files can and should be discarded.

</details>
{: .question }

TODO: add H5P - check 02_FillTheGap.png

### Write Your Data Management Plan for Your Data Documentation

Go to DMPonline and open your draft data management plan created in the Introduction.

You have now completed the module Data documentation. You should be able to complete the following questions in the section Data documentation:

* How will you structure your data?
* How will the data be described and documented?
* What standards will you use?
