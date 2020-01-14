---
layout: tutorial_hands_on

title: 05 Predicting a protein structure - homology modelling
zenodo_link: ''
questions:
- Which biological questions are addressed by the tutorial?
- Which bioinformatics techniques are important to know for this type of data?
objectives:
- The learning objectives are the goals of the tutorial
- They will be informed by your audience and will communicate to them and to yourself
  what you should focus on during the course
- They are single sentences describing what a learner should be able to do once they
  have completed the tutorial
- You can use Bloom's Taxonomy to write effective learning objectives
time_estimation: 30M
key_points:
- Main principles of homology modelling
- How to build a homology model with Swiss Model 
contributors:
- abotzki 
- jvdurme 

---


# Introduction
{:.no_toc}

<!-- This is a comment. -->

The goal of homology modeling is to predict the 3D structure of a protein that comes close to what would be achieved experimentally with X-Ray experiments.

Main principles of homology modeling

- We predict the structure of a protein sequence on the basis of the structure of another protein with a similar sequence (the template)
- If the sequences are similar, the structures will have a similar fold
- Structure is more conserved than sequence

> ### Agenda
>
> In this tutorial, we will cover:
>
> 1. TOC
> {:toc}
>
{: .agenda}

# Main ingredients for homology modelling 

## The sequence

Last week my colleague sequenced a plant protein. He is not a bioinformatician. Yet, he would like to know what the structure might look like to do some rounds of rational mutagenesis. Let's try to address the problem for him.
 
He came up with this sequence:

```
SVCCPSLVARTNYNVCRLPGTEAALCATFTGCIIIPGATCGGDYAN
```

## Searching for the template structure

Actually, the first step is to check whether the PDB already contains the structure of this sequence. That would be easy so we don't have to model anything. We will use Blast again to search with the sequence.

**TODO: add hands-on area with Blast search on PDB page**

> ### {% icon hands_on %} Hands-on: Data upload
>
> 1. Create a new history for this tutorial
> 2. Import the files from [Zenodo]() or from the shared data library
>
>    ```
> 
>    ```
>    ***TODO***: *Add the files by the ones on Zenodo here (if not added)*
>
>    ***TODO***: *Remove the useless files (if added)*
>
>    {% include snippets/import_via_link.md %}
>    {% include snippets/import_from_data_library.md %}
>
> 3. Rename the datasets
> 4. Check that the datatype
>
>    {% include snippets/change_datatype.md datatype="datatypes" %}
>
> 5. Add to each database a tag corresponding to ...
>
>    {% include snippets/add_tag.md %}
>
{: .hands_on}

A suitable template structure to make a high quality model should have following properties:

- The highest possible sequence identity from all structures in the PDB when aligned to the target sequence
- A good resolution (and R-factor): if many identical template structures exist with the same sequence, filter by resolution
- Is solved by X-RAY, not NMR

> ### {% icon hands_on %} Hands-on: Data upload
>
> 1. Create a new history for this tutorial
> 2. Import the files from [Zenodo]() or from the shared data library
>
>    ```
> 
>    ```
>    ***TODO***: *Add the files by the ones on Zenodo here (if not added)*
>
>    ***TODO***: *Remove the useless files (if added)*
>
>    {% include snippets/import_via_link.md %}
>    {% include snippets/import_from_data_library.md %}
>
> 3. Rename the datasets
> 4. Check that the datatype
>
>    {% include snippets/change_datatype.md datatype="datatypes" %}
>
> 5. Add to each database a tag corresponding to ...
>
>    {% include snippets/add_tag.md %}
>
{: .hands_on}


> ### {% icon question %} Questions
>
> 1. Is there a difference in the number of identities, positives and gaps between the two remaining x-ray structures? 
> 2. What is the PDB ID with the highest resolution, does not have insertions or deletions and should thus be the better template structure? 
>
> > <details markdown="1">
> > <summary>{% icon solution %} Solution
> > </summary>
> >
> > 1. **TODO** 
> > 2. **TODO** 
> >
> > </details>
>
>
{: .question}


## Aligning target and template sequence and template selection

