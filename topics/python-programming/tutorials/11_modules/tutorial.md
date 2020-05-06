---
layout: tutorial_hands_on

title: 11 Modules
questions:
- How to import functions from Python's built-in libraries and from other people or from yourself
objectives:
- Understand how to import modules in several ways and how to call functions within a module. 
- Use built-in modules from Python, e.g. to access date and time, or to navigate in your folders,...
time_estimation: 40m
key_points:
- We can build our own module containing several functions and understand how to use them in some other code. 
- We learned some of Python's built-in modules and know how to e.g. make a folder from Python.
contributors:
- tmuylder

---


## 11.1 Introduction
So now that we know how to make functions, how can you re-use them? Imagine that you've started writing code and functions in one file and the project has grown to such an extent that it would be easier to maintain it in different files each containing a specific part of the project. Or you want to re-use some of the functions in other projects as well. 

In Python you can import functions and chunks of code from files. Such a file containing the functions is called a *module*. Generally we say that we import a *definition* from a *module*. A module can have one or multiple functions in it. 
The file name is the module name with the suffix `.py` appended. 

Using the code from this module is possible by using **import**. In this way you can import your own functions, but also draw on a very extensive library of functions provided by Python (built-in modules). We will first look at the syntax for imports and how to import your own functions, then explore the most commonly used Python libraries.

## 11.2 How imports work
The easiest way to import a module looks like this:

```python
import module1
```

Imagine that in the module `module1`, there is a function called `getMeanValue()`. This way of importing does not make the name of the function available; it only remembers the module name `module1` which you can than use to access the functions within the module:

```python
import module1
module1.getMeanValue([1,2,3])
```

## 11.3 How to create your own module
The easiest example is importing a module from within the same working directory. Let's create a Python module called `module1.py` with the code of the function `getMeanValue()` that we have written earlier (and you can find here below). 

