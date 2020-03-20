---
layout: tutorial_hands_on

title: 06 Loops
questions:
- How to perform the same code over and over again?
objectives:
- Perform the same code over a list of values using for-loops
- Use a while statement to perform code over and over until a specific condition is met
- Recall how Python iterates over multiple variables simultaneously
time_estimation: 30 min
key_points:
- We learned how to use the while and for loops for a single and for multiple lists, strings, and other variables
contributors:
- tmuylder

---

## 6.1 Introduction

Another important feature of computer programs is that they can do the same thing over and over again with different information. This is possible by using loops in your code; essentially a loop is executed until it runs out of data or the code decides to break out of it.



## 6.2 For loop
Now that we have these variables that can hold multiple elements (previous exercise), it would be useful to be able to loop over them one by one. This is possible with the **for** loop:




```python
# Make a list of integers from 0 to 9 with steps of 1 (0, 1, 2, ..., 9)
myList = range(10) 
 
# for each value (myElement) in this list (myList); do the following:
for myElement in myList: 
    # Print that value
    print("Counting {}".format(myElement))  
```

In the first iteration myElement will take up the first value of myList and perform the code that is indented (in this cas it will print *counting 0*), then it will go back to the start of the loop and take up the second value of myList (which is 1) and perform again the code that is indented (*counting 1*), etc.  

Note that again we have to use indentation, as there is a block of code that is only relevant within the for loop. 

Python will always need a list, tuple, set or dictionary to iterate through and it will work exactly the same with tuples (see example below). The iterator will always take up the value of the list/tuple/set/dict! 


```python
myTuple = ("A","B","C","D","E","F")
 
for myElement in myTuple:
    print("Letter {}".format(myElement))
```

Because you can access individual elements within a list or tuple, you can also count the element index in the list or tuple, so that you know both index and value. If you want to iterate over  a list of letters, in this case it's in a tuple type, you'll first have to find the length of the list and then use range to make a list of integers that can be used as an index. 


```python
myTuple = ("A","B","C","D","E","F")
myTupleLength = len(myTuple)
 
for tupleIndex in range(myTupleLength):
    myElement = myTuple[tupleIndex]
    print("Letter {} is at position {}".format(myElement,tupleIndex + 1))  # We have to add 1 to the index here because Python starts at zero...
```

Python has a built-in function `enumerate()` which eases this task for you as a programmer. For the tuple which we defined above, you could make the following table with indeces and accompanied values:

<center>

| index | value |
|---|---|
| 0 | A |
| 1 | B |
| 2 | C |
| 3 | D |
| 4 | E |
| 5 | F |
</center>

`enumerate()` mimics this table and you can use it in this way which immediately gives you the indeces:


```python
myTuple = ("A","B","C","D","E","F")
for line in enumerate(myTuple):
    print(line)
```

The enumerate function has some similarities with dictionaries, especially in how to access a value. Don't worry if you're confused with the squared brackets, we'll cover this in Chapter 8. 


```python
myTuple = ("A","B","C","D","E","F")
for line in enumerate(myTuple):
    print("Letter {1} is at position {0}".format(line[0]+1, line[1])) # For the sake of exercising I switched the format positions for once. 
```

----

**Intermezzo:**


