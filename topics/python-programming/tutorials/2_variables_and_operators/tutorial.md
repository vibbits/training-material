---
layout: tutorial_hands_on

title: 02 Variables and Operators
questions:
- Which Python's built-in data types are there?
- How to assign a value to a variable?
- How to compare values within variables using operators? 

objectives:
- Recognize different built-in data types of Python
- Write, evaluate and interpret expressions in Python
- Print out results to the user
time_estimation: 20m
key_points:
- We've assessed the string, integers, float and boolean data-types of Python
- We compared variables and their values with operators
- We know how to use .format() in its most basic form 
contributors:
- tmuylder

---



## 2.1 Introduction

Just printing things is not that interesting, what you really want to do with a computer program is manipulate data. This is why variables are so important - they allow you to assign information to a name that you can re-use later on.

In this section we will introduce the basic types of variables and how you can manipulate them. Just to get started, we give an overview of the different **built-in data types** that are present in Python and which you can assign to a variable. Although this variety of data types exist, not all of them will be discussed in this course.

- Text type:       `str`
- Numeric types:   `int`, `float`, `complex`
- Sequence types:  `list`, `tuple`, `range`
- Mapping types:   `dict`
- Set types:       `set`, `frozenset`
- Boolean types:   `bool`
- Binary types:    `bytes`, `bytearray`, `memoryview`

In this section, we will cover the text type, numeric types (complex are out of scope) and booleans.

**Operators** can be anything from:
- Arithmetic: additions, substractions, multiplications, divisions, remainders and power
- Comparison: equal to, not equal to, greater than, less than, etc. 
- Logical: AND, OR and NOT used for conditional statements
- Identity: `is`, `is not`

**Note**:  
This section doesn't really include any exercises. Try to follow and code along while we scroll through the examples so you start to have a feeling of it.

## 2.2 Strings
We already saw strings in the previous section. You can assign a string to a variable like this:


```python
# Assign the sequence AGAATCGATACGA to a variable and print the variable.  
mySequence = "AGAATCGATACGA"
print(mySequence)
```

What happens here is that you assign a **value**: "*AGAATCGATACGA*" to a **variable**: `mySequence` and then print it out. You can now keep on using `mySequence` throughout your program. Note that `mySequence` is not quoted because it is now part of the program, try this for example:


```python
# Repeat the above, but this time put the variable in quotation marks when you put in the print statement and see what happens
mySequence = "AGAATCGATACGA"
print("mySequence")
```

You will now still assign the value "*AGAATCGATACGA*" to the variable `mySequence`, but because of the quotes you then print off the string "mySequence", not the variable.

You can assign strings in the following ways:


```python
myString1 = "Hello world!"
myString2 = 'Hello sun!'
myString3 = """Hello
universe."""
print(myString1)
print(myString2)
print(myString3)
```

