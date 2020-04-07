---
layout: tutorial_hands_on

title: 09 Files
questions:
- How to import data from files 
- How to export data made by an analysis into a file
objectives:
- Understand the difference between the alternative ways of reading in files.
- Exploit these different ways of reading in files for specific purposes.
- Open & close files appropriately.
- Incorporate writing lines into loops and combine with conditions. 
time_estimation: 30m
key_points:
- We exploited different ways of reading files, each with its own advantage. 
- We learned how to create a file containing results of some analysis.
- We're able to create loops in which we incorporate the exporting of data to a file that we're writing. 
contributors:
- tmuylder

---


## 9.1 Introduction

More often than not the data you need for your program will come from somewhere else - either from user input or a file. Especially for more complex data, it becomes essential to be able to read in data files, do something with the data, and write out a new file with modified information or a set of analysis results.

## 9.2 Reading files
 
To read in a file you have to create a *file handle*. This is a sort of connection to the file that you can use to pull data from it. You create a connection to a file by using the **open()** function. Whenever you're done using the file, it's good practice to close the file handle. 


```python
# Open the file
fileHandle = open("data/readfile.txt")  
# Close the file
fileHandle.close()
# Nothing happened...
```

All this does, is creating this connection, the file has not been read. In order to read in a file, there are a couple of possibilities:
- `readline()` - read the first line of the file as one string. 
- `readlines()` - read all of the lines in the file. Each line is one string. The lines are combined as a list of lines (strings). 
- `read()` - read the whole file as one string. 
Each method has its advantage. E.g. if you're searching for the presence of a word or string in a file, given that the file is not too big, you can use *read*. If you want to process an enormously big file and from each line you need to extract, process and save the information, than it's better to read line by line with *readline* within a for-loop. Try to understand the difference of these methods while you go through this section. 

Given the file `readfile.txt` in a folder named data:

``` 
This is the first line.
Here is a second one. 
And there is also a third line. 
```

1. Using `read`:
Note that the three different lines are read in one long string. This is how the `read` function works. 

```python
fileHandle = open("data/readfile.txt")  
fileHandle.read()
```


```python
fileHandle.close()
```


2. Using `readline`:
Readline reads in the following line. It starts with the first one. When you call the method again, it will print the second line. It's important to understand this as you can exploit this method in a for-loop to access each line separately.

```python
fileHandle = open("data/readfile.txt")   
fileHandle.readline()
```

```python
fileHandle.readline()
```

```python
fileHandle.close()
```


3. Using `readlines`:
Instead of reading the lines of a file one by one, you can also do it in one go. As explained above, each line is one string and all of the lines/strings are stored in a list. 
```python
fileHandle = open("data/readfile.txt")   
fileHandle.readlines()
```


```python
fileHandle.close()
```

Knowing this we can move on to more complex examples. First make sure to find the PDB file *TestFile.PDB* in your data folder or download [this fake PDB coordinate file for a 5 residue peptide](http://wiki.bits.vib.be/images/3/3a/TestFile.pdb) and save it in the data directory. 

In the example below we will read all the lines in the file (as separated by a newline character), and store them in the variable *lines*. Each element in this list corresponds to one line of the file! When this is done, we close the file. 


```python
# Read in the file per line
fileHandle = open("data/TestFile.pdb")
lines = fileHandle.readlines()
 
# Close the file
fileHandle.close()
 
# Print number of lines in the file
print("There are:", len(lines), "lines in the file")

# Loop over the lines, and do some basic string manipulations
for line in lines:
    line = line.strip()  # Remove starting and trailing spaces/tabs/newlines
    print(line)
```


```python
line = lines[10]
line = line.strip().split()
line[-1]
```

Now you can do many other things with the data in the file. E.g. if you want to count the number of times a carbon element appears in the file. 


```python
# Open the file
fileHandle = open("data/TestFile.pdb")
 
# Read all the lines in the file (as separated by a newline character), and store them in the lines list
# Each element in this list corresponds to one line of the file!
lines = fileHandle.readlines()
 
# Close the file
fileHandle.close()
 
# Initialise the line counter
lineCount = 0
 
# Loop over the lines
for line in lines:
    columns = line.strip().split()
    if columns[-1] == 'C':       # Alternatively, use "if ' C ' in line:"
        print(line, end='')     # Using the 'end' argument in the print because the line already contains a newline at the end
                                # otherwise will get double spacing.
        lineCount += 1

print("Number of lines with ' C ': {}".format(lineCount))
```

You should find 75 lines - note that in this case, for those who know the PDB format a bit, you're finding all carbon atoms.

Alternatively, you can use the with() statement to open files. The example here above would then become:
```python
with open("data/readfile.txt") as fileHandle:
    for line in fileHandle:
        print(line)
```
This method is often used as it results in cleaner syntax.

## 9.3 Writing a file
Writing a file is very similar, except that you have to let Python know you are writing this time by adding the `'w'` parameter in the `open()` function. Actually Python needs two arguments, however it assumes that if you only give one parameter (the file that it has to read), the other one is `'r'` which stands for *reading* mode. 

For the sake of the example, we're writing a new file and call it `writefile.txt`:

```python
f = open('data/writefile.txt','w')
f.write('Now we have a new file \n')
f.write('Because Python automatically makes this file and writes some text to it.')
f.write('Btw, if you don\'t specify the newline characters, it will append the string at the end of the last line')
f.close()
f = open('data/writefile.txt')
text = f.read()
print(text)
f.close()
```

**Be careful** - if the file exists already it will be overwritten without warning!

The file is written to the directory you're executing the program in - have a look!


----

> ### {% icon hands_on %} Exercise 9.3.1
>
> Read in the file `TestFile.pdb`, and write out all lines that contain 'VAL' to a new file.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 1
>    > </summary>
>    >
>    >  ```python
>    > # Read the file
>    > f = open("data/TestFile.pdb","r")
>    > g = open('data/withval.pdb','w')
>    > 
>    > # Loop over the lines
>    > for line in f:
>    >     if 'VAL' in line:      # Alternatively, use "if ' C ' in line:"
>    >         if 'ATOM' in line:
>    >             g.write(line)
>    > f.close()
>    > g.close()
>    >  ```
>    > </details>
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 2
>    > </summary>
>    >
>    >  ```python
>    > # Open the file
>    > fileHandle = open("data/TestFile.pdb")
>    > 
>    > # Read all the lines in the file (as separated by a newline character), and store them in the lines list
>    > # Each element in this list corresponds to one line of the file!
>    > lines = fileHandle.readlines()
>    >  
>    > # Close the file
>    > fileHandle.close()
>    >  
>    > # Track the lines with VAL
>    > linesToWrite = []
>    >  
>    > # Loop over the lines
>    > for line in lines:
>    >     if line.count("VAL"):      # Alternatively, use "if ' C ' in line:"
>    >         linesToWrite.append(line)
>    > 
>    > # Write out the lines
>    > fileHandle = open("data/fileWithVAL.pdb",'w')
>    > for line in linesToWrite:
>    >     fileHandle.write(line)
>    > 
>    > # Close the file
>    > fileHandle.close()
>    >  ```
>    > </details>
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 3
>    > </summary>
>    >
>    >  ```python
>    > # Read the file
>    > f = open("data/TestFile.pdb","r")
>    > 
>    > # Track the lines with VAL
>    > linesToWrite = []
>    > 
>    > # Loop over the lines
>    > for line in f.readlines():
>    >     if line.count("VAL"):      # Alternatively, use "if ' C ' in line:"
>    >         linesToWrite.append(line)
>    > 
>    > # Write out the lines
>    > fileHandle = open("data/fileWithVAL.pdb",'w')
>    > for line in linesToWrite:
>    >     fileHandle.write(line)
>    > 
>    > # Close the file
>    > fileHandle.close()
>    >  ```
>    > </details>
>
{: .hands_on}



## 9.4 Advanced file reading and interpretation 

> ### {% icon hands_on %} Exercise 9.4.1
>
> Read in the TestFile.pdb file, print out the title of the file, and find all atoms that have coordinates closer than 2 angstrom to the (x,y,z) coordinate (-8.7,-7.7,4.7). Print out the model number, residue number, atom name and atom serial for each; the model is indicated by:
> ```
> MODEL     1
> ```
> lines, the atom coordinate information is in:
> ```
> ATOM      1  N   ASP A   1     -10.341  -9.922   9.398  1.00  0.00           N
> ```
> lines, where column 1 is always ATOM, column 2 is the atom serial,  column 3 the atom name, column 4 the residue name, column 5 the chain code, column 6 the residue number, followed by the x, y and z coordinates in angstrom in columns 7, 8 and 9.
> 
> note that the distance between two coordinates is calculated as the square root of (x1-x2)²+(y1-y2)²+(z1-z2)².
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution 
>    > </summary>
>    >
>    >  ```python
>    > # Open the file
>    > fileHandle = open("data/TestFile.pdb")
>    >  
>    > # Read all the lines in the file (as separated by a newline character), and store them in the lines list
>    > # Each element in this list corresponds to one line of the file!
>    > lines = fileHandle.readlines()
>    >  
>    > # Close the file
>    > fileHandle.close()
>    >  
>    > # Initialise some information
>    > searchCoordinate = (-8.7,-7.7,4.7)
>    > modelNumber = None
>    >  
>    > # Loop over the lines, and do some basic string manipulations
>    > for line in lines:
>    >     line = line.strip()  # Remove starting and trailing spaces/tabs/newlines
>    >     
>    >     # Only do something if it's not an empty line
>    >     if line:
>    >         cols = line.split()   # Split the line by white spaces; depending on the format this could be commas, ...
>    >  
>    >     # Print the title
>    >     if cols[0] == 'TITLE':
>    >         title = line.replace(cols[0],'')
>    >         title = title.strip()
>    >         print("The title is '{}'".format(title))
>    >  
>    >     # Track the model number
>    >     elif cols[0] == 'MODEL':
>    >         modelNumber = int(cols[1])
>    >  
>    >     # For atom lines, calculate the distance
>    >     elif cols[0] == 'ATOM':
>    >  
>    >         # Set some clear variable names and convert to the right type
>    >         atomSerial = int(cols[1])
>    >         atomName = cols[2]
>    >         residueNumber = int(cols[5])
>    >         x = float(cols[6])
>    >         y = float(cols[7])
>    >         z = float(cols[8])
>    >  
>    >         # Calculate the distance
>    >         distance = ((x - searchCoordinate[0]) ** 2 + (y - searchCoordinate[1]) ** 2 + (z - searchCoordinate[2]) ** 2 ) ** 0.5
>    >         if distance < 2.0:
>    >             print("Model {}, residue {}, atom {} (serial {}) is {:.2f} away from reference.".format(modelNumber,residueNumber,atomName,atomSerial,distance))
>    > 
>    >  ```
>    > </details>
>
{: .hands_on} 



## 9.5 Next session
Conclusion