---
layout: tutorial_hands_on

title: 05 Lists, Tuples and Sets
questions:
- How to combine multiple values in one variable?
objectives:
- Use Lists, Tuples and Sets to collect multiple values within one variable
- Learn how to create and convert different types of variables 
time_estimation: 30 min
key_points:
- Use Lists, Tuples and Sets to collect multiple values within one variable
- Learn how to create and convert different types of variables 
contributors:
- tmuylder

---



## 5.1 Introduction

So far we've seen variables where you essentially assign a value to a name that you can use in the program. It is also possible to assign groups of values to a name, in Python these are called *lists* and *tuples* - variables that contain multiple values in a fixed order. Python also has *sets*, which are also variables that contain multiple values, but in no particular order. In [section 8](8_Dictionaries.ipynb) we will also discuss dictionaries. By means of a brief summary, already in this stage; there are four collection data types in Python:
- `List` is a collection which is ordered and changeable. Allows duplicate members. Use square brackets [] for lists.
- `Tuple` is a collection which is ordered and unchangeable. Allows duplicate members. Use normal brackets () for tuples.
- `Set` is a collection which is unordered and unindexed. No duplicate members. Use curly brackets {} for sets. 
- `Dictionary` is a collection which is unordered, changeable and indexed. No duplicate members. Use curly brackets {} for dictionaries (see [section 8](8_Dictionaries.ipynb)).

They are useful in different circumstances and each data-type has its own advantage. On a small-case example this might not be noticable, however on a larger scale using the right data-type can save you a lot of time. 





## 5.2 Lists and range

You can make your own Python list from scratch:


```python
myList = [5,3,56,13,33]
myList
```

You can also use the `range()` function. Try this:



```python
myList = list(range(10))
myList
```

You should get the following output: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]. This is a list of integers - you can recognize a list by the square [ ] brackets. **Note** that Python always starts counting from 0. The command above will give you a series of integers starting from 0 and stopping at the number you defined, however with this number **not** included in the list. Hence, it stops at 9. You can start from a different number as well:


```python
myList = list(range(3,12))
myList
```

or increase the step size (the default is step size is 1):




```python
myList = list(range(1,12,2))
myList
```

An important feature of lists is that they are flexible - you can add and remove values, change the order, ... . You can do such modifications by calling a *method* from the list itself. Some examples of methods are:
- Add elements
    - `append()` to append an item to the end of the list
    - `insert()` to add an item at the specified index
    - `extend()` to extend an item
- Delete elements
    - `remove()` to remove the specified item
    - `pop()` to remove the specified index (or the last item if index is not specified)
    - `del` keyword removes the specified index
    - `clear()` method empties the list
- Sorting:
    - `sort()` will sort the list in an ordered way
    - `reverse()` will reverse the order of the list
- Copy of a list with the `copy()` method



```python
myList = []             # Create an empty list
myList.append(5)        # Add a single value to the back of the list
myList
```


```python
myList.insert(0,9)      # Insert a value in the list at index (element position) 0
myList
```


```python
myList.extend([99,3,5]) # Extend the list with another list
myList
```


```python
myList[0]               # Return the first element in the list (counting starts at zero) 
```


```python
myList[2]               # Return the third element in the list
```


```python
myRemovedElement = myList.pop(3)  # Remove the fourth element in the list and return it
print("I removed {}".format(myRemovedElement))
myList
```


```python
myList.sort()           # You can sort the elements in a list - this will change their order
myList
```


```python
myList.reverse()        # Or reverse the order of the list
myList
```

You can also select a slice from a list - this will give you a new list:


```python
myList = list(range(15))
 
myListSlice = myList[3:6]
myListSlice
```


```python
myListCopy = myList[:]
print(myListCopy)
```


```python
print(myList[-4:])     # This will select the fourth-last to the last element in the list
```

There are two other methods you can use on lists:
- `index()` returns the index of the first element with the specified value
- `count()` returns the number of elements with the specified value


```python
myList = list(range(1,15))
myList
```


```python
myList.count(10)   # Will count the amount of times the value 10 occurs in this list
```


```python
myList.count("A")  # This always works, and will return 0 if nothing is found
```


```python
myList.index(10)   # Will give the index of the element with value 10 - in this case 9 because the list index starts at 0.
```


```python
#print(myList.index("A"))  # This will crash the program - the value to look for has to be present in the list!!!
```



---

> ### {% icon hands_on %} Exercise 5.2.1
>
> Take the list [54,56,2,1,5223,6,23,57,3,7,3344], sort it in reverse order (largest value first) and print out the third value.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  # Take the list [54,56,2,1,5223,6,23,57,3,7,3344], sort it in reverse order (largest value first) and print out the third value.
>    >  myList = [54,56,2,1,5223,6,23,57,3,7,3344]
>    >  
>    >  myList.sort()
>    >  myList.reverse()
>    >  
>    >  print(myList[2])
>    >  #The first element is at index 0, the third at index 3!
>    >  ```
>    > </details>
>
{: .hands_on}
---


## 5.3 Tuples  
Similar to *lists* are *tuples* - essentially they are the same, except that a tuple cannot be modified once created. This can be useful for values that don't change, like (part of) the alphabet for example:


```python
myTuple = ("A","B","C","D","E","F")
myTuple
```

Important to remember is that if you create a tuple with one value you have to use a comma:


```python
myTuple = ("My string",)
myTuple
```


```python
myWrongTuple = ("My string")  # The brackets here don't do anything.
myWrongTuple
```

A tuple is indicated by round brackets **( )**. You can interconvert between lists and tuples by using `list()` and `tuple()`:




```python
myTuple = ("A","B","C","D","E","F")
myList = list(range(10))
 
