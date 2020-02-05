---
layout: tutorial_hands_on

title: "Share: Data selection and preservation" 
zenodo_link: ''
questions:
- Which techniques can be applied to preserve your data?
objectives:
- Select what part of your data should be  preserved for verification purposes;
- Understand the benefits of preserving your data in a public data repository;
- Preserve you data technically correct.
time_estimation: 30M
subtopic: share 
key_points:
- The take-home messages
- They will appear at the end of the tutorial
contributors:
- abotzki 

---

# Introduction
{:.no_toc}

<!-- This is a comment. -->

## Introduction to data selection and preservation

Research should be transparent and you should always be able to revert back to your data if necessary and be able to show others how you came to your results. Therefore, your research data with all information reasonably necessary for verification needs to be preserved.

With well-managed and preserved research data, you can defend yourself against allegations of mistakes. You can also prevent wrong conclusions from further spreading into the scientific community if there really are mistakes.

## Long term data preservation

Research data can be preserved for different reasons such as verification and/or possible reuse. It can be your own wish or that of your university, funder or journal.

**Verification**
TODO: adapt this part

The Netherlands Code of Conduct for Academic Practice (VSNU) states that raw data from research must be kept available for a minimum of ten years. This statement is also included in the Utrecht University Policy framework for research data: “Archived research data are to be retained for a minimum of ten years, commencing from the date that the research results are published.”

**Reuse**
It may be worthwhile to make (part of) your data available for a longer period of time and/or for a wider audience. Data which are suitable to keep for reuse are interpretable data on which new research can be based,  independent of the publication.

On the one hand, making research data reusable will need extra effort. On the other hand, possible reuse, even by your future self, might bring you lots of benefits and credits. Consider if your data is worth the effort of making it reusable or if preserving and archiving for verification is enough.

Reuse is explained more in depth in the next part of this course: ‘Availability for reuse’. In this part we will focus on selection and preservation of research data for verification purposes.

## Data package

Keeping data for verification serves the specific goal of having transparent, reproducible research.

**Alternatives to preserving raw data**
If preserving your raw data poses problems, alternatives can also ensure verfication. For instance, transcripts of recorded interviews could hold all important information and may be less privacy-sensitive, so it is reasonable to preserve those instead of the recordings themselves. Also, if raw data is very large, preserving your data only in some processed form could be an alternative. Combined with, for instance, a demonstrable quality check on the processing.

**The contents of your data package**

TODO: add image for illustration/zenodo?

Others should be able to understand what you did. It is not enough to just provide data. Instead you should preserve a package with everything included that is necessary to reproduce your results. Think of including the following:

* Primary (raw) data;
* Secondary (processed) data;
* Protocols;
* Computer code/scripts;
* Lab journals;
* Metadata and/or codebooks describing the data;
* An overview of what the contents of the data package stating what file contains what information, and how these are related.

The data should contain a reference to any publication which is based on the data.

To make understanding your data less dependent on information in the publication, you can also add information on:

* Collection methods;
* Procedures;
* Experimental protocol;
* Your research question;
* Stimuli used;
* Sample descriptions.

This is especially practical if the data package can be found and used on its own account. This is the case if it is published in a data repository or data journal as a data package for reuse.

Do not forget to explicitly state who is responsible for the content of the data package, who is to be contacted in case of a request for access, and under what conditions access is granted.

## Where to preserve what type of data?

During your research, you generate research results that can be made available for others.

A paper or publication is the most traditional way of making results available, but it is by no means the only way. A relatively new way of making results available is using a public data repository.

As you have just learned, preserving your data may serve the purpose of verification or  reuse. Public data repositories cater to both needs. In addition, they handle requests to view or use your data which means you do not have to take care of such requests yourself.

In the example below, you find a workflow for experimental research. What information can be made available in what place? Drag the items on the right to the correct place in the figure. Please note that some items can be used more than once.

TODO: add H5P quiz and PDF solution?

### Accounting for data of others

If you are permitted to use data from other parties, you will have to account for those as well if your research is to be verifiable and reproducible by others. You may recognise this from chapter 1 of this course: Data collection: Discover existing data, weblecture ‘Assessing usefulness of research data of others’ (5 of 10).

You have the following options:

If the used data is preserved correctly somewhere for the coming ten years, refer to the data repository in question.
If it is not taken care of, contact the responsible persons, negotiate correct preservation in a data repository for ten years, and refer to that repository.
If this isn’t possible, try to arrange a local copy that you preserve yourself;
If this isn’t allowed, you will not be able to present the data in case of questions. Therefore, you should question yourself whether you can actually use the data.

![alt-t](../../images/Cont_5_Share_SelectPreserve_Chart10years.png "Preserve for 10 years")

**Accounting for data of others on websites**

If you find interesting information on a website that you want to refer to, it is possible that this information will not be future proof.

The link or web address might change over time (link rot). Or the information on a website is updated, changed or replaced with other content (content drift).

It is possible to archive web pages on a web archive like the [Internet Archive](https://archive.org/web/). You can capture a web page as it appears now for use as a trusted citation in the future (save a page). You will get an alternative link, pointing to the archived, static version of the page. Use this alternative link as a reference to the online information.

## How to preserve your data correctly

In order for the data to survive for the long term, an active preservation regime has to be applied. The bad news is, data automatically gets lost over time.

There are five main ways your data can be lost:

* Digital sources degrade over time ('bit rot');
* File formats and software become outdated;
* The media on which your data is stored becomes outdated or defective;
* Disaster strikes the storage location;
* The person that understands the data finds another job or data simply becomes forgotten.

In this video below you will learn how to minimise the risk of losing data. You are also given good preservation practices.

<iframe src="https://www.youtube.com/embed/qENaO0Lk6eo" allowfullscreen="" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" height="515px" style="display: inline-block;" width="800px" title=""></iframe>

## Match the solutions to the data loss

From the weblecture you learned how to prevent data loss. Can you recall all applicable active regimes, as explained in the weblecture?

Below you see a list of solutions to prevent data loss. Underneath that list you see a list of risks for data loss. Please add the number of each solution to the correct risk.

**Solutions to prevent data loss**

1. Have multiple copies. Use a checksum to identify faulty copies
2. Use preferred file formats that can be opened by a wide range of software. Update the file format to a current one.
3. Move data to fresh media well before the media’s expiration date.
4. Have multiple copies. Move data to fresh media well before the media’s expiration date.
5. Document your data well.
6. Advertise the content in a data catalogue.

TODO: add quiz text solution

### Write your data management plan for your data preservation

Go to DMPonline and open your draft data management plan created in the Introduction.

You have now completed the module on data selection and preservation. You should be able to complete the following questions in the section ‘Data selection and preservation’:

* Which data should be preserved and/or shared?
* How and where will you keep your data for the long term?
