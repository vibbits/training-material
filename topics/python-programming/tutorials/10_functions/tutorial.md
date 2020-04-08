---
layout: tutorial_hands_on

title: 10 Functions

questions:
- How to re-use the same bit of code without the need of copying it over and over?
objectives:
- Define, make and recall functions in Python.
- Understand the importance and know how to properly document functions.
- Deal with a variable number of arguments that serve as input in a function.
- Use default arguments in a function.
time_estimation: 35m
key_points:
- We learned to create functions and recall them at any point within an analysis.
- We know how to make flexible functions in its inputs with defaults and variable number of arguments.
contributors:
- tmuylder

---


## 10.1 Introduction

So far we've been writing 'sequential' code, basically following the flow of the code from the top to the bottom of the program. Sometimes, however, you want to re-use code elsewhere without copy/pasting a bit of code. You can do this with functions; a function holds a block of code that can be called from other places. Functions are essential for larger projects and code maintenance - if there's a problem with that piece of code, for example, you only have to fix it in one place.

## 10.2 Functions

We've already been using built-in Python functions, for example **abs()** or **len()**. However, in this section we will build our own functions. Generally, the syntax when calling a function is the name of the function followed by round brackets **( )**. When you're writing your own function, in essence it would look like this:

```python
def name_function():
    "Some information about the function"
    
    print("This is a very simple function")
```

Information is given to a function by means of an argument and this is passed on in the rounded brackets. In the example above an argument is not defined, hence whenever you call the function it will print the same text. Arguments are defined within the parenthesis and are separated by commas in case there are multiple arguments. Before exploiting functions with arguments, let's have a look to an example with no arguments that prints the same text always when you call the function. 

```python
def silly_function():
    "This is some information about the silly function that will print out some silly text"
    text = "Some silly text"
    print(text)
```
Notice that nothing happened now. This is because we're not calling the function, we just defined it. In order to call the function, we use the following expression:

```python
silly_function()
```


Information about the function can be retrieved by using the `help()` function. 


```python
help(silly_function)
```

The following code is an example of a function that will take some value as an argument and return the absolute value:
```python
def myAbsFunc(someValue):
    "myAbsFunc takes a number as input and will return the absolute value"
    if someValue < 0:
        someValue = -someValue
    return someValue
```

So here we've emulated the Python built-in abs() function with myAbsFunc(). Within a function you can use **return** to 'send back' a value, which can then be used somewhere else in the code. 


```python
myAbsFunc(-10)
```

It works exactly the same as a built-in Python function. 


```python
abs(-10)
```

Functions can also make code more 'readable', as you can give them a name that is easy to understand so that it's clear what is happening without having to examine the code. 


```python
def getMeanValue(valueList):
    """
    Calculate the mean (average) value from a list of values.
    Input: list of integers/floats
    Output: mean value
    """
    meanValue = sum(valueList)/len(valueList)
    
    return meanValue

getMeanValue([4,6,77,3,67,54,6,5])
```


```python
getMeanValue([3443,434,34343456,32434,34,34341,23])
```

Note that it's a good practice to add a comment (in this case a multi-line one) to the top of the function that describes what it does, what it takes as input and what it produces as output. This is especially important for more complex functions. You can invoke the information with `help(function_name)`


```python
def compareMeanValueOfLists(valueList1,valueList2):
 
    """
    Compare the mean values of two lists of values.
    Input: valueList1, valueList2
    Output: Text describing which of the valueLists has the highest average value
    """
 
    meanValueList1 = getMeanValue(valueList1)
    meanValueList2 = getMeanValue(valueList2)
 
    if meanValueList1 == meanValueList2:
        outputText = "The mean values are the same ({:.2f}).".format(meanValueList1)
    elif meanValueList1 > meanValueList2:
        outputText = "List1 has a higher average ({:.2f}) than list2 ({:.2f}).".format(meanValueList1,meanValueList2)
    else:
        # No need to compare again, only possibility left
        outputText = "List2 has a higher average ({:.2f}) than list1 ({:.2f}).".format(meanValueList2,meanValueList1)
 
    return outputText
```


```python
valueList1 = [4,6,77,3,67,54,6,5]
valueList2 = [5,5,76,5,65,56,4,5]
compareMeanValueOfLists(valueList1,valueList2)

```

You can call functions within functions, or basically anywhere in your code, even in conditions, ...:

```python
if getMeanValue(valueList1) > 26 :
    print("The mean value of list 1 is greater than 1.")
```


---