The single and double quotes are essentially the same. If you use triple double quotes - """ - you can assign a string over multiple lines.


```python
# Try assigning a string over multiple lines without using the triple double quotes and see what happens.
myString = "Hello
universe."
```

This will give a SyntaxError, as Python 'reads' each line separately, and it doesn't find the ending (on the first line) and starting (on the second line) quote. Using the escape codes, you can however do the following:



```python
# Try to print two words in two different lines without using three "" marks. 
myString = "Hello\nuniverse."
myString
```

## 2.3 Strings from user input

Python provides a very simple way to get user input. This input is always returned as a string, so try the following:


```python
# Use input to ask for a sequence string, then print the input sequence
mySequence = input("Give me a sequence:")
print(mySequence)
```

## 2.4 Integers
Integers are non-decimal numbers. Python will recognize numbers in the code automatically, so you can do:


```python
# Assign integer 5 to a variable myInteger
myInteger = 5
print(myInteger)
```

As described in the introduction, you can also do standard mathematical operations on integers. Mathematical operations are even possible within a print statement.


```python
5 + 5  # Addition
```


```python
5 - 8  # Subtraction
```


```python
2 * 5  # Multiplication
```


```python
4 / 2  # Division
```


```python
5 % 2  # Modulus, remainder of division
```


```python
2 ** 3 # Power
```

It doesn't matter if you use variables or integers for this:


```python
x = 5
y = 2
```


```python
x + 5  # Addition
```


```python
x - 8  # Subtraction
```


```python
y * x  # Multiplication
```


```python
4 / y  # Division
```


```python
5 % y  # Modulus, remainder of division
```


```python
y ** 3 # Power
```

In order to print an integer inside a string, you could simply use the following expression in which the string is separated from the integer with a comma.


```python
firstResult = 5 * 4
print("The result is", firstResult,".")
```

However, there is another way using the `.format()` method. The format method allows you to change the lay-out of the output that it prints. We will use it a lot during this course, here you see it in the most simplest form. The variable that you want to print is given within the rounded brackets of the format method, and the location in the string to where it prints is given with curly brackets:


```python
firstResult = (5 * 4)
print(firstResult)
print("The result of the first calculation is {}.".format(firstResult))

secondResult = (5 * (4 + 3) - 2)
print(secondResult)
print("The result of the second calculation is {}.".format(secondResult))
```

Note here the precedence of operations; * and / take precedence over + and -. You can use () to change the results.

## 2.5 Floats

Floats (floating point numbers) are decimal numbers that behave in the same way as integers, except that they are more accurate


```python
# Assign float 5.5 to the myFloat variable
myFloat = 5.5 
myFloat
```


```python
type(myFloat)
```

Mathematical operations are the same:


```python
5.2 + 4.8  # Addition
```


```python
5.2 - 8.3  # Subtraction
```


```python
2.0 * 5.11212  # Multiplication
```


```python
4.2 / 2.7  # Division
```


```python
5.4 % 2.0  # Modulus, remainder of division
```


```python
4 ** 0.5 # Power
```

Also floats can be incorporated in a string with the `.format()` statement. You can determine the number of characters before and after the decimal point as well, however we will cover this in the next section. 


```python
myFloat = 4545.4542244
print("Print the full float {},\ncut off decimals {:.2f},\nor determine the characters before the decimal {:10.1f}.".format(myFloat,myFloat,myFloat))
```

Note here that we put three formatting characters in the string; we then also need three values to print out. 

## 2.6 Floats, integers and strings  
You can also force a conversion between the different value types float, integers and strings with the `str()`, `int()` and `float()` conversions:


```python
# Use the int() and float() statements to switch the value types and print out the values. Do you notice any differences?
myFloat = 4.5
myFloat
```


```python
int(myFloat) # Note that it will print the result of the operation; myFloat remains an integer!
```


```python
myInteger = 5
myInteger
```


```python
myOtherFloat = float(myInteger)
myOtherFloat
```

The same is possible to convert between strings with `str()`, you can also convert strings back to integers and floats but only if the content of the string is an integer or float:


```python
# Convert a float and an integer to a string with the str() statement 
myFloat = 4.5
myFloatString = str(myFloat)
myInteger = 5
myIntegerString = str(myInteger)
print("My strings are {} and {}".format(myFloatString,myIntegerString))
print("My string converted to integer is {}".format(int(myIntegerString)))
print("My string converted to float is {}".format(float(myFloatString)))
```


---
> ### {% icon hands_on %} Exercise 2.6.1
>
> Write a program where you ask for a number, convert it to an integer, and print out in a formatted string what your number is.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  myFloatString = input("Give me a number:")
>    >  myInteger = int(float(myFloatString))
>    >  print("My number in integer form is {}".format(myInteger))
>    >  ```
>    > </details>
>
{: .hands_on}
--- 

You can also add, substract, divide and multiple a variable by a number or other variable directly. These are the so-called assignment operators.


```python
myFloat = 6
myString = "ABC"
 
myFloat += 5   # Same as myFloat = myFloat + 5
print(myFloat)
 
myString += "DE"  # Addition works for strings as well
print(myString)
 
myFloat -= 5   # Same as myFloat = myFloat - 5
print(myFloat)
 
myFloat /= 2   # Same as myFloat = myFloat / 2
print(myFloat)
 
myFloat *= 2   # Same as myFloat = myFloat * 2
print(myFloat)
```

Finally, you can check what data type a variable is by using `type()`:


```python
myInteger = -6
myFloat = 5.22
myString = "Text!"
 
print(myInteger, type(myInteger))
print(myFloat, type(myFloat))
print(myString, type(myString))
```

Note here that you can print multiple values by using a comma in between the values.



---
> ### {% icon hands_on %} Exercise 2.6.2
>
> See what happens if you try to print a float as an integer, and an integer as a string. 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  myFloat = 11.4
>    >  myIntFloat = int(myFloat)
>    >  print("My float as integer {}".format(myIntFloat)) 
>    >  #This works
>    >  myInt  = 12
>    >  print("My integer as string {}".format(str(myInt)))
>    >  #This works as well... but:
>    >  myString = "Hello"
>    >  print("My string as float {}".format(float(myString)))
>    >  #will fail and give a TypeError - Python cannot convert "aa" into a float.
>    >  ```
>    > </details>
>
{: .hands_on}
--- 


## 2.7 Booleans 
Finally, there are the boolean variables `True` and `False`. 
Python returns booleans when comparing values. In the code below python checks whether the comparison is `TRUE`, when this is the case it will print out the boolean True. In order to do a comparison, we use **comparison operators** like `==, >, <, <=, >=, !=`


```python
myBoolean = True
myBoolean
```


```python
type(myBoolean)
```


```python
myInteger = 5
myInteger == 6   # This means 'is myInteger equal to 6?'
```


```python
myInteger < 6    # This means 'is myInteger smaller than 6?'
```


```python
myInteger > 6    # This means 'is myInteger greater than 6?'
```


```python
myInteger <= 6   # This means 'is myInteger smaller or equal to 6?'
```


```python
myInteger >= 6   # This means 'is myInteger greater or equal to 6?'
```


```python
myInteger != 6   # This means 'is myInteger not equal to 6?'
```

Similarly to comparison operators, you can also use `is` and `not` which are the **identity operators**:


```python
myInteger = 5
```


```python
myInteger is 6    # Same as ==
```


```python
myInteger is not 6   # Same as !=
```


```python
not myInteger > 6    # Same as <=
```

If you want to combine multiple comparisons, it is possible to use the logical operators `and` and `or`. With the `and` operator both comparisons have to be True for the result to be True. With the `or` operator, only one has to be True for the result to be True.


```python
x = 5
y = 6
```


```python
x == 5 and y > 2    # Both have to be True for the result to be True
```


```python
x != 5 or y > 2     # Only one has to be True for the result to be True
```

## 2.8 Nothing

Finally, we highlight the `None` value which is comparable to other program's `null` values. In the code below we show that None, which you could interpret as nothing, is still something else than the value 0 or e.g. an empty string. 


```python
myNothing = None
myNothing
```


```python
type(myNothing)
```


```python
type(None)
```


```python
0 == None
```


```python
"" == None
```

However, the opposite of None is still True. 


```python
not None
```

Really 0 is still an integer, "" a string, so `None` is really nothing:

