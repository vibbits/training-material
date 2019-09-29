---
layout: tutorial_hands_on

title: "04 Matrices, data frames and lists"

questions:
  - "How to work with tables and lists?"

objectives:
  - "learn how to create a matrix"
  - "learn how to create a data frame"
  - "learn how to extract elements from a data frame"
  - "learn how to change elements in a data frame"
  - "learn how to reorder columns in a data frame"
  - "learn how to create a list"
  - "learn how to extract elements from a list"

time_estimation: "90m"

key_points:
  - "We showed how to create a matrix"
  - "We showed how to create a data frame"
  - "We showed how to refer to the elements of a data frame"
  - "We showed how to remove elements from a data frame"
  - "We showed how to reorder columns in a data frame"

contributors:
  - janick-bits
---

# Data structures in R
{:.no_toc}

The power of R lies not in its ability to work with simple numbers but in its ability to work with large datasets.  R has a wide variety of data structures including scalars, vectors, matrices, data frames, and lists.

### Matrices
A matrix is a table, the columns are vectors of equal length. 
All columns in a matrix must contain the same type of data. The top row, called the header, contains column labels. Rows can also have labels. Data values are called elements. Indices are often used as column and row labels.

### Creating a matrix
To create a matrix M use the matrix() function
```
M <- matrix(data,nrow=r,ncol=c,byrow=FALSE))
```

It takes a long list of arguments:
- *data* usually is a vector of elements to will fill the matrix
- *nrow* and *ncol*: dimensions (number of rows and columns). Only one dimension argument is needed. If there are 20 elements in the *data* vector and *ncol=4* then R will automatically calculate that there should be 5 rows. 
- *byrow*: how the matrix is filled, *byrow=TRUE* fills the matrix row by row whereas *byrow=FALSE* fills the matrix column by column

