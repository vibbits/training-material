---
layout: tutorial_hands_on

title: 03 Print formatting
questions:
- How can you lay-out the text that Python prints out in a nice and tidy way?
objectives:
- Using .format() to format the printing output.
time_estimation: 20m
key_points:
- We've exploited the .format() method to format the printing of results in a more human readable way. 
contributors:
- tmuylder

---


## 3.1 Introduction  
There are several ways to present the output of a program, data can be printed in a human-readable form, or written to a file for future use. Sometimes users want more control over the formatting of output, rather than simply printing space-separated values. There are several ways to format output which we will cover in this section.

The following figure (which I shamelessly copied from [here](https://www.python-course.eu/python3_formatted_output.php)) helps to visualize the `.format()` argument. If you don't understand it completely, don't worry, we'll cover it in this section:

<center><img src="../../images/format_method_positional_parameters.png" /></center>

Everything between the double quotation marks is what will be printed (thus the `print()` statement is missing). Between curly brackets you can find lay-out options for the arguments, the arguments themselves are given within the `.format()` statement. The first number defines the argument that will be printed (Python starts counting at 0), the number behind the colon (`:`) defines the number of characters that is foreseen for the argument, and lastly the number behind the point (`.`) is only applicable for floats and defines the amount of decimals that will be printed. E.g.: `1:8.2f` will print the first argument with 8 characters/numbers of which two decimals and the type of the argument is a float. If the argument has less than 8 characters/numbers than whitespace will be used. 

## 3.2 Using .format()
The following example gives the most basic use form of the `.format()` statement. 



```python
print("My name is {}.".format("Jane"))
```

The above doesn't do anything interesting; you can however put a number in between the curly brackets `{}` to force the output to take up a number of characters. Try this:


```python
print("My name is {:>10}.".format("Jane"))
```

You'll now see that you force an area of 10 characters to put the name. If the name is shorter, the remaining empty characters will be whitespaces. If the name would be longer, the number will be overruled. Note that the > character in the .format() form can be used to determine the alignment (use < for left align, > for right align and = for centered). 

There are a number of differences between the old Python (version <2.5) and the version you're using now (Python 3.7). In older scripts you might see different print statements. Instead of using the `.format()` statement, it used to be a `%`-symbol to position information in the right place. E.g.:
```print("My name is %s." % "Jane")```  


----

> ### {% icon hands_on %} Hands-on: Exercise 3.2.1
>
> Try to print the text: *Percent of alignment: 100%* using a formatting character for the number 100. 
> If this worked out succesfully, try to align it explicitly to the right with five whitespaces. 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  # part 1
>    >  print("Percent of alignment: {}%".format(100))
>    >  
>    >  # part 2
>    >  print("Percent of alignment: {:>8}%".format(100))
>    >  ```
>    > </details>
>
{: .hands_on}

----




## 3.3 Formatting numbers  
Here are some examples of formatting integers (digits):


```python
print("This is {:d}.".format(252))
print("This is {:d} and {:d}.".format(25,30))
```

Here are some examples of formatting decimal number (floating point):

```python
myFloat = 4545.4542244
 
print("Print the full float {},\ncut off decimals {:5.2f},\nor determine the characters before the decimal {:10.1f}.".format(myFloat,myFloat,myFloat))
 
# Or in old style
# print("Print the full float %f,\ncut off decimals %.2f,\nor determine the characters before the decimal %10.1f." % (myFloat,myFloat,myFloat))
```

## 3.4 Special characters  
For some characters it is necessary to use what are called 'escape' codes because you cannot type the character normally from the keyboard. Try this:

```python
print("The \ sign\ncan\talso\tbe\tprinted.")
```

Here the \\ will print a backslash (however Python might think you are trying to insert a special code and in order to be safe it's better to type a double \\\\), the \n will print a new line, \t a tab character.


Escape codes are necessary if you are trying to print a single or double quote:

```python
print("He said: \"Hello\".")
```
