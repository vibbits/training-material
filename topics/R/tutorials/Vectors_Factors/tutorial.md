---
layout: tutorial_hands_on

title: "Vectors and factors"

questions:
  - "How to work with vectors and factors?"

objectives:
  - "learn how to create vectors"
  - "learn how to extract elements from a vector"
  - "learn how to change elements in a vector"
  - "learn how to perform logical and arithmetic operations on vectors"
  - "learn how to create factors"

time_estimation: "75m"

key_points:
  - "We showed how to create a vector"
  - "We showed how to refer to the elements of a vector"
  - "We showed how to remove elements from a vector"
  - "We showed how to change or add elements to a vector"
  - "We showed how to create a factor"

contributors:
  - janick-bits
---

# Data structures in R
{:.no_toc}

The power of R lies not in its ability to work with simple numbers but in its ability to work with large datasets. R has a wide variety of data structures including scalars, vectors, matrices, data frames, and lists.

### Vectors
The simplest data structure is the *vector*, a single row consisting of data values of the same type, e.g. all numbers, characters, Booleans... 

##### Creating a vector
The function **c()** (short for "combine values" in a vector) is used to create vectors. The only arguments that need to be passed to c() are the  values that you want to combine into a vector. 
You can create a **numeric** (a), **character** (b) or **logical** (c) vector:
```
a <- c(1,2,5.3,6,-2,4)
b <- c("janick","jasper","niels")
c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE)
```
You can also create a vector by **joining existing vectors with the c () function:**
```
x1 <- c(1,2,3)
x2 <- c(3,4)
c(x1,x2)
# [1] 1 2 3 3 4
```
> ### {% icon hands_on %} Hands-on: Demo
>
> From the demo script run the **Data Creation: vectors** section
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Exercise 4a
>
> You count every day how many plants of the initial set of 40 plants developed lesions as a result of a mold infection. 
> 
> 1. Create a vector called Plants_with_lesions containing the results of your counts: 1,3,4,2,6
> 2. Create a vector days containing the days of the week in the following format: Mon, Tues, Wednes, Thurs, Fri.
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  > Plants_with_lesions <- c(1,3,4,2,6)
>    >  > days <-  c("Mon","Tues","Wednes","Thurs","Fri")
>    >  ```
>    {: .solution}
{: .hands_on}


> ### {% icon hands_on %} Hands-on: Extra exercise 4b
>
> Create a vector newVector with the following elements: 2,5,5,3,3,6,2 and print its content.
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  newVector <- c(2,5,5,3,3,6,2)
>    >  newVector
>    >  ```
>    {: .solution}
{: .hands_on}

If you need a sequence of consecutive integers you can create it with the **start:end** notation, e.g. a vector with values from 5 through 9
```
5:9	
# [1] 5 6 7 8 9
```
You can also define a decreasing sequence of integers:
```
9:5	
# [1] 9 8 7 6 5
```
You can create the same vector with the seq() function:
```
seq(5,9)  
# [1] 5 6 7 8 9
```

But seq (short for sequence) can do a lot more: it allows to take increments other than 1. It takes four arguments:
- *from*: the first number in the sequence
- *to*: the last possible number in the sequence. 
- *by=increment*: increment, can be added or subtracted depending on the start and the end of the sequence. If from > to then subtract increment, if from < to then add increment.
- *length.out*: alternative to end, number of elements in the vector.

As you can see, some arguments of a function have a name, e.g. the increment argument is called *by*. 

The **rep()** function **repeats** a value a specified number of times.
```
rep("bla", 3)
# [1] "bla" "bla" "bla"
```
You can combine these functions with the c() function to make more complicated vectors:
```
c(rep(1,3), rep(2,3), rep(3,3))
# [1] 1 1 1 2 2 2 3 3 3
```

To generate a **random** set of **numbers** drawn from a normal distribution with a given mean and spread use the **rnorm(n, mean = 0, sd = 1)** function where:
- *n*: how many random numbers do you want ?
- *mean*: mean of the normal distribution
- *sd*: standard deviation of the normal distribution
```
rnorm(1000, 3, 0.25)
```
generates 1000 numbers from a normal distribution with mean 3 and sd=0.25

The normal distribution implies that numbers close to the mean have a higher probability of occurring than numbers far from the mean.

If you want a set of random numbers from a uniform distribution (every number in the specified range has the same probability of being drawn) you can use the **runif(n, min=0, max=1)** function where:
- *n*: how many random numbers do you want ?
- *min*: lowest number of the range of numbers to choose from
- *max*: highest number of the range of numbers to choose from

The most freedom is given by the **sample(x, size, replace = FALSE)** function: it takes a random sample of a specified size from the elements of x either with or without replacement:
- *x*: a vector of elements from which to choose
- *size*: how many random numbers do you want ?
- *replace*: place sampled numbers back in set or not ?
```
sample(c(0,1), 100, replace=TRUE)
```	
generates a set of 100 random zeros or ones.