> ### {% icon hands_on %} Hands-on: Demo
>
> From the demo script run the **Data creation: matrices** section
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Extra exercise 8a
>
> 1. Create a 2x2 matrix named mat containing numbers 2,3,1,5
> 2. Print the matrix
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  mat<-matrix(c(2,3,1,5),nrow=2,ncol=2)
>    >  mat
>    >  ```
>    {: .solution}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Extra exercise 8b
>
> 1. Create a 2x3 matrix named onemat consisting of all ones
> 2. Print the matrix
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  onemat<-matrix(1,nrow=2,ncol=3)
>    >  onemat
>    >  ```
>    {: .solution}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Extra exercise 8c
>
> 1. Create a 3x3 matrix containing numbers 1,2,3,4,5,6,7 
> 2. Retrieve all elements that are larger than 3
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  m <- matrix(c(1,2,3,4,5,6,7),ncol=3) 
>    >  m[m > 3]
>    >  ```
>    {: .solution}
{: .hands_on}

### Data frames
Just like a matrix, a data frame is a table where each column is a vector. But a data frame is more general than a matrix: they are used when columns contain different data types, while matrices are used when all data is of the same type. 

> ### {% icon comment %} Comment
>
> R has a number of built-in data frames like mtcars. 
{: .comment}

### Creating a data frame
To create a data frame D use the function data.frame() with the vectors we want to use as columns:
```
D <- data.frame(column1,column2,column3)
```

> ### {% icon comment %} Comment
>
> The columns of a data frame are all of equal length
{: .comment}

You can provide names (labels) for the columns:
```
D <- data.frame(label1=column1,label2=column2,label3=column3)
```

> ### {% icon comment %} Comment
>
> As an argument of data.frame() you use label=vector_to_add: the equals (and not the assignment) operator is used because you are naming columns not creating new variables. 
If you don't define labels (as in the first example), the names of the vector names are used as column names. 
{: .comment}

> ### {% icon hands_on %} Hands-on: Demo
>
> From the demo script run the **Data creation: data frames** section
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Exercise 9a
>
> Create a data frame called Plant_study containing days and Plants_with_lesions. Name the columns Days and Plants.
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  Plant_study <- data.frame(Days=days,Plants=Plants_with_lesions)
>    >  Plant_study
>    >  ```
>    {: .solution}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Exercise 9b
>
> Create a data frame called Drug_study consisting of three columns: ID, treatment and smoking
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  Drug_study <- data.frame(ID,treatment,smoking)
>    >  Drug_study
>    >  ```
>    {: .solution}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Exercise 9c
>
> Create a data frame genomeSize containing genome sizes and print it. 
> - The first column is called organism and contains Human,Mouse,Fruit Fly, Roundworm,Yeast 
> - The second column size contains 3000000000,3000000000,135600000,97000000,12100000
> - The third column geneCount contains 30000,30000,13061,19099,6034
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  organism <- c("Human","Mouse","Fruit Fly", "Roundworm","Yeast")
>    >  size <- c(3000000000,3000000000,135600000,97000000,12100000)
>    >  geneCount <- c(30000,30000,13061,19099,6034) 
>    >  genomeSize <- data.frame(organism,size,geneCount)
>    >  ```
>    {: .solution}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Extra exercise 9d
>
> Create a data frame ab and print it. 
> - The first column is called a and contains 1,3,2,1
> - The second column is called b and contains 2,3,4,1
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  a <- c(1,3,2,1)
>    >  b <- c(2,3,4,1)
>    >  ab <- data.frame(a,b)
>    >  ```
>    {: .solution}
{: .hands_on}

##### Referring to the elements of a data frame
Referring to elements of a data frame can be done in the same way as for matrices, using row and column **indices** in between square brackets. The only difference is that in data frames you can also use the **labels** of the columns to retrieve them.

To retrieve the element on the second row, first column:
```
D[2,1]
```

To select all values from one dimension leave the index blank, e.g. all elements of the first column:
```
D[,1]
```

> ### {% icon comment %} Comment
>
> If you want to retrieve **all** the rows you don?t write any index before the comma inside the square brackets.
{: .comment}

You can also use column labels for retrieving elements. Column names have to be written between quotes:
```
D[,"label1"]
```

You can also use the range function to select elements:
```
D[2:4,1]
```

The **$** symbol can be used to retrieve a column based on its label e.g. to retrieve column label1 from D:
```
D$label1
```

> ### {% icon comment %} Comment
> With $ you do not have to put quotes around the column name
{: .comment}

Since the result of $ is a vector, you can address a specific element of a column using its index:
```
D$label1[2]
```
retrieves the second element of the column called label1

Specific for data frames is the **subset()** function that can be used to select columns that satisfy a logical operation:
```
subset(D,select=columns to extract)
subset(D,logical expression,columns to extract)
```

> ### {% icon hands_on %} Hands-on: Demo
>
> From the demo script run the **Data extraction: data frames** section
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Exercise 10a
>
> 1. Retrieve the data for the Volvo 142E from mtcars 
> 2. Retrieve the gas usage (mpg column) for the Volvo 142E 
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  mtcars["Volvo 142E",]
>    >  mtcars["Volvo 142E","mpg"]
>    >  ```
>    {: .solution}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  mtcars["Volvo 142E"]
>    >  
>    >  ```
>    {: .question}
>    > ##### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  mtcars[Volvo 142E,]
>    >   
>    >  ```
>    {: .question}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Exercise 10b
>
> 1. Retrieve the IDs of the smoking patients in Drug_study
> 2. Retrieve ID and treatment of the smoking patients 
> 3. Retrieve the smoking behavior of all the patients
> 4. Change the treatment of the fourth patient to A
> 5. Add a column called activity with values: 4, NA, 12.1, 2.5
> 6. Use subset() to retrieve the full ID and treatment columns
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  subset(Drug_study,smoking==TRUE,ID)
>    >  subset(Drug_study,smoking==TRUE,c(ID,treament))
>    >  Drug_study$smoking
>    >  Drug_study$treatment[4] <- "A"
>    >  Drug_study$activity <- c(4,NA,12.1,2.5)
>    >  subset(Drug_study,select=c(ID,treatment))
>    >  ```
>    {: .solution}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  Drug_study[Drug_study$smoking==TRUE,"ID"]
>    >   
>    >  ```
>    {: .question}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  Drug_study[Drug_study$smoking==TRUE,ID]
>    >   
>    >  ```
>    {: .question}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  Drug_study[,"smoking"]
>    >  
>    >  ```
>    {: .question}
>    > ##### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    >  ```
>    >  Drug_study[4,"treatment"] <- "B"
>    >  ```
>    {: .question}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  Drug_study["activity"] <- c(4,NA,12.1,2.5)
>    >   
>    >  ```
>    {: .question}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  subset(Drug_study,c(ID,treatment))
>    >   
>    >  ```
>    {: .question}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  subset(Drug_study,,c(ID,treatment))
>    >   
>    >  ```
>    {: .question}
{: .hands_on}