There are several ways to solve this problem, however it might be easier to do it with `zip()` ;). 
> ### {% icon hands_on %} Exercise 10.2.1
>
> The Hamming distance between two strings of equal length is the number of positions at which the corresponding character are different. In a more general context, the Hamming distance is one of several string metrics for measuring the edit distance between two sequences. 
> 
> The Hamming distance between:
> 
> "karolin" and "kathrin" is 3.
> 
> Write a function called "hamming_distance":
> - which accepts two strings, and 
> - raises an error if the lengths are unequal. 
> - Furthermore the function will return an integer that represents the number of mismatches between the two sequences. 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 1
>    > </summary>
>    >
>    >  ```python
>    > # string1 and string2 should be the same length.
>    > def hamming_distance(string1, string2): 
>    >     """Return the Hamming distance between equal-length sequences."""
>    >     
>    >     if len(string1) != len(string2):
>    >         raise ValueError("Undefined for sequences of unequal length.")
>    >     
>    >     # Start with a distance of zero, and count up
>    >     distance = 0
>    >     # Loop over the indices of the string
>    >     L = len(string1)
>    >     for i in range(L):
>    >         # Add 1 to the distance if these two characters are not equal
>    >         if string1[i] != string2[i]:
>    >             distance += 1
>    >     # Return the final count of differences
>    >     return distance
>    > 
>    > seq1 = "GATCATAGA"
>    > seq2 = "CATCATACA"
>    > print(hamming_distance(seq1,seq2))
>    >  ```
>    > </details>
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 2
>    > </summary>
>    >
>    >  ```python
>    > # string1 and string2 should be the same length.
>    > def hamming_distance(string1, string2): 
>    >     """Return the Hamming distance between equal-length sequences."""
>    >     
>    >     assert len(string1) == len(string2), "Undefined for sequences of unequal length."
>    >     
>    >     # Start with a distance of zero, and count up
>    >     distance = 0
>    >     # Loop over the indices of the string
>    >     for s1,s2 in zip(string1,string2):
>    >         if s1 != s2:
>    >              distance +=1
>    >         return distance
>    >     # Return the final count of differences
>    >     return distance
>    > 
>    > seq1 = "GATCATAGA"
>    > seq2 = "CATCATACA"
>    > print(hamming_distance(seq1,seq2))
>    >  ```
>    > </details>
>
{: .hands_on}

---

There are several ways to solve this problem, however it might be easier to do it with the `zip()` function.



---

> ### {% icon hands_on %} Exercise 10.2.2 
>
> Write a function that calculates the GC content of the sequence in a fasta file. For this example you can use [this fasta file](data/gene.fa) which contains the genetic sequence of a bone gla protein. The function must accept a fasta file as input file and will print the following:
> 
> ```
> The GC content of HSBGPG Human gene for bone gla protein (BGP) is	 63.53%
> ```
> 
> The method [.startswith()](https://www.tutorialspoint.com/python/string_startswith.htm) might help. The function should read the lines of the fasta file and if it starts with a '>' define the text that comes afterwards as the sequence ID. The other lines are part of the sequence. After reading through the lines, you can easily define the GC content by counting the bases and taking the average. 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 1
>    > </summary>
>    >
>    >  ```python
>    > # solution one
>    > def gc_content(file):
>    >     """Calculate GC content of a fasta file (with one sequence)"""
>    >     sequence=""
>    >     with open(file, 'r') as f:
>    >         for line in f:
>    >             if line.startswith('>'):
>    >                 seq_id = line.rstrip()[1:]
>    >             else:
>    >                 sequence += line.rstrip()
>    >     GC_content = (sequence.count('G') + sequence.count('C')) / len(sequence) * 100
>    >     print("The GC content of {} is\t {:.2f}%".format(seq_id, GC_content))    
>    > 
>    >     
>    > gc_content('data/gene.fa')
>    >  ```
>    > </details>
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 2
>    > </summary>
>    >
>    >  ```python
>    > # solution two - very similar to one. 
>    > def gc_content(file):
>    >     f = open(file, 'r')
>    >     sequence=""
>    >     for line in f.readlines():  
>    >         if line.startswith('>'):
>    >             seq_id = line.rstrip()[1:]
>    >         else:
>    >             sequence += line.rstrip()
>    >     GC_content = (sequence.count('G') + sequence.count('C')) / len(sequence) * 100
>    >     print("The GC content of {} is\t {:.2f}%".format(seq_id, GC_content))    
>    > 
>    >     
>    > gc_content('data/gene.fa')
>    >  ```
>    > </details>
>
{: .hands_on}
---

## 10.3 Flexibility in functions

In the functions so far we've been using values (arguments) that are passed in and are required for the function to work. If you're not sure how many arguments the user will give, you can use an asterisk `*`. However, make sure that your code is flexible to access the number of arguments that the user is giving as input. In the example below we use the * asterisk to define a flexible number of arguments, and we use a for-loop to access each argument:


```python
def MeanValue(*valueList):
    """
    Calculate the mean (average) value from a list of values.
    Input: list of integers/floats
    Output: mean value
    """
    meanValues = []
    
    for eachList in valueList:
        meanOfList = sum(eachList)/len(eachList)
        meanValues.append(meanOfList)
        
    return meanValues
```


```python
MeanValue([1, 2, 3], [4,5,6])
```


```python
MeanValue([1, 2, 3], [4,5,6], [7, 8, 9])
```

A second way of making flexible functions is by using *keywords* in a function; these are not required for the function to work because they are given a default value in the function definition. You can then set these keywords if necessary; consider the following example.


By default the parameter sortedList is `False` which means that Python will not make a sorted list in the function below, unless you explicitly ask it by setting the parameter to `True`. 


```python
def MeanValue(*valueList, sortedList = False):
    """
    Calculate the mean (average) value from a list of values.
    Input: list of integers/floats
    Output: mean value
    """
    meanValues = []

    for eachList in valueList:
        meanOfList = sum(eachList)/len(eachList)
        meanValues.append(meanOfList)
        
    if sortedList == False:
        print('I calculated all the mean values of your lists, however did not sort them')
    else:
        meanValues.sort()
        print('I calculated the mean values and also sorted them')
    return meanValues
```


```python
valueList1 = [4,6,77,3,67,54,6,5]
valueList2 = [5,5,76,5,65,56,4,5]
valueList3 = [5,9,75,8,65,34,4,4]
```


```python
MeanValue(valueList1, valueList2, valueList3)
```


```python
MeanValue(valueList1, valueList2, valueList3, sortedList = True)
```

Using these keywords makes the function a lot more flexible - you can make the function do things (or not) depending on them.