myNewTuple = tuple(myList)
myNewList = list(myTuple)
 
print("{} and {}".format(myList, myNewTuple))
print("{} and {}".format(myTuple, myNewList))
```

You can find out the length (number of elements) in a list or tuple with `len()`:


```python
myTuple = ("A","B","C","D","E","F")
myTupleLength = len(myTuple)
myTupleLength
```

Tuples are faster during iteration procedures due to their immutability. 



---

> ### {% icon hands_on %} Exercise 5.3.1
>
> Start with the tuple `('a','B','c','D','e','F')`, sort it, take the fourth value out, and print the result.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  # Start with the tuple ('a','B','c','D','e','F'), sort it, take the fourth value out, and print the result.
>    >  myTuple = ('a','B','c','D','e','F')
>    >  myList = list(myTuple)
>    >  myList.sort()
>    >  #print(myList)
>    >  
>    >  print ("Removing {}".format(myList.pop(3)))
>    >  print ("Result is {}".format(str(tuple(myList))))
>    >  ```
>    > </details>
>
{: .hands_on}
---




## 5.4 Strings
**Strings are a bit like lists and tuples** 

Strings are really a sequence of characters, and they behave similar to lists:


```python
myString = "This is a sentence."
 
myString[0:5]          # Take the first five characters
```


```python
myString.count("e")    # Count the number of 'e' characters
```


```python
myString.index("i")    # Give the index of the first 'i' character
```

You cannot re-assign strings as you do with lists though, the following example does not work:


```python
myString = "   This is a sentence.  "
```


```python
print(myString.upper())       # Upper-case all characters
```


```python
print(myString.lower())       # Lower-case all characters
```


```python
print(myString.strip())       # Strip leading and trailing spaces/tabs/newlines
```


```python
print(myString.split())       # Split the line into elements - default is splitting by whitespace characters
```


```python
print(myString.replace(' is ',' was '))  # Replace ' is ' by ' was '. Spaces are necessary, otherwise the 'is' in 'This' will be replaced!
```

A list with all string methods and a full description can be found in the [Python documentation](https://docs.python.org/3/library/stdtypes.html#string-methods), or simply type `dir(myString)`


```python
dir(myString)
```


---
> ### {% icon hands_on %} Exercise 5.4.1
>
> Ask the user for two words, then check whether they are the same (upper or lower case should not matter),if not check whether they have the same first letter (again case should not matter). If not, then print their length. 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  # Ask the user for two words, then check whether they are the same (upper or lower case should not matter),if not check whether they have the same first letter (again case >    >  should not matter). If not, then print their length. 
>    >  firstWord = input("Give first word:")
>    >  secondWord = input("Give second word:")
>    >  
>    >  print(len(firstWord))
>    >  
>    >  if firstWord.upper() == secondWord.upper():
>    >      print("Words are the same (ignoring case).")
>    >  elif firstWord[0].upper() == secondWord[0].upper():
>    >      print("Words share the same first letter (ignoring case).")
>    >  else:
>    >      print("Word lengths are {} and {}".format(int((len(firstWord))),int(len(secondWord))))
>    >  ```
>    > </details>
>
{: .hands_on}
---

## 5.5 Sets  
Very useful as well are sets. These are unordered and unindexed (so the order in which you put in elements doesn't matter), and it is much easier to compare them to each other. Because sets cannot have multiple occurrences of the same element, it makes sets highly useful to efficiently remove duplicate values from a list or tuple and to perform common math operations like unions and intersections.

![sets](../../images/Python-Set-Operatioons.png)  

Source: https://www.learnbyexample.org/python-set/

You initialise them by using **set()** on a list or tuple:


```python
mySet1 = set(range(10))
mySet2 = set(range(5,20))
 
print(mySet1)
print(mySet2)
 
mySet.add(5)  # Elements in a set are unique - the set will not change because it already has a 5
 
print(mySet1.intersection(mySet2))
print(mySet1.union(mySet2))
```


```python
dir(mySet1)
```

The principle of using intersection and union is the same as the Venn diagrams you probably saw in school... You can also make a set out of a string:


```python
myString = "This is a sentence."
 
myLetters = set(myString)
myLetters    # Note that an upper case T and lower case t are not the same!
```

There are more things you can do with sets which we will not go into here, see the [Python sets](https://docs.python.org/3/library/stdtypes.html#types-set) documentation for more information.

---
> ### {% icon hands_on %} Exercise 5.5.1
>
> Which letters are shared between the words "perspicacious" and "circumlocution"?
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  # Which letters are shared between the words "perspicacious" and "circumlocution"?
>    >  firstWord = "perspicacious"
>    >  secondWord = "circumlocution"
>    >  
>    >  firstLetterSet = set(firstWord)
>    >  secondLetterSet = set(secondWord)
>    >  
>    >  print(firstLetterSet.intersection(secondLetterSet))
>    >  ```
>    > </details>
>
{: .hands_on}
---