> ### {% icon hands_on %} Create your own module
>
> To create your own module from Jupyter Notebook, follow these steps:
> 1. In order to create a module in Jupyter Lab, first create a new notebook 
> 2. Rename the notebook (e.g. 'module1.ipynb') and copy paste the code in the notebook 
> 3. Click 'File', 'Download as' and 'Python' 
> 4. Jupyter will not download it in some local folder, copy it to your current working directory (in our case in the same directory as we're in right now). 
>
{: .hands_on}

Unfortunately, Jupyter Notebook doesn't have a streamlined & straightforward way of creating Python modules and Python scripts. When you export the notebook, it will always export the whole Notebook and not just a part of it, which makes it very messy if you have a very large notebook. 

Import the following code in the `module1.py` file. 


```python
# When you download this as a Python script, Jupyter will automatically insert the environment shebang here. 

def getMeanValue(valueList):
    """
    Calculate the mean (average) value from a list of values.
    Input: list of integers/floats
    Output: mean value
    """
    valueTotal = 0.0
 
    for value in valueList:
        valueTotal += value
    numberValues = len(valueList)
    
    return (valueTotal/numberValues)
```

## 11.4 Import syntax 
We can now use the module we just created by importing it. In this case where we import the whole 'module1' file, we can call the function as a method, similar to the methods for lists and strings that we saw earlier:


```python
import module1

print(module1.getMeanValue([4,6,77,3,67,54,6,5]))
```

If we were to write code for a huge project, long names can get exhaustive. Programmers will intrinsically make shortcut names for functions they use a lot. Renaming a module is therefore a common thing to do (e.g. NumPy as np, pandas as pd, etc.):


```python
import module1 as m1

print(m1.getMeanValue([4,6,77,3,67,54,6,5]))
```

When importing a file, Python only searches the current directory, the directory that the entry-point script is running from, and sys.path which includes locations such as the package installation directory (it's actually a little more complex than this, but this covers most cases).

However, you can specify the Python path yourself as well. If you're using the materials from [Github](https://github.com/vibbits/gentle-hands-on-python), note that within our folders there is a directory named `modules` and within this folder, there is a module named `module2` (recognizable due to its .py extension). In that module there are two functions: 'getMeanValue' and 'compareMeanValueOfLists'. 


```python
from modules import module2

print(module2.getMeanValue([4,6,77,3,67,54,6,5]))
```


```python
from modules import module2 as m2

print(m2.getMeanValue([4,6,77,3,67,54,6,5]))
```

Another way of writing this is with an absolute path to the module. You can explicitly import an attribute from a module.


```python
from modules.module2 import compareMeanValueOfLists

print(compareMeanValueOfLists([1,2,3,4,5,6,7], [4,6,77,3,67,54,6,5]))
```

So here we *import* the function compareMeanValueOfLists (without brackets!) from the file *module2* (without .py extension!).

In order to have an overview of all the different functions within a module, use `dir()`:


```python
dir(module2)
```

## 11.5 Built-in Modules

There are several built-in modules in Python, which you can import whenever you like.


Python has many ready-to-use functions that can save you a lot of time when writing code. Some of them are discussed here (**time**, **math** and **os/os.path**), but a complete list of all built-in modules can be found [here](https://docs.python.org/3/py-modindex.html). Nonetheless there are also more libraries which you might have heard of: like pandas, NumPy, mathplotlib, seaborn, scikit, etc. 


### 11.5.1 `time`
With **time** you can get information on the current time and date, ...:


```python
import time
time.ctime()  # Print current day and time
```


```python
time.time()   # Print system clock time
```


```python
time.sleep(10)       # Sleep for 5 seconds - the program will wait here
```

See the [Python documentation](https://docs.python.org/3/library/time.html) for a full description of time. Also see [datetime](https://docs.python.org/3/library/datetime.html), which is a module to deal with date/time manipulations.


### 11.5.2 `math`
contains a couple of valuable mathematic operations such as factorials, power and log functions. Here are a couple of them, but more information can be found on [Real Python](https://realpython.com/python-math-module/).


```python
import math
```


```python
# Use the number pi
math.pi
```

```python
# Square root
math.sqrt(9)
```

```python
# factorial of 5 (= 5*4*3*2*1)
math.factorial(5)
```

```python
# floor & ceil
math.floor(6.68)
math.ceil(6.23)
```

```python
# Power functions
math.pow(2, 4)
```


### 11.5.3 `os` and `os.path` 
are very useful when dealing with files and directories:



```python
import os
```


```python
# Get the current working directory (cwd)
currentDir = os.getcwd()
currentDir
```


```python
# Get a list of the files in the current working directory    
myFiles = os.listdir(currentDir)
myFiles
```


```python
# Create a directory, rename it, and remove it
os.mkdir("myTempDir")
os.rename("myTempDir","myNewTempDir")
os.removedirs("myNewTempDir")
```


```python
# Create a full path name to the `module2` module in the modules folder
myFileFullPath = os.path.join(currentDir,'modules','module2.py')
myFileFullPath
```


```python
# Does this file exist?
os.path.exists(myFileFullPath)
```


```python
# How big is the file?
os.path.getsize(myFileFullPath)
```


```python
# Split the directory path from the file name
(myDir,myFileName) = os.path.split(myFileFullPath)
print(myDir)
print(myFileName)
```

See the Python documentation for [**os**](https://docs.python.org/3/library/os.html) and [**os.path**](https://docs.python.org/3/library/os.path.html) for a full description.


## 11.6 Putting everything together

---

> ### {% icon hands_on %} Exercise 11.6.1
>
> Make a new directory in which you write out 5 files with a 2 second delay. Each file should contain the date and time when it was originally written out.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    > # 1
>    > import time, os
>    >  
>    > 
>    > # Create a variable for the directory name
>    > myDir = "timeTest"
>    > 
>    > # Check whether the directory exists, if not create it
>    > if not os.path.exists(myDir):
>    >     os.mkdir(myDir)
>    > 
>    > 
>    > # Loop from 1 to 5
>    > for i in range(1,6):
>    > 
>    >     # Get the current time
>    >     currentTime = time.ctime()
>    > 
>    >     # Write out the file - use i to give a different name to each
>    >     filePath = os.path.join(myDir,"myFile{}.txt".format(i))
>    > 
>    >     outFileHandle = open(filePath,'w')    
>    >     outFileHandle.write("{}\n".format(currentTime))
>    >     outFileHandle.close()
>    > 
>    >     print("Written file {}...".format(filePath))
>    > 
>    >     # Sleep for 2 seconds
>    >     time.sleep(2)
>    >  ```
>    > </details>
>
{: .hands_on}

---




---
> ### {% icon hands_on %} Exercise 11.6.2
>
> Write a function to read in a FASTA file with an RNA sequence and return the RNA sequence (in 3 base unit chunks).
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    > # 2 
>    > import os
>    >  
>    > def readRnaFastaFile(fileName):
>    >  
>    >     if not os.path.exists(fileName):
>    >         print("Error: File {} not available!".format(fileName))
>    >         return (None,None,None)
>    > 
>    >     fconnect = open(fileName)
>    >     lines = fconnect.readlines()
>    >     fconnect.close()
>    > 
>    >     sequenceInfo = []
>    >     moleculeName = None
>    >     description = None
>    > 
>    >     # Get information from the first line - ignore the >
>    >     firstLine = lines[0]
>    >     firstLineCols = firstLine[1:].split()
>    >     moleculeName = firstLineCols[0]
>    >     description = firstLine[1:].replace(moleculeName,'').strip()
>    > 
>    >     # Now get the full sequence out
>    >     fullSequence = ""
>    >     for line in lines[1:]:
>    > 
>    >         line = line.strip()
>    >         fullSequence += line
>    > 
>    >     # Divide up the sequence depending on type (amino acid or nucleic acid)
>    >     for seqIndex in range(0,len(fullSequence),3):
>    >         sequenceInfo.append(fullSequence[seqIndex:seqIndex+3])
>    > 
>    >     return (moleculeName,description,sequenceInfo)
>    > 
>    > 
>    > print(readRnaFastaFile("data/rnaSeq.txt"))
>    >  ```
>    > </details>
>
{: .hands_on}

---




---
> ### {% icon hands_on %} Exercise 11.6.3
>
> Write a program where you ask the user for a one-letter amino acid sequence, and print out the three-letter amino acid codes. Download the dictionary from section 8.2 and save it as a module named SequenceDicts.py first.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    > # 3
>    > # Note how you can import a function (or variable) with a different name for your program!
>    > 
>    > from modules.SequenceDicts import proteinOneToThree as oneToThreeLetterCodes
>    > 
>    > oneLetterSeq = input('Give one letter sequence:')
>    >  
>    > if oneLetterSeq:
>    >     for oneLetterCode in oneLetterSeq:
>    >         if oneLetterCode in oneToThreeLetterCodes.keys():
>    >             print(oneToThreeLetterCodes[oneLetterCode])
>    >         else:
>    >             print("One letter code '{}' is not a valid amino acid code!".format(oneLetterCode))
>    > else:
>    >     print("You didn't give me any information!")
>    >  ```
>    > </details>
>
{: .hands_on}
---



---
> ### {% icon hands_on %} Exercise 11.6.4 
>
> Write a program where you translate the RNA sequence `data/rnaSeq.txt` into 3 letter amino acid codes. Use the dictionary from section 8.2 (called myDictionary) and save it as a module named SequenceDicts.py first. You can use the `readFasta.py` module from the modules folder. 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    > from modules.SequenceDicts import standardRnaToProtein, proteinOneToThree
>    > 
>    > from modules.readFasta import readRnaFastaFile
>    > 
>    > (molName,description,sequenceInfo) = readRnaFastaFile("data/rnaSeq.txt")
>    > proteinThreeLetterSeq = []
>    > 
>    > for rnaCodon in sequenceInfo:
>    > 
>    >     aaOneLetterCode = standardRnaToProtein[rnaCodon]
>    >     aaThreeLetterCode = proteinOneToThree[aaOneLetterCode]
>    >     proteinThreeLetterSeq.append(aaThreeLetterCode)
>    > 
>    > print(proteinThreeLetterSeq)
>    >  ```
>    > </details>
>
{: .hands_on}
---



---
> ### {% icon hands_on %} Exercise 11.6.5 
>
> Write a program that:
> - Has a function `readSampleInformationFile()` to read the information from this sample data file into a dictionary. Also check whether the file exists.
> - Has a function `getSampleIdsForValueRange()` that can extract sample IDs from this dictionary. Print the sample IDs for pH 6.0-7.0, temperature 280-290 and volume 200-220 using this function.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    > import os
>    >  
>    > def readSampleInformationFile(fileName):
>    >  
>    >     # Read in the sample information file in .csv (comma-delimited) format
>    > 
>    >     # Doublecheck if file exists
>    >     if not os.path.exists(fileName):
>    >         print("File {} does not exist!".format(fileName))
>    >         return None
>    >  
>    >     # Open the file and read the information
>    >     fileHandle = open(fileName)
>    >     lines = fileHandle.readlines()
>    >     fileHandle.close()
>    > 
>    >     # Now read the information. The first line has the header information which
>    >     # we are going to use to create the dictionary!
>    > 
>    >     fileInfoDict = {}
>    > 
>    >     headerCols = lines[0].strip().split(',')
>    > 
>    >     # Now read in the information, use the first column as the key for the dictionary
>    >     # Note that you could organise this differently by creating a dictionary with
>    >     # the header names as keys, then a list of the values for each of the columns.
>    > 
>    >     for line in lines[1:]:
>    >  
>    >         line = line.strip()  # Remove newline characters
>    >         cols = line.split(',')
>    > 
>    >         sampleId = int(cols[0])
>    > 
>    >         fileInfoDict[sampleId] = {}
>    > 
>    >         # Don't use the first column, is already the key!
>    >         for i in range(1,len(headerCols)):
>    >             valueName = headerCols[i]
>    >  
>    >             value = cols[i]
>    >             if valueName in ('pH','temperature','volume'):
>    >                 value = float(value)
>    > 
>    >             fileInfoDict[sampleId][valueName] = value
>    > 
>    >     # Return the dictionary with the file information
>    >     return fileInfoDict
>    > 
>    > def getSampleIdsForValueRange(fileInfoDict,valueName,lowValue,highValue):
>    >  
>    >     # Return the sample IDs that fit within the given value range for a kind of value
>    >  
>    >     #sampleIdList = fileInfoDict.keys()
>    >     #sampleIdList.sort()
>    >     sampleIdList = sorted(fileInfoDict.keys())
>    >     sampleIdsFound = []
>    > 
>    >     for sampleId in sampleIdList:
>    > 
>    >         currentValue = fileInfoDict[sampleId][valueName]
>    >  
>    >         if lowValue <= currentValue <= highValue:
>    >             sampleIdsFound.append(sampleId)
>    >  
>    >     return sampleIdsFound
>    >  
>    > if __name__ == '__main__':
>    >  
>    >     fileInfoDict = readSampleInformationFile("../data/SampleInfo.txt")
>    > 
>    >     print(getSampleIdsForValueRange(fileInfoDict,'pH',6.0,7.0))
>    >     print(getSampleIdsForValueRange(fileInfoDict,'temperature',280,290))
>    >     print(getSampleIdsForValueRange(fileInfoDict,'volume',200,220))
>    >  ```
>    > </details>
>
{: .hands_on}
---

