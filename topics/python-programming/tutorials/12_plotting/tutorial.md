---
layout: tutorial_hands_on

title: 12 Plotting
questions:
- How to plot some data analysis results in Python?
objectives:
- Use matplotlib as a library for plotting figures
- Make line figures, scatter plots and histograms with matplotlib
- Change colors, plot and axis titles, make a legend and make error margins
time_estimation: 20m
key_points:
- We've exploited matplotlib as Pythons primary library for plotting high-quality figures
- This library produces figures in a similar manner to Matlabs plotting library
contributors:
- tmuylder

---


# 12. Plotting figures
*This chapter is based on the materials from [this book](https://www.packtpub.com/eu/big-data-and-business-intelligence/become-python-data-analyst) and [this website](https://python-graph-gallery.com/8-add-confidence-interval-on-barplot/)*

Matplotlib is a Python 2D plotting library which produces publication quality figures. Although Matplotlib is written primarily in pure Python, it makes heavy use of NumPy and other extension code to provide good performance even for large arrays.

We will start with the basics concepts being figures, subplots (axes) and axis. The following line of code allows the figures to be plotted in the notebook results


```python
%matplotlib inline
```

`matplotlib.pyplot` is a collection of command style functions that make matplotlib work like MATLAB. Each pyplot function makes some change to a figure: e.g., creates a figure, creates a plotting area in a figure, plots some lines in a plotting area, decorates the plot with labels, etc. In matplotlib.pyplot various states are preserved across function calls, so that it keeps track of things like the current figure and plotting area, and the plotting functions are directed to the current subplot.

What we first have to do is importing the library of course. 


```python
import matplotlib.pyplot as plt
```

## 12.1 Basic syntax for plots

```python
plt.plot([1, 2, 3, 2.5])
plt.ylabel('some numbers')
```

<center><img src="../../images/plotting1.png" /></center>

`plot()` is a versatile command, and will take an arbitrary number of arguments. For example, to plot x versus y, you can issue the command:



```python
# list ranging from 1 to 9
x_list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
# list with exponential values
y_list = [1, 4, 9, 16, 25, 36, 49, 64, 81]
```


```python
plt.plot(x_list, y_list)
plt.title("Title of the plot")
```

<center><img src="../../images/plotting2.png" /></center>

Using the pyplot interphase, you build a graph by calling a sequence of functions and all of them are applied to the *current subplot*, like so:


```python
plt.plot([1, 2, 3, 4], [10, 20, 25, 30], color='lightblue', linewidth=3)
plt.scatter([0.3, 3.8, 1.2, 2.5], [11, 25, 9, 26], color='darkgreen', marker='^')
plt.xlim(0.5, 4.5)
plt.title("Title of the plot")
plt.xlabel("This is the x-label")
plt.ylabel("This is the y-label")
# Uncomment the line below to save the figure in your currentdirectory
# plt.savefig('examplefigure.png')
```
<center><img src="../../images/plotting3.png" /></center>

When working with just one subplot in the figure, generally is OK to work with the pyplot interphase, however, when doing more complicated plots, or working within larger scripts, you will want to explicitly pass around the *Subplot (Axes)* and/or *Figure* object to operate upon.

## 12.2 Barplots
Barplots are made with the `plt.bar` function:

```python
# height of bars are nucleotide percentages of data/gene.fa: [A_perc, C_perc, G_perc, T_perc]
height = [17.627944760357433, 33.22502030869212, 30.300568643379368, 18.846466287571083]
# Names of bars
bars = ('A','C','G','T')
# making a barplot
plt.bar(bars, height)
# adding layouts: xlabel, ylabel and title. 
plt.xlabel('Nucleotide')
plt.ylabel('Percentage of occurence (%)')
plt.title('Distribution of nucleotides in fasta sequence')
```

<center><img src="../../images/plotting4.png" /></center>

```python
# height of bars are nucleotide percentages of data/gene.fa: [A_perc, C_perc, G_perc, T_perc]
height = [17.627944760357433, 33.22502030869212, 30.300568643379368, 18.846466287571083]
# Names of bars
bars = ('A','C','G','T')
#plt.bar(bars, height, color=('green','red','yellow','blue'))
plt.bar(bars, height, color=('#1f77b4','#ff7f0e','#2ca02c','#d62728'))

plt.xlabel('Nucleotide')
plt.ylabel('Percentage of occurence (%)')
plt.title('Distribution of nucleotides in fasta sequence')
```
<center><img src="../../images/plotting5.png" /></center>

```python
# libraries
#import numpy as np
import matplotlib.pyplot as plt
 
# width of the bars
barWidth = 0.3
 
# Choose the height of the blue bars
experimentA = [10, 9, 2]
 
# Choose the height of the cyan bars
experimentB = [10.8, 9.5, 4.5]
 
# Choose the height of the error bars (bars1)
yer1 = [0.5, 0.4, 0.5]
 
# Choose the height of the error bars (bars2)
yer2 = [1, 0.7, 1]
 
# The x position of bars
r1 = list(range(len(experimentA)))
r2 = [x + barWidth for x in r1]
 
# Create blue bars
plt.bar(r1, experimentA, width = 0.3, color = 'blue', edgecolor = 'black', yerr=yer1, capsize=5, label='Experiment A') # Capsize is the width of errorbars
 
# Create cyan bars
plt.bar(r2, experimentB, width = 0.3, color = 'cyan', edgecolor = 'black', yerr=yer2, capsize=7, label='Experiment B')
 
# general layout
plt.xticks([x + barWidth/2 for x in r1], ['cond_A', 'cond_B', 'cond_C'])
plt.ylabel('effect')
plt.legend()
 
# Show graphic
plt.show()

```

<center><img src="../../images/plotting6.png" /></center>

## 12.3 Venn diagrams

Venn diagrams are a bit more difficult as they don't have a library that can be imported via a conda environment. We have to add it manually to our environment with `pip install`. 

```python
pip install matplotlib_venn
```

This package is depending on `NumPy`, `scipy` and needs to be imported itself as well. Here are the import statements:
```python
%matplotlib inline
import numpy as np
import scipy
from matplotlib import pyplot as plt
from matplotlib_venn import venn2
```

From here on it's easy to exploit this package either by searching its documentation or using `help()`. Here is the most simplest example:

```python
listGenes1 = ['geneA', 'geneB', 'geneC', 'geneD', 'geneE']
listGenes2 = ['geneC', 'geneD', 'geneE', 'geneF']
```

```python
venn2(subsets=[set(listGenes1), set(listGenes2)], set_labels = ("list 1", "list 2"))
```
