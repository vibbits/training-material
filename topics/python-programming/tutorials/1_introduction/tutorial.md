---
layout: tutorial_hands_on

title: 01 Introduction
# zenodo_link: ''
# questions:
# - Which biological questions are addressed by the tutorial?
# - Which bioinformatics techniques are important to know for this type of data?
# objectives:
# - The learning objectives are the goals of the tutorial
# - They will be informed by your audience and will communicate to them and to yourself
#   what you should focus on during the course
# - They are single sentences describing what a learner should be able to do once they
#   have completed the tutorial
# - You can use Bloom's Taxonomy to write effective learning objectives
time_estimation: 3H
key_points:
 - Jupyter-notebook & insight of the course

contributors:
- tmuylder

---


# Introduction
{:.no_toc}

<!-- This is a comment. -->

General introduction about the topic and then an introduction of the
tutorial (the questions and the objectives). It is nice also to have a
scheme to sum up the pipeline used during the tutorial. The idea is to
give to trainees insight into the content of the tutorial and the (theoretical
and technical) key concepts they will learn.

You may want to cite some publications; this can be done by adding citations to the
bibliography file (`tutorial.bib` file next to your `tutorial.md` file). These citations
must be in bibtex format. If you have the DOI for the paper you wish to cite, you can
get the corresponding bibtex entry using [doi2bib.org](https://doi2bib.org).

With the example you will find in the `tutorial.bib` file, you can add a citation to
this article here in your tutorial like this:
{% raw %} `{% cite Batut2018 %}`{% endraw %}.
This will be rendered like this: {% cite Batut2018 %}, and links to a
[bibliography section](#bibliography) which will automatically be created at the end of the
tutorial.


**Please follow our
[tutorial to learn how to fill the Markdown]({{ site.baseurl }}/topics/contributing/tutorials/create-new-tutorial-content/tutorial.html)**

> ### Agenda
>
> In this tutorial, we will cover:
>
> 1. TOC
> {:toc}
>
{: .agenda}

# Title for your first section

Give some background about what the trainees will be doing in the section.
Remember that many people reading your materials will likely be novices,
so make sure to explain all the relevant concepts.

## Title for a subsection
Section and subsection titles will be displayed in the tutorial index on the left side of
the page, so try to make them informative and concise!

# Hands-on Sections
Below are a series of hand-on boxes, one for each tool in your workflow file.
Often you may wish to combine several boxes into one or make other adjustments such
as breaking the tutorial into sections, we encourage you to make such changes as you
see fit, this is just a starting point :)

Anywhere you find the word "***TODO***", there is something that needs to be changed
depending on the specifics of your tutorial.

have fun!

## Get data

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

# Title of the section usually corresponding to a big step in the analysis

It comes first a description of the step: some background and some theory.
Some image can be added there to support the theory explanation:

![Alternative text](../../images/image_name "Legend of the image")

The idea is to keep the theory description before quite simple to focus more on the practical part.

***TODO***: *Consider adding a detail box to expand the theory*

> ### {% icon details %} More details about the theory
>
> But to describe more details, it is possible to use the detail boxes which are expandable
>
{: .details}

A big step can have several subsections or sub steps:


## Sub-step with **My Tool**

> ### {% icon hands_on %} Hands-on: Task description
>
> 1. **My Tool** {% icon tool %} with the following parameters:
>    - {% icon param-file %} *"Input file"*: File
>    - *"Parameter"*: `a value`
>
>    ***TODO***: *Check parameter descriptions*
>
>    ***TODO***: *Consider adding a comment or tip box*
>
>    > ### {% icon comment %} Comment
>    >
>    > A comment about the tool or something else. This box can also be in the main text
>    {: .comment}
>
{: .hands_on}

***TODO***: *Consider adding a question to test the learners understanding of the previous exercise*

> ### {% icon question %} Questions
>
> 1. Question1?
> 2. Question2?
>
> > ### {% icon solution %} Solution
> >
> > 1. Answer for question1
> > 2. Answer for question2
> >
> {: .solution}
>
{: .question}


## Re-arrange

To create the template, each step of the workflow had its own subsection.

***TODO***: *Re-arrange the generated subsections into sections or other subsections.
Consider merging some hands-on boxes to have a meaningful flow of the analyses*

# Conclusion
{:.no_toc}

Sum up the tutorial and the key takeaways here. We encourage adding an overview image of the
pipeline used.



# 1. Introduction to Jupyter 
*An interactive environment to write and run Python code*

## 1.1 Why Jupyter
Jupyter is an interactive code environment that allows you to write code and get immediate feedback from it. It's one of the most popular environment for data science in Python. Especially for training purposes, as it interactively gives you your code and some informative text together. 

## 1.2 Installation
The easiest way to install Python and Jupyter is to install [Anaconda](https://docs.anaconda.com/anaconda/install/) (Navigator) on your computer. It's worth it to struggle through all the documentation and get things up and running on your own machine. 

Anaconda Navigator contains some applications like Jupyter where you can run your Python code. Moreover, Anaconda is also a package manager which makes it ideal for reproducibility purposes as well. 

Nowadays, Jupyter comes in two versions. More often you will hear about Jupyter Notebooks which is the precursor of Jupyter Lab. The latter has a couple of advantages, however for stability reasons we'll be using Jupyter Notebooks for now.


## 1.3 Getting familiar with Jupyter Notebooks

**a. Make a new notebook**  

Navigate to a folder and click on the right New --> Python 3. A new Notebook now pops up with an empty cell. In this cell you can directly input some Python code. Try out the following: 

```python
1+1
```

Click on the triangle symbol on the top of the notebook or type 'Shift+Enter' to run the code. The output will immediately appear on the screen and should look like this. 
<center><img src="images/cells.PNG" /></center>

Also, a new cell will have appeared in the notebook. A notebook is actually a set of cells in which you can input code. 

If you want another cell, you can click the '+' symbol on top of the notebook. Other interesting symbols up there are the stop symbol and the reload symbol. Whenever your code is stuck, you can stop it right there, or whenever you want to restart in a clean and fresh environment, you hit that restart button. 

**b. Code or Markdown**

There are two modes that a cell can have. 
- A cell is by default in **Code** modus. This means that the environment expects a Python code as input and it will interpret it and give you some output upon running that cell.
- The **Markdown** mode is a kind of text modus. In here you can type any kinds of text and edit it so headers, bold or italic texts, quotes, images are possible to integrate. It's called rich text. E.g. If you double click this text, you will see the Markdown code of this text. 

**c. Command or Edit mode**

To switch between these modes, hit 'Esc' or 'Enter'. When you hit 'Enter', you'll get into the Edit mode, the cell will have a blue border around it and you're free to edit the content of that cell (both in python code or markdown code). If you hit 'Esc', you're cell will be in the Command mode and you can use shortcuts to edit your notebook:
- a (above): add a new cell above
- b (below): add a new cell below
- dd: remove the cell
- z: undo the previous action
these are just a few of them. 

The blue bar on the left of your cell indicates which cell is selected. In command mode, you can move through your cells with the up and down arrow keys. 

Lastly, within the command mode, type 'y' to change the cell to a Python code cell and type 'm' to change the cell to a Markdown code cell. 

**d. Running a cell**

To stress the importance of the 'stop' button on top of this notebook, run the following code below. While it is running, the code has an asterisk which means it's still being executed and your notebook won't be able to process any other code in another cell. In order to stop it, because it's an indefinite loop, hit the stop button or type 'ii' in command mode. 


```python
import time
while True:
    print("Hello")
    time.sleep(3)
```

## 1.4 Examples
The above will suffice for the JupyterLab environment introduction. We will dive into our first examples before diving into the first chapter of our Python adventure. 

A program needs information (input) to run, and then needs to export its results so that you know what happened (output). The easiest way to do this is to send a 'text message' to the screen; this is possible with the print command which we will introduce here.

In this section we also discuss some basics of Python syntax, and the errors that occur if you don't get it right.

**a. Let's do some math**

Python is very intuitive and flexible in a way that there is no need of special colons, nor do you have to take spaces into account. Just note that Python is indent-sensitive, but we will get back to this. 


```python
1+1
```


```python
2 - 5
```


```python
3  * 4
```


```python
10/2
```

**b. Writing a message**  

The print command allows you to write data to the console screen. Try the following example:


```python
# Print 'Hello world' to the screen
print("Hello world")
```

Notice that lines starting with a `#` symbol are not displayed, nor evaluated by Python. They usually contain extra information concerning the code. 


```python
# What happens if you leave out the quotation marks? 
print(Hello world)
```

You should get the following error: **SyntaxError: invalid syntax**. This is because Python doesn't understand what Hello and world mean.

**c. Writing numbers**

You can also print out numbers as text messages to the screen. You do not need quotation marks in this case; just the number is enough. If your number does not have a decimal point (.) in it, it's called an **integer**, if it does have a decimal point, it is a **float**. 


```python
# Print an integer and a floating point 
print(5)
print(3.1415)
```

**Note**  
In Python, programs often start with:
```
#!/usr/bin/python
```
This line is called the 'Shebang' and tells the operating system where it can find the Python language interpreter so it can run the program without you having to specify where Python is. With Jupyter Lab/Notebooks we already have a Python environment so we do not need to redefine it every time. 

## 1.5 JupyterLab

With recent improvements, the environment grew a little bit more powerful to a full interface, called JupyterLab. You can see all of the files that are within a folder within a file explorer, you can open a Terminal window which is a Linux machine where you can install any packages that you would need. You can also make a text file or edit text files that are in your folder. However, the most simplest is still to open a Python console where you directly insert python code. 

## 1.6 Next session

Go to our [next chapter](2_Variables_and_Operators.ipynb). 
