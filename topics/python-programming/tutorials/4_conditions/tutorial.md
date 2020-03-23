---
layout: tutorial_hands_on

title: 04 Conditions
questions:
- How to control the code that is performed based on a condition?
objectives:
- Use if-elif-else statements together with condition statements
- Understand what indentation means and how it can affect your code
time_estimation: 30m
key_points:
- We can decide which Python code is executed based on a (set of) condition(s) that is satisfied.  
contributors:
- tmuylder

---

## 4.1 Introduction
Programs start to become more interesting if you can do different things depending on the input. For this, you have to use *conditions*, which we will discuss in this section. 

Decisions will be taken based on a condition. In this perspective, we highlight the importance of understanding booleans **True** and **False**, as well as the **None**-keyword once more.

## 4.2 If statement

The **if** condition allows you to only execute a bit of code if a (set of) condition(s) is satisfied. Python syntax requires that you put a colon : after the **if**, and that the *block* of code that is conditional is *indented* with the same amount of spaces (or tabs). Python doesn't really care about the number of spaces or tabs, as long as you're consistent. Jupyter notebook uses tabs, hence it is best to follow along. Now try this:


```python
x = 5
 
if x == 5:
    print("x is five!")

if x!=5:
    print("x is not five!")
```

you will see that only the block of code under x == 5 is printed out. You can of course make the conditions more complex and combine them with **and** and **or**:



```python
x = 5
y = 10
 
if (y / x) == 2:
    print("y divided by x is 2!")

if y == 10 or x == 2:
    print("x is two or y is ten")
    
if y == 10 and x == 2:
    print("x is two and y is ten")

print("The end")
```

Here you see that the blocks for the first two conditions (which are True) are executed, but not the third. The last line of code is always printed off - it's on the same level as the start of the code, and not conditional.

## 4.3 Indentation
Python relies on indentation (whitespace at the beginning of a line) to define scope in the code. Other programming languages often use (curly) brackets for this purpose. The level of indentation is crucial, and Python will immediately give an error if there are inconsistent levels of indentation in the code. Try this:


```python
x = 5
y = 10
 
if (y / x) == 2:
  print("y divided by x is 2!")
   print ("And x is {}!".format(x))
```

Note that this can also happen if you start mixing space and tab characters!



---

> ### {% icon hands_on %} Exercise 4.3.1
>
> Write a program where you ask the user for x and y, make sure that y is not zero, and print out x/y. 
> 
> ```python
> # Modify the code below on the ... locations:
> xString = input(...)
> yString = input(...)
> 
> x = ...(xString)
> y = ...(yString)
> 
> if ... :
>     print("Error, your y-number is 0")
> if ... : 
>     print("x divided by y = {:.2f}".format(...))
> ```
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  # Write a program where you ask the user for x and y, make sure that y is not zero, and print out x/y. 
>    >  
>    >  xString = input("Give a number: ")
>    >  yString = input("Give another number that is not zero: ")
>    >  
>    >  x = float(xString)
>    >  y = float(yString)
>    >  
>    >  if y == 0:
>    >      print("Error, you're y-number is 0")
>    >  if y != 0:
>    >      result = x/y
>    >      print("x divided by y = {:.2f}".format(result))
>    >  ```
>    > </details>
>
{: .hands_on}
---

## 4.4 Elif statement 

Once you have an **if**-condition, you can directly follow it up with an **elif** (else if) condition. This is not the same as another **if**-statement. An **elif** is only executed if the previous if (and other preceding elifs) are not True. In the example below the code in section 4.3 is adapted. Now all if-statements are changed by elifs.


```python
x = 5
y = 10
 
if (y / x) == 2:
    print("y divided by x is 2!")
elif y == 10 or x == 2:
    print("x is two or y is ten")
elif y == 10 and x == 2:
    print("x is two and y is ten")

print("The end")
```

Now only the code under the first condition is executed, not the second (the third is not True and is in any case irrelevant). If we switch the conditions around a bit:




```python
x = 5
y = 10
 
if y == 10 and x == 2:
    print("x is two and y is ten")
elif y == 10 or x == 2:
    print("x is two or y is ten")
elif (y / x) == 2:
    print("y divided by x is 2!")

print("The end")
```

The first condition is not True, so the second is evaluated. This one is True, so it is executed, and the text 'x is two or y is ten' is printed. For clarity it is often useful to leave some space before and after the (set of) condition(s) - it makes the code easier to 'read' afterwards.





---
> ### {% icon hands_on %} Exercise 4.4.1
>
> Write a program where you ask the user for two words. Compare the words; if they are the same, print a message, if the first or second word is 'Stop', then also print a message. 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  # Write a program where you ask the user for two words. Compare the words; if they are the same, print a message, if the first or second word is 'Stop', then also print a >    >  message.
>    >  print("Give two words.")
>    >  firstWord = input("Write a word: ")
>    >  secondWord = input("Write another word: ")
>    >  
>    >  if firstWord == secondWord:
>    >      print("These words are the same")
>    >  elif firstWord =="Stop" or secondWord == "Stop":
>    >      print("You're word was Stop, hence we stopped here")
>    >  
>    >  print("The end")
>    >  ```
>    > </details>
>
{: .hands_on}
---



## 4.5 Else statement
You can also end an **if** (with or without **elif**s) with an **else** condition. The block of code following else is only executed if the previous (set of) conditions are all False. Try this:


```python
x = 7
 
if not (x % 2):
    print("x is divisible by two!")
elif not (x % 3):
    print("x is divisible by three!")
else:
    print("x is not divisible by two...")

print ("x is {}".format(x))
```

You can modify the value of x a bit to see what else can happen. Can you spot a problem with this example? What will happen if x can be divided by both two and three? What can you do to solve this problem?



> ### {% icon hands_on %} Exercise 4.5.1
>
> Modify the code above so it prints that it is divisible by two and three when this is the case.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  # If a value can be divided by two and three, only the block of code under the first condition will be executed, so you will not find out whether your value can be divided by three! There are several solutions to this, for example:
>    >  x = 12
>    >   
>    >  if not (x % 2):
>    >      print("x is divisible by two!")
>    >      if not (x % 3):
>    >          print("x is divisible by three!")
>    >  elif not (x % 3):
>    >      print("x is divisible by three!")
>    >  else:
>    >      print("x is not divisible by two or three...")
>    >  
>    >  print ("x is {}".format(x))
>    >  
>    >  # This is not a very elegant solution however, as you are repeating the same bit of code twice to find out whether the value can be divided by three. This one might be   slightly better:
>    >  x = 12
>    >  
>    >  if not (x % 2):
>    >      print("x is divisible by two!")
>    >  
>    >  if not (x % 3):
>    >      print("x is divisible by three!")
>    >  
>    >  if (x % 2) and (x % 3):
>    >      print("x is not divisible by two or three...")
>    >  
>    >  print ("x is {}".format(x))
>    >  
>    >  # However you still have to repeat the conditions, which would become very tedious (and error-prone) if you were to try division by many values. The next example is a bit more verbose but cleaner and more 'extendable' for other values:
>    >  x = 12
>    >  xDivisible = False
>    >   
>    >  if not (x % 2):
>    >      print("x is divisible by two!")
>    >      xDivisible = True
>    >  
>    >  if not (x % 3):
>    >      print("x is divisible by three!")
>    >      xDivisible = True
>    >  
>    >  if not xDivisible:
>    >      print("x is not divisible by two or three...")
>    >  
>    >  print ("x is {}".format(x))
>    >  ```
>    > </details>
>
{: .hands_on}