The alignment is the most crucial part of homology modeling. We will not explain what an alignment is and how you make it, this should be known. In an alignment, we put homologous sequences on top of each other in a text file. The point is that amino acids that are on top of each other in the same column are assumed to have the equivalent position in the 3D structure. So if the template sequence has an Ala at position 3, where the target sequence has a Phe, homology modelling tools will use the backbone of the template structure and replace the sidechain at position 3 from Ala to Phe.

> ### {% icon hands_on %} Hands-on: Data upload
>
> 1. Create a new history for this tutorial
> 2. Import the files from [Zenodo]() or from the shared data library
>
>    ```
> 
>    ```
>    ***TODO***: *Add the files by the ones on Zenodo here (if not added)*
>
>    ***TODO***: *Remove the useless files (if added)*
>
>    {% include snippets/import_via_link.md %}
>    {% include snippets/import_from_data_library.md %}
>
> 3. Rename the datasets
> 4. Check that the datatype
>
>    {% include snippets/change_datatype.md datatype="datatypes" %}
>
> 5. Add to each database a tag corresponding to ...
>
>    {% include snippets/add_tag.md %}
>
{: .hands_on}


To extract the sequence from the template structure, display the FASTA sequence of the template structure and paste it into the text editor on the first line.

![Alternative text](../../images/image_name "Legend of the image")

The idea is to keep the theory description before quite simple to focus more on the practical part.

![Alternative text](../../images/image_name "Legend of the image")


# Building the homology model with Swiss Model 

Our current request for homology modelling is a rather safe one, so we can use an automatic server for homology modelling. There are many automatic tools available and many of them compete in regular competitions like lastly, the 12th Community Wide Experiment on the Critical Assessment of Techniques for Protein Structure Prediction (CASP12) - [1].

In our example, we take the [Swiss Model server](https://swissmodel.expasy.org/interactive). SWISS-MODEL is a fully automated protein structure homology-modelling server, accessible via the ExPASy web server, or from the program DeepView (Swiss Pdb-Viewer). The purpose of this server is to make Protein Modelling accessible to all biochemists and molecular biologists worldwide.

> ### {% icon hands_on %} Hands-on: Template selection step with Swiss Model 
>
> 1. Browse to the [Swiss Model server](https://swissmodel.expasy.org/interactive) 
> 2. On the first page, paste the sequence of our unknown protein in the field 'Target Sequence' and give the project a name. 
> ![Swiss Model Start page](../../images/Modelling_sequence_template_step1.png "Start page of Swiss Model")
> 3. Click 'Search templates' to initiate the first step. 
>    Thereafter, the server identifies structural template(s) and gives an overview list of hits 
>    which you can select the templates from.
>
{: .hands_on}

> ### {% icon question %} Question
>
> Which of the 10 (at the time of writing) possible template structures would you select as template for the model building process? 
>
> > <details markdown="1">
> > <summary>{% icon solution %} Solution
> > </summary>
> >
> > **TODO: add link with 10 template** 
> > We suggest as template **1jxx.1.A** given that it is an X-ray structure with high resolution and a very high 
> > sequence identity (X-ray, 0.9 Å, 78.26 %).
> >
> > </details>
>
>
{: .question}


> ### {% icon hands_on %} Hands-on: Model Building Step and Visualisation 
>
> 1. Once you have selected the template, hit 'Build Model' to start the homology modelling procedure. 
>    The server will alignment of target sequence and template structure(s), build a model and evaluate it. 
>    These steps require specialized software and integrate up-to-date protein sequence and structure databases. 
>    Each of the above steps can be repeated interactively until a satisfying modelling result is achieved. 
>
> 2. Once the model has been built, you can download it.
> 3. If the Swiss Model server is too busy at the moment you execute the request, you can download the model from
>    [here](https://zenodo.org/record/3551850#.Xdqs4ehKiUk).
> 4. Load the created model into YASARA. 
>    Perform a structural superposition with your reference e.g. 1CRN 
>    try to detect the differences through manipulating the visualisations.
>    ![superposition]( "Superposition of 1CRN with the obtained model")
>
{: .hands_on}


# Conclusion
{:.no_toc}

Homology modelling evolved over the years and many online tools for homology modelling are available. You have used the Swiss Model service with a reasonable simple modelling request. Often, in research projects, homology modelling can be rather difficult and needs expert knowledge depending on the actual situation (sequence conservation, available templates, etc.).
