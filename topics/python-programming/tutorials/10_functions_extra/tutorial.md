---
layout: tutorial_hands_on

title: 10 Functions extra
questions:
- 
objectives:
- 
time_estimation: 20m
contributors:
- tmuylder

---


## Extra exercises on functions

This chapter contains some extra exercises on functions. In the end, practice makes perfect...



---

> ### {% icon hands_on %} Exercise 10.2.1
>
> Download [this matrix file](http://wiki.bits.vib.be/images/4/4e/Matrix.txt) (`Matrix.txt`) and save it in your directory. Then write a function to read a matrix file in this format, reorder the rows by the values in the given column, and printing out the result. The function should take as argument a file name and a column number. 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    > def sortMatrixByColumn(fileName,columnNumber):
>    >     #
>    >     # Read the tab-delimited file and store the values
>    >     #
>    >  
>    >     fin = open(fileName)
>    >     lines = fin.readlines()
>    >     fin.close()
>    >  
>    >     #
>    >     # Convert the data from the file into a Python list
>    >     #
>    >  
>    >     matrix = []
>    > 
>    >     for matrixRow in lines:
>    >         # Tab-delimited, so split line by \t - this will give a list of strings
>    >         matrixColumns = matrixRow.rstrip().split("\t") 
>    >  
>    >         # Add a row to the matrix
>    >         matrix.append([])
>    >  
>    >         # Add the columns, but convert the strings from the file into a float
>    >         for matrixValue in matrixColumns:
>    >             matrix[-1].append(float(matrixValue))
>    >  
>    >     #
>    >     # Now sort by column - but have to track the row number as well!
>    >     #
>    >  
>    >     selectedColumnValues = []
>    >  
>    >     for rowNumber in range(len(matrix)):
>    >  
>    >         selectedColumnValues.append((matrix[rowNumber][columnNumber],rowNumber))
>    >  
>    >         selectedColumnValues.sort()
>    >  
>    >     #
>    >     # Now print out the new matrix - the column value is now not interesting
>    >     # we want the row number!!
>    >     #
>    >  
>    >     for (columnValue,rowNumber) in selectedColumnValues:  
>    >         columnValueStrings = []
>    >         for value in matrix[rowNumber]:
>    >             columnValueStrings.append("{:.3f}".format(value))
>    >         print("\t".join(columnValueStrings))
>    >  
>    >  
>    > sortMatrixByColumn("data/matrix.txt",3)
>    >  ```
>    > </details>
>
{: .hands_on}
---



---

> ### {% icon hands_on %} Exercise 10.2.2
>
> 
> Modify the program to read in the TestFile.pdb file by using separate functions to 
> 1. get the title, 
> 2. dissect the information from the ATOM line and 
> 3. to calculate the distance to the reference distance
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    > def getTitle(line,cols):
>    >  
>    >     # Gets the title
>    >  
>    >     title = line.replace(cols[0],'')
>    >     title = title.strip()
>    >  
>    >     return ("The title is '%s'" % title)
>    >  
>    > def getAtomInfo(cols):
>    >  
>    >     # Get relevant information from an ATOM line and convert to the right type
>    >  
>    >     atomSerial = int(cols[1])
>    >     atomName = cols[2]
>    >     residueNumber = int(cols[5])
>    >     x = float(cols[6])
>    >     y = float(cols[7])
>    >     z = float(cols[8])
>    >  
>    >     return (atomSerial,atomName,residueNumber,x,y,z)
>    >  
>    > def calculateDistance(coordinate1,coordinate2):
>    >  
>    >     # Calculate the distance between two 3 dimensional coordinates
>    >  
>    >     return ((coordinate1[0] - coordinate2[0]) ** 2 + (coordinate1[1] - coordinate2[1]) ** 2 + (coordinate1[2] - coordinate2[2]) ** 2 ) ** 0.5
>    >  
>    > 
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
>    >  
>    >     line = line.strip()  # Remove starting and trailing spaces/tabs/newlines
>    >  
>    >     # Only do something if it's not an empty line
>    >     if line:
>    >         cols = line.split()   # Split the line by white spaces; depending on the format this could be commas, ...
>    >  
>    >         # Print off the title
>    >         if cols[0] == 'TITLE':
>    >             print(getTitle(line,cols))
>    >  
>    >         # Track the model number
>    >         elif cols[0] == 'MODEL':
>    >             modelNumber = int(cols[1])
>    >  
>    >         # For atom lines, calculate the distance
>    >         elif cols[0] == 'ATOM':
>    >             (atomSerial,atomName,residueNumber,x,y,z) = getAtomInfo(cols)
>    >  
>    >             # Calculate the distance
>    >             distance = calculateDistance((x,y,z),searchCoordinate)
>    >  
>    >             if distance < 2.0:
>    >                 print("Model {}, residue {}, atom {} (serial {}) is {:.2f} away from reference.".format(modelNumber,residueNumber,atomName,atomSerial,distance))
>    >  ```
>    > </details>
>
{: .hands_on}
---