Before starting with exercises, we want to highlight the if-conditions from chapter 4 again, especially the fact that Python interprets the integer 0 to be `False`, the integer 1 is interpreted as `True` and any other integer different than 0 and 1 is considered to be not `False` (it's also not `True` though)


```python
a = 0
a == False
```


```python
b = 1
b == True
```


```python
c = 2
c == True
```


```python
c == False
```


```python
c != True
```


```python
c != False
```

Why is this important to know? We see sometimes code similar to the one below in which an arithmetical operation is evaluated in an `if` statement. If the result of this arithmetical operation is an integer like 2, 3, etc. we know now how we can deploy this knowledge to evaluate the statement.  



```python
c = 2 
if c != False:  # 
    print("C is equal to", c)
```


```python
a = 0
if a:
    print("A is equal to 0")
```


```python
b = 1
if b:   
    print("B is equal to", b)
```


```python
if not a:
    print("A is still equal to 0")
```

----

Now we want to find out if a number is divisible by another number. In the code below, we will iterate over each value in the list of numbers. If the remainder after division is 0 (comparison is True), we print the number out. 



```python
myNumbers = range(1,50)
myDivider = 17
 
for myNumber in myNumbers:
    if not (myNumber % myDivider):  # Nothing left after division, so number is divisible.
        print("Number {} cannot be divided by {}!".format(myNumber,myDivider))
```

Here we now have two levels of code besides the main one; the **if** is checked for every value, but the print is only executed for numbers divisible by myDivider.


You can also control the loop by using **continue** and **break**. They alter the flow of a normal loop:


```python
myNumbers = range(1,100)
 
for myNumber in myNumbers:
    if myNumber == 5:   
        continue     # This means that the code within the for loop will be ignored if myNumber is equal to 5, we 'jump back' to the start and use the next number (6)
    print(myNumber)

    if myNumber == 8:
        break        # This means we will exit the loop alltogether, all other values after this one will not be dealt with.

```

---
> ### {% icon hands_on %} Exercise 6.2.1
>
> Write a program where you print out all positive numbers up to 1000 that can be divided by 13, or 17, or both. The output should be printed as : `Number 13 is divisible by [13]`. If you want a little more challenge, the output should be printed as `Number 884 is divisible by 13, 17`
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 1
>    > </summary>
>    >
>    >  ```python
>    >  myNumbers = range(1,100) # should be 1001
>    >  myDividers = (13,17)    # We will loop over these in the loop itself, so it's easy to add new numbers to this
>    >   
>    >  for myNumber in myNumbers:
>    >      validDividers = []     # In this list we will put all the valid dividers
>    >      for myDivider in myDividers:
>    >          if not (myNumber % myDivider):
>    >                validDividers.append(myDivider)
>    >      if validDividers:      # This means that the list has to have values in it
>    >          print("Number {} is divisible by {}".format(myNumber,validDividers))       
>    >  ```
>    > </details>
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 2
>    > </summary>
>    >  ```python
>    >  # Extra: The output is not very nice here as you print off the list with the square brackets, you could try the following bit of code under the if validDividers: condition:
>    >  myNumbers = range(1,100) #should be 1001
>    >  myDividers = (13,17)    # We will loop over these in the loop itself, so it's easy to add new numbers to this
>    >   
>    >  for myNumber in myNumbers:
>    >      validDividers = []     # In this list we will put all the valid dividers
>    >      for myDivider in myDividers:
>    >          if not (myNumber % myDivider):
>    >                validDividers.append(myDivider)
>    >      if validDividers:      # This means that the list has to have values in it
>    >          # First make strings out of the integers; this is valid Python syntax where you make a list out of a list    
>    >          validDividerStrings = ["{}".format(validDivider) for validDivider in validDividers]
>    >  
>    >          # Now you can join the elements of a list (if they are strings) together using the .join() method for a string:
>    >          validDividerString = ', '.join(validDividerStrings)
>    >   
>    >          print("Number {} is divisible by {}".format(myNumber,validDividerString))
>    >      
>    >      ######### Or as an alternative for the nice printing:
>    >          #if len(validDividers) == 1:
>    >          #    print("number is div by {}".format(validDividers[0]))
>    >          #elif len(validDividers) == 2:
>    >          #    print("number x is div by {}, {}".format(validDividers[0],validDividers[1]))
>    >  ```
>    > </details>
>
{: .hands_on}

---




---

> ### {% icon hands_on %} Exercise 6.2.2
>
> Write a program where you find, for each positive number up to 50, all numbers that can divide each number. E.g. 16 can be divided by 1, 2, 4, 8 and 16. 17 can be divided by... 
> 
> It's fine if you print the output like this: 
> ```
> Number 1 can be divided by 1!
> Number 2 can be divided by 1!
> Number 2 can be divided by 2!
> Number 3 can be divided by 1!
> ```
> However, you can also try to print the output like this:
> ```
> Number 4 can be divided by 1, 2, 4!
> ```
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 1
>    > </summary>
>    >
>    >  ```python
>    >  # Write a program where you find, for each positive number up to 50, all numbers that can divide each number. E.g. 16 can be divided by 1, 2, 4, 8 and 16. 17 can be divided by...
>    >  myNumbers = range(1,5) #should be 51
>    >   
>    >  for x in myNumbers:
>    >      dividers = []
>    >      for y in range(1,x+1):
>    >          if not (x % y):
>    >              dividers.append(y)
>    >   
>    >      for divider in dividers:
>    >          print ("Number {} can be divided by {}!".format(x,divider))
>    >  ```
>    > </details>
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 2
>    > </summary>
>    >
>    >  ```python
>    >  # The output is again not very nice here, you can replace the last two lines by this for nicer output:
>    >  myNumbers = range(1,5)
>    >   
>    >  for x in myNumbers:
>    >      dividers = []
>    >      for y in range(1,x+1):
>    >          if not (x % y):
>    >              dividers.append(y)
>    >   
>    >      #for divider in dividers:
>    >      dividerList = ", ".join([str(divider) for divider in dividers])
>    >          
>    >      print ("Number {} can be divided by {}!".format(x,dividerList))
>    >  ```
>    > </details>
>
{: .hands_on}


## 6.3 While loop
A **while** loop is dependent on a condition, as long as this condition is evaluated as `True` the loop will continue. This is an endless loop:
FYI, if you execute this, you'll end up in an enternal loop. To break the loop, press stop button.


```python
while True:
    print("Endless...")
```

While loops are more flexible than for loops, as you can make them end whenever necessary depending on code within the loop itself:




```python
baseValue = 2
powerValue = 1
powerResult = 0
while powerResult < 1000:
    powerResult = baseValue ** powerValue
    print("{} to the power {} is {}".format(baseValue,powerValue,powerResult))
    powerValue += 1 # Add one to itself - this kind of step is crucial in a while loop, or it will be endless!
```

Note that the last value printed is greater than 1000, the while condition is only checked at the start of the loop. You should check where the first result is calculated as this may impact the result! Here we changed the order of calculating the value. We *initialized* the loop and put the calculation at the very end:



```python
baseValue = 2
powerValue = 1
powerResult = 0
powerResult = baseValue ** powerValue

while powerResult < 1000:
    print("{} to the power {} is {}".format(baseValue,powerValue,powerResult))
    powerValue += 1 # Add one to itself - this kind of step is crucial in a while loop, or it will be endless!
    powerResult = baseValue ** powerValue
```

---

> ### {% icon hands_on %} Exercise 6.3.1 
>
> Try to reproduce a for-loop (the example of numbers divisible by 17) by using a while-loop.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    > 
>    >  ```python
>    >  # Try to reproduce a for-loop (the example of numbers divisible by 17) by using a while-loop.
>    >  myNumber = 1
>    >  myDivider = 17
>    >  
>    >  while myNumber <= 50:
>    >      if not (myNumber % myDivider): # Nothing left after division, so number is divisible.
>    >          print("{} is divisible by {}".format(str(myNumber),str(myDivider)))
>    >      myNumber += 1
>    >  
>    >  ```
>    > </details>
>
{: .hands_on}
---


---

> ### {% icon hands_on %} Exercise 6.3.2
>
> Write a program where you start with a list of numbers from 1 to 100, and you then remove every number from this list that can be divided by 3 or by 5. Print the result.  
> Tip: you have to make a copy of the original list here, otherwise Python will get 'confused' when you remove values from the list while it's looping over it. Use `[:]` for this purpose.  
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    > ```python
>    > # Write a program where you start with a list of numbers from 1 to 100, and you then remove every number from this list that can be divided by 3 or by 5. Print the result.
>    > # Tip: you have to make a copy of the original list here, otherwise Python will get 'confused'
>    > # when you remove values from the list while it's looping over it
>    > 
>    > myNumberList = list(range(1,101))
>    > 
>    > for number in myNumberList[:]:  
>    >     if not (number % 3) or not (number % 5):
>    >         myNumberList.pop(myNumberList.index(number))
>    > 
>    > print(myNumberList)
>    > ```
>    > </details>
>
{: .hands_on}

---


---
> ### {% icon hands_on %} Exercise 6.3.3
>
> Write a program where you ask the user for an integer (whole number), and keep on asking if they give the wrong input. Check whether the number can be divided by 7, and print the result.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    > # Write a program where you ask the user for an integer (whole number), and keep on asking if they give the wrong input. Check whether the number can be divided by 7, and print the result.
>    > myNumberList = range(1,101)
>    >  
>    > # Keep on checking until you have a number, prime the while loop as well
>    > isNumber = False
>    > while not (isNumber):
>    >     inputString = input("Give a number:")
>    >     if inputString.isdigit():
>    >         isNumber = True
>    >         number = int(inputString)
>    >     else:
>    >         print("Incorrect, not a whole number, try again.")
>    >     if not (number % 7):
>    >         print("{} can be divided by 7!".format(number))
>    >     else: 
>    >         print("Number not divisible by 7")
>    >  ```
>    > </details>
>
{: .hands_on}
---

## 6.4 Iterating through two files at the same time
Python has a built-in function which allows you to iterate through multiple e.g. lists or strings at the same time. For two strings, it would look like this:


```python
x = 'abcde'
y = 'fghij'

count = 0
for i,j in zip(x,y):
    count += 1
    print("Iteration: {}. The value i is {}, and the value j is {}".format(count, i, j))
```

And the principle is practically the same for three (or more) strings. 


```python
x = 'abcde'
y = 'fghij'
z = 'klmno'

count = 0
for i,j,k in zip(x,y,z):
    count += 1
    print("Iteration: {}. The value i is {}, the value j is {} and the value k is {}".format(count, i, j, k))
```