Suppose you want to simulate 10 rolls of a dice. Because the outcome of a single roll is a number between 1 and 6, your code looks like this:
```
sample(1:6, 10, replace=TRUE)
# [1] 2 2 5 3 5 3 5 6 3 5
```
You tell sample() to return 10 values, each in the range 1:6. Because every roll of dice is independent, you sample with replacement. This means that you put the element you?ve drawn back into the list of values to choose from.

> ### {% icon hands_on %} Hands-on: Exercise 4c
>
> For a study checking the effect of a drug on a disease, we want to store patient info. 
> 
> 1. Create a vector named ID containing numerical values 1,2,3,4
> 2. Create a vector named treatment containing values A, placebo, B, and a missing value.
> 3.  Use the rep() function to create a vector called smoking containing booleans true, true, true, and false. Check the documentation and the examples of usage of rep(). 
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  ID <- 1:4
>    >  treatment <- c("A","placebo","B",NA)
>    >  smoking <- c(rep(TRUE,3),FALSE)
>    >  ```
>    {: .solution}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    >  ```
>    >  smoking <- c(rep(true,3),false)
>    >  ```
>    {: .question}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    >  ```
>    >  smoking <- c(rep("true",3),"false")
>    >  ```
>    {: .question}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Extra exercise 4d
>
> Create vector threes consisting of 3,3,3,3,3,3,3 and print the content of threes
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  threes<-rep(3,7)
>    >  threes
>    >  ```
>    {: .solution}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Extra exercise 4e
>
> Print ha ha ha ha
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  rep("ha",4) 
>    >  ```
>    {: .solution}
{: .hands_on}

> ### {% icon comment %} Comment
>
> Vectors cannot hold values of different types! R automatically converts all values to the same type so that the vector can hold them. If one of the values is a string all values will be converted to strings or in case of a mix of integers and booleans all values will be converted to integers. 
{: .comment}

> ### {% icon comment %} Comment
>
> Words used as values have to be written between quotes, words used as variable names do not! If R encounters a word without quotes it will try to find a variable with that name.
{: .comment}

### Referring to elements of a vector
Every element in a vector is assigned an index (= its position in the vector) in the order in which elements were entered. This index starts with one, not zero. 

You can extract elements from vectors in two ways:
1. You directly identify specific elements using their indices
2. You create a logical operation to select certain elements.

To refer to elements of a vector use indices or a logical operation inside square brackets []
e.g. to retrieve the 2nd element of vector a use:
```
a[2]
```
to retrieve the 2nd, 3rd and 4th element of vector a use:
```
a[2:4]
```
to retrieve the 2nd and 4th element of vector a use:
```
a[c(2,4)]
```
You also see [] when you look at output in the console. The number in between the square brackets is the index of the first value on the line. 
```
v <- c(rep(5,10),rep(10,5))
#[1] 5 5 5 5 5 5 5 5 5 5 10 10
#[13] 10 10 10 
```
There are 12 values on the first line, so on the second line of data, the first value (10) is actually on the 13th position in the vector v. So [13] refers to the index of the first element on the line.

Retrieving elements using a logical operation is done as follows:
```
x
#[1] 1 3 11 1 7
x[x < 4]
#[1] 1 3 1
```
Retrieving data with logical operators is based on the following fact: every logical statement produces the outcome TRUE or FALSE.
```
x < 4
#[1]  TRUE  TRUE  FALSE  TRUE  FALSE
```

Logical operators applied to vectors will result in a vector of the same length consisting of TRUE or FALSE values depending on whether the statement is true for the particular element. If you use the outcomes of a logical operation to retrieve elements of a vector, only the elements where the outcome is TRUE will be selected. 

> ### {% icon hands_on %} Hands-on: Demo
>
> From the demo script run the **Data extraction: vectors** section
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Exercise 5a
>
> Create a vector named x containing the numbers 20 to 2. Retrieve elements that are larger than 5 and smaller than 15.
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  x <- 20:2
>    >  x[x > 5 & x < 15]
>    >  ```
>    {: .solution}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  x[15 > x > 5]
>    >  ```
>    {: .question}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  x(x > 5 & x < 15)
>    >  ```
>    {: .question}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  x[x > 5] & x[x < 15]
>    >  ```
>    {: .question}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Exercise 5b
>
> 1. Retrieve the 4th and 5th elements from the days vector.
> 2. Retrieve elements from Plants_with_lesions that are larger than 2.
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  days[c(4,5)]
>    >  Plants_with_lesions[Plants_with_lesions > 2]
>    >  ```
>    {: .solution}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  days[4,5]
>    >  
>    >  ```
>    {: .question}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  days[4:5]
>    >  
>    >  ```
>    {: .question}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  days(4:5)
>    >   
>    >  ```
>    {: .question}
{: .hands_on}


> ##### {% icon hands_on %} Hands-on: Extra exercise 5c
>
> Create vector y with elements 9,2,4 and retrieve the second element of y.
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  y <-c (9,2,4)
>    >  y[2] 
>    >  ```
>    {: .solution}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Extra exercise 5d
>
> 1. Create vector z with elements 1, 2, 3, 4, 12, 31, 2, 51, 23, 1, 23, 2341, 23, 512, 32, 312, 123, 21, 3
> 2. Retrieve the 3rd, 4th, 5th, 6th and 7th element
> 3. Retrieve the 2nd and 4th element
> 4. Retrieve elements from z that are larger than 100
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  z <- c(1,2,3,4,12,31,2,51,23,1,23,2341,23,512,32,312,123,21,3)
>    >  z[3:7] 
>    >  z[c(2,4)]
>    >  z[z > 100] 
>    >  ```
>    {: .solution}
{: .hands_on}


> ### {% icon hands_on %} Hands-on: Demo
>
> From the demo script run the **Logical and arithmetic operations on variables** section
{: .hands_on}

> ##### {% icon hands_on %} Hands-on: Extra exercise 5h
>
> Retrieve elements from newVector (exercise 4b) that are larger than the corresponding elements of vector threes (exercise 4d).
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  newVector[newVector > threes]
>    >   
>    >  ```
>    {: .solution}
{: .hands_on}