> ### {% icon comment %} Comment
>
> The order of the arguments is important except when you specify their names. 
{: .comment}

> ### {% icon hands_on %} Hands-on: Extra exercise 10c
>
> On which days did we observe more than 2 infected plants in the plant experiment? Answer this question with and without using the subset() function.
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  > Plant_study[Plant_study$Plants > 2,"Days"]
>    >  > subset(Plant_study,Plants > 2,Days)
>    >  ```
>    {: .solution}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  Plant_study[Plant_study["Plants"] > 2,"Days"]
>    >   
>    >  ```
>    {: .question}
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Extra exercise 10d
>
> 1. Create vector q by extracting the a column of data frame ab (exercise 9) with and without subset().
> 2. Retrieve the second element of column a of data frame ab
> 3. Add column c with elements 2,1,4,7 to data frame ab
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  q <- ab$a
>    >  subset(q,select=a)
>    >  ab$a[2]
>    >  ab$c <- c(2,1,4,7)
>    >  ```
>    {: .solution}
{: .hands_on}

##### Removing elements from a data frame
To remove elements from a data frame use negative indices just as in a vector e.g. to remove the second row from data frame D use:
```
D <- D[-2,]
```

> ### {% icon comment %} Comment
>
> The minus sign only works with numbers not with column labels. 
{: .comment}

To remove columns based on labels assign them to NULL:
```
D$genome <- NULL
```

> ### {% icon comment %} Comment
>
> Setting a column to NULL is done via an assignment so the removal is permanent. 
{: .comment}

> ### {% icon comment %} Comment
>
> Insteading of removing elements you can also define the elements you want to keep.
{: .comment}

> ### {% icon hands_on %} Hands-on: Demo
>
> From the demo script run the **Data removal: data frames** section
{: .hands_on}

##### Reordering columns in a data frame
Reordering columns is a special case of retrieving columns, e.g. for a data frame that has 4 columns you can switch the position of the second and third column as follows:
```
D2 <- D[ ,c(1,3,2,4)]
```

> ### {% icon comment %} Comment
>
> The first comma means keep all the rows, and the 1,3,2,4 refer to column indices. 
> You can use indices or labels to refer to the columns. 
{: .comment}

You can also use subset():
```
D2 <- subset(D,select=c(1,3,2,4))
```

> ### {% icon hands_on %} Hands-on: Demo
>
> From the demo script run the **Column reordering: data frames** section
{: .hands_on}

> ### {% icon hands_on %} Hands-on: Exercise 11a
>
> Switch the position of the second and the third column of Drug_study
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  Drug_study[,c(1,3,2)]
>    >   
>    >  ```
>    {: .solution}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  subset(Drug_study,select=c(1,3,2))
>    >   
>    >  ```
>    {: .question}
{: .hands_on}

### Lists
A list is an ordered collection of objects (of any data type: string, numbers, vectors, matrices, data frames). Lists can even contain other lists as objects! A list allows you to gather a variety of objects under one name. It is not mandatory but very useful to give each object in a list a label.

##### Creating a list
To create a list L use the list() function:
```
L <- list(label1=object1,label2=object2,label3=object3)
```

> ### {% icon hands_on %} Hands-on: Extra exercise 12a
>
> 1. Create a list called myList with the following objects: 5, 6, the word seven, the matrix mat.
> 2. Print the list.
>    > ### {% icon solution %} Solution
>    >
>    >  ```
>    >  myList<-list(5,6,"seven",mat)
>    >   
>    >  ```
>    {: .solution}
>    > ### {% icon question %} Question
>    >
>    >  What will happen when you run this code ?
>    > ```
>    >  subset(Drug_study,select=c(1,3,2))
>    >   
>    >  ```
>    {: .question}
{: .hands_on}

##### Referring to the elements of a list
Referring to the elements of a list can be done in exactly the same way as for data frames, using row and column **indices or labels** in between square brackets. However, since a list can contain other lists or data frames you have to use **double square brackets** [[ ]] to retrieve elements. 

> ### {% icon comment %} Comment
>
> The $ operator also works to access the objects of a list.
{: .comment}