##### Removing, changing or adding elements in a vector
To remove an element from a vector use a negative index: ?-? indicates ?NOT? followed by the index of the element you want to remove, e.g. to remove the second element of vector z use:
```
z <- z[-2]
```

Change or add elements by assigning a new value to that element . 

> ##### {% icon hands_on %} Hands-on: Demo
>
> From the demo script run the **Data removal vectors** section
{: .hands_on}

> ##### {% icon hands_on %} Hands-on: Exercise 6a
>
> From vector x (exercise 5a) remove the first 8 elements and store the result in x2.
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  x2 <- x[-(1:8)]
>    >  x2
>    >  ```
>    {: .solution}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  x2 <- x[-1:8]
>    >  
>    >  ```
>    {: .question}
{: .hands_on}


> ### {% icon hands_on %} Hands-on: Extra exercise 6b
>
> Retrieve the same elements from z as in exercise 5d2 but first replace the 3rd element by 7.
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  z[3] <- 7
>    >  z[3:7] 
>    >  ```
>    {: .solution}
{: .hands_on}

### Factors
You can tell R that a variable is categorical (= text labels representing categories although sometimes numbers are also used) by making it a factor. 

The difference between a categorical variable and a continuous variable is that a categorical variable represents a limited number of categories. A continuous variable is the result of a measurement and can correspond to an infinite number of values. 

In most cases categorical data is used to **describe** other data, it is not used in calculations e.g. which group does a measurement belong to. Storing data as factors ensures that the graphing and statistical functions in R will treat such data correctly.

There are two types of categorical data:
1. unranked categorical data do not have an implied order
2. ranked categorical data do have a natural ordering

R will treat factors by default as unranked but you can create ordered (ranked) factors. 

To create a factor, first create a vector and then convert it to a factor using the factor() function:
```
v <- c(1,4,4,4,3,5,4,4,5,3,2,5,4,3,1,3,1,5,3,4)
v
#[1] 1 4 4 4 3 5 4 4 5 3 2 5 4 3 1 3 1 5 3 4
f <- factor(v,ordered=TRUE)
f
#[1] 1 4 4 4 3 5 4 4 5 3 2 5 4 3 1 3 1 5 3 4
#Levels: 1 < 2 < 3 < 4 < 5 
```

> ### {% icon comment %} Comment
>
> The factor() function creates "Levels": these are the labels of the categories.
{: .comment}

The only **required argument** of the factor() function is a **vector** of values which will be factorized. Both numeric and character vectors can be made into factors but you will use factor() typically for numerical data that represents categories. 

When you create a vector containing text values in R you have to factorize it but if you store the vector as a column in a data frame, text data is automatically converted to a factor. 

When you import data into R using read.() functions, the data is automatically stored in a data frame so text will be automatically converted into a factor. 

So in reality (since you mostly import data into R) you use factor() mainly to factorize **numbers** that represent categories.

By default, factor() transforms a vector into an unordered factor, as does the automated factorization of the read.() functions. Unordered means that the categories are processed in alphabetical order: High will be plotted before Low since H comes first in the alphabet. 

If the categories are ranked, you have to create an ordered factor, you have to add two additional arguments: 
- Set *ordered* to TRUE to indicate that the factor is ordered
- *levels*: a vector of category labels (as strings) in the correct order

> ### {% icon hands_on %} Hands-on: Demo
>
> From the demo script run the **Data creation: factors** section
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Extra exercise 7a
>
> 1. Create a vector gender with the following elements: Male, Female, male. 
> 2. Convert gender into a factor with levels: Male and Female
> 3. Print the content of the factor. What happens?
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  gender <- c("Male","Female","male")
>    >  gender <- factor(gender,levels=c("Male","Female"))
>    >  gender
>    >  ```
>    {: .solution}
{: .hands_on}
