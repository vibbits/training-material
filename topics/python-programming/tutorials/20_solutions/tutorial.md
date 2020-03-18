---
layout: tutorial_hands_on

title: Solutions
questions:
- 
objectives:
- 
time_estimation: 20m
key_points:
- 
contributors:
- tmuylder

---




> ### {% icon hands_on %} Exercise 
>
> 
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    >  ```python
>    >  
>    >  ```
>    > </details>
>
{: .hands_on}

# Solutions




>    > 
>    > ### 7. Wrap-up exercise
>    > Write a program that does the following:
>    > 
>    > 1. Ask the user for a full DNA sequence
>    >     - Make sure the sequence contains only GACT
>    > 2. Once you have a valid sequence
>    >     - For each DNA fragment the user enters:
>    >         - Check if it occurs in the full sequence
>    >         - Print out the sequence position if so
>    >         - Track each fragment
>    >     - Keep on asking the user for DNA fragments, stop if they just press return
>    > 3. As a summary, print out all fragments with their position that you tracked
>    > 
>    > Tips to complete this exercise in case you get stuck.
>    > - Use while loops: you can use the condition to decide when to end the loop depending on the user input
>    > - Track the sequence fragment and position data using a list
>    > - Use string methods!
>    > - To check the full DNA sequence, you can count how many times each GACT letter occurs, add up these counts, and compare this value to the total length of the full DNA sequence
>    > 
>    > 
>    > ```python
>    > # This variable will be used for the while loop
>    > validSequence = False
>    >  
>    > # Keep on going as long as the DNA sequence is not valid
>    > while not validSequence:
>    >     # Get a string from the user
>    >     fullDnaSequence = input("Please enter your full DNA sequence:")
>    >     fullDnaSequence = fullDnaSequence.upper()
>    >     
>    >     # Count the GACT characters in the sequence
>    >     gactCount = 0
>    >     for code in 'GACT':
>    >         gactCount += fullDnaSequence.count(code)
>    >  
>    >     # Check if the number of GACT characters matches the full length of the sequence
>    >     # and set validSequence to True if so - this will stop the while: loop
>    >     if gactCount == len(fullDnaSequence):
>    >         validSequence = True
>    >     else:
>    >         print("\nInvalid sequence, only GACT allowed, try again!.\n")
>    > 
>    > # Print some line breaks
>    > print("\n\n")
>    >  
>    > # Prime the list to track the DNA fragments and the variable for the while loop
>    > dnaFragmentInfo = []
>    > dnaFragment = input("Please give a DNA fragment to check:")
>    >  
>    > while dnaFragment:
>    >     
>    >     # Check if present at all
>    >     dnaFragmentCount = fullDnaSequence.count(dnaFragment)
>    >     if dnaFragmentCount:
>    >         currentDnaSequenceIndex = 0
>    >         for i in range(dnaFragmentCount):        
>    >             # Equivalent to currentDnaSequenceIndex = currentDnaSequenceIndex + fullDna...
>    >             currentDnaSequenceIndex += fullDnaSequence[currentDnaSequenceIndex:].index(dnaFragment)
>    >  
>    >             print("\n  Fragment {} present at position {}.\n".format(dnaFragment,currentDnaSequenceIndex + 1))
>    >             dnaFragmentInfo.append((currentDnaSequenceIndex + 1,dnaFragment))
>    >             currentDnaSequenceIndex += 1
>    >     else:
>    >         print("\n  Fragment {} not present!\n".format(dnaFragment))
>    >  
>    >     dnaFragment = input("Please give a DNA fragment to check:")
>    > 
>    > # Print some line breaks
>    > print("\n\n")
>    > 
>    > # Print out the fragment information again, first sort it
>    > dnaFragmentInfo.sort()
>    > for (dnaFragmentPosition,dnaFragment) in dnaFragmentInfo:
>    >     print("Found {} at position {}".format(dnaFragment,dnaFragmentPosition))
>    > ```
>    > 
>    > ---
>    > ### 8.2.1 Exercise
>    > 
>    > Use a dictionary to track how many times each amino acid code appears in the following sequence:
>    > ```
>    > SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGISCKVTNIEGLLHKNNWNIED  
>    > NNIKNASLVQIDASNEQSSTSSSMIIDAQISNALNAQQYKVLIGNREWMIRNGLVINNDVNDFMTEHERKGRTAVLVAVDDELCGLIAIADT
>    > ```
>    > Tip: use the one-letter code as key in the dictionary, and the count as value.
>    > 
>    > ---
>    > 
>    > 
>    > ```python
>    > # Use a dictionary to track how many times each amino acid code appears in the following sequence:
>    > # >    > SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGISCKVTNIEGLLHKNNWNIEDNNIKNASLVQIDASNEQSSTSSSMIIDAQISNALNAQQYKVLIGNREWMIRNGLVINNDVNDFMTEHERKGRTAVLVAVDDELCGLIAIA>    > DT
>    > # Tip: use the one-letter code as key in the dictionary, and the count as value. 
>    > mySequence = >    > "SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGISCKVTNIEGLLHKNNWNIEDNNIKNASLVQIDASNEQSSTSSSMIIDAQISNALNAQQYKVLIGNREWMIRNGLVINNDVNDFMTEHERKGRTAVLVAVDDELCGLIAI>    > ADT"
>    >  
>    > # First way to do this, using sets (condensed)
>    > aminoAcidCount = {}
>    > myUniqueAminoAcids = set(mySequence)
>    > for aaCode in myUniqueAminoAcids:
>    >     print("Amino acid {} occurs {} times.".format(aaCode,mySequence.count(aaCode)))
>    >     aminoAcidCount[aaCode] = mySequence.count(aaCode)
>    > ```
>    > 
>    > 
>    > ```python
>    > # Another way to do this, a little bit more elaborate and using the myDictionary as a reference for iteration
>    > mySequence = >    > "SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGISCKVTNIEGLLHKNNWNIEDNNIKNASLVQIDASNEQSSTSSSMIIDAQISNALNAQQYKVLIGNREWMIRNGLVINNDVNDFMTEHERKGRTAVLVAVDDELCGLIAI>    > ADT"
>    > 
>    > myDictionary = {
>    >      'A': 'Ala',
>    >      'C': 'Cys',
>    >      'D': 'Asp',
>    >      'E': 'Glu',
>    >      'F': 'Phe',
>    >      'G': 'Gly',
>    >      'H': 'His',
>    >      'I': 'Ile',
>    >      'K': 'Lys',
>    >      'L': 'Leu',
>    >      'M': 'Met',
>    >      'N': 'Asn',
>    >      'P': 'Pro',
>    >      'Q': 'Gln',
>    >      'R': 'Arg',
>    >      'S': 'Ser',
>    >      'T': 'Thr',
>    >      'V': 'Val',
>    >      'W': 'Trp',
>    >      'Y': 'Tyr'}
>    > 
>    > lengthDict = len(myDictionary.keys())
>    > for aa in range(lengthDict):
>    >     aaCode = list(myDictionary.keys())[aa]
>    >     aaCount = mySequence.count(aaCode)
>    >     print("Amino acid {} occurs {} times.".format(aaCode,aaCount))
>    > ```
>    > 
>    > ----
>    > ### 9.3.1 Exercise
>    > Read in the file from the previous example, and write out all lines that contain 'VAL' to a new file.
>    > 
>    > ----
>    > 
>    > 
>    > ```python
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
>    > ```
>    > 
>    > 
>    > ```python
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
>    > ```
>    > 
>    > 
>    > ```python
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
>    > ```
>    > 
>    > ## 9.4 Advanced file reading and interpretation exercise 
>    > Read in the TestFile.pdb atom coordinate file, print out the title of the file, and find all atoms that have coordinates closer than 2 angstrom to the (x,y,z) coordinate (-8.7,-7.7,4.>    > 7). Print out the model number, residue number, atom name and atom serial for each; the model is indicated by:
>    > ```
>    > MODEL     1
>    > ```
>    > lines, the atom coordinate information is in:
>    > ```
>    > ATOM      1  N   ASP A   1     -10.341  -9.922   9.398  1.00  0.00           N
>    > ```
>    > lines, where column 1 is always ATOM, column 2 is the atom serial,  column 3 the atom name, column 4 the residue name, column 5 the chain code, column 6 the residue number, followed >    > by the x, y and z coordinates in angstrom in columns 7, 8 and 9.
>    > 
>    > Note that the distance between two coordinates is calculated as the square root of (x1-x2)²+(y1-y2)²+(z1-z2)².
>    > 
>    > 
>    > ```python
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
>    > ```
>    > 
>    > ---
>    > ### 10.2.1 Exercise
>    > 
>    > The Hamming distance between two strings of equal length is the number of positions at which the corresponding character are different. In a more general context, the Hamming >    > distance is one of several string metrics for measuring the edit distance between two sequences. 
>    > 
>    > The Hamming distance between:
>    > 
>    > "karolin" and "kathrin" is 3.
>    > 
>    > Write a function called "hamming_distance" which accepts two strings and raises an error if the lengths are unequal. Furthermore the function will return an integer that represents >    > the number of mismatches between the two sequences. 
>    > 
>    > ---
>    > 
>    > 
>    > ```python
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
>    > ```
>    > 
>    > ---
>    > ### 10.2.2 Exercise
>    > 
>    > Write a function that calculates the GC content of the sequence in a fasta file. For this example you can use [this fasta file](data/gene.fa) which contains the genetic sequence of a >    > bone gla protein. The function must accept a fasta file as input file and will print the following:
>    > 
>    > ```
>    > The GC content of HSBGPG Human gene for bone gla protein (BGP) is	 63.53%
>    > ```
>    > 
>    > The method [.startswith()](https://www.tutorialspoint.com/python/string_startswith.html) might help. The function should read the lines of the fasta file and if it starts with a '>' >    > define the text that comes afterwards as the sequence ID. The other lines are part of the sequence. After reading through the lines, you can easily define the GC content by counting >    > the bases and taking the average. 
>    > 
>    > ---
>    > 
>    > 
>    > ```python
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
>    > ```
>    > 
>    > 
>    > ```python
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
>    > ```
>    > 
>    > ---
>    > ### 10.2.1 Exercises
>    > 
>    > Download [this matrix file](data/Matrix.txt) (`Matrix.txt`) and save it in your directory. Then write a function to read a matrix file in this format, reorder the rows by the values >    > in the given column, and printing out the result. The function should take as argument a file name and a column number. 
>    > 
>    > ---
>    > 
>    > 
>    > ```python
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
>    > ```
>    > 
>    > ---
>    > ### 10.2.2 Exercises
>    > 
>    > Modify the program to read in the TestFile.pdb file by using separate functions to 
>    > 1. get the title, 
>    > 2. dissect the information from the ATOM line and 
>    > 3. to calculate the distance to the reference distance
>    > 
>    > ---
>    > 
>    > 
>    > ```python
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
>    > ```
>    > 
>    > Compared to the original program it is much easier to see what is going on here. Also, the calculateDistance() function is relevant for any other piece of code where you want to >    > calculate distances between two 3D coordinates - it's not embedded in this bit of code any more and is useful anywhere that you need to do this.
>    > 
>    > 
>    > ---
>    > ### 11.4.1 Exercises
>    > 
>    > Make a new directory in which you write out 5 files with a 2 second delay. Each file should contain the date and time when it was originally written out.
>    > 
>    > ---
>    > 
>    > 
>    > 
>    > ```python
>    > # 1
>    > import time, os
>    >  
>    > 
>    > # Create a variable for the directory name
>    > myDir = "timeTest"
>    > 
>    > # Check whether the directory exists, if not create it
>    > if not os.path.exists(myDir):
>    >     os.mkdir(myDir)
>    > 
>    > 
>    > # Loop from 1 to 5
>    > for i in range(1,6):
>    > 
>    >     # Get the current time
>    >     currentTime = time.ctime()
>    > 
>    >     # Write out the file - use i to give a different name to each
>    >     filePath = os.path.join(myDir,"myFile{}.txt".format(i))
>    > 
>    >     outFileHandle = open(filePath,'w')    
>    >     outFileHandle.write("{}\n".format(currentTime))
>    >     outFileHandle.close()
>    > 
>    >     print("Written file {}...".format(filePath))
>    > 
>    >     # Sleep for 2 seconds
>    >     time.sleep(2)
>    > ```
>    > 
>    > ---
>    > ### 11.4.2 Exercises
>    > 
>    > Write a function to read in a FASTA file with an RNA sequence and return the RNA sequence (in 3 base unit chunks).
>    > 
>    > ---
>    > 
>    > 
>    > ```python
>    > # 2 
>    > import os
>    >  
>    > def readRnaFastaFile(fileName):
>    >  
>    >     if not os.path.exists(fileName):
>    >         print("Error: File {} not available!".format(fileName))
>    >         return (None,None,None)
>    > 
>    >     fconnect = open(fileName)
>    >     lines = fconnect.readlines()
>    >     fconnect.close()
>    > 
>    >     sequenceInfo = []
>    >     moleculeName = None
>    >     description = None
>    > 
>    >     # Get information from the first line - ignore the >
>    >     firstLine = lines[0]
>    >     firstLineCols = firstLine[1:].split()
>    >     moleculeName = firstLineCols[0]
>    >     description = firstLine[1:].replace(moleculeName,'').strip()
>    > 
>    >     # Now get the full sequence out
>    >     fullSequence = ""
>    >     for line in lines[1:]:
>    > 
>    >         line = line.strip()
>    >         fullSequence += line
>    > 
>    >     # Divide up the sequence depending on type (amino acid or nucleic acid)
>    >     for seqIndex in range(0,len(fullSequence),3):
>    >         sequenceInfo.append(fullSequence[seqIndex:seqIndex+3])
>    > 
>    >     return (moleculeName,description,sequenceInfo)
>    > 
>    > 
>    > print(readRnaFastaFile("data/rnaSeq.txt"))
>    > ```
>    > 
>    > ---
>    > ### 11.4.3 Exercises
>    > 
>    > Write a program where you ask the user for a one-letter amino acid sequence, and print out the three-letter amino acid codes. Download the dictionary from section 8.2 and save it as >    > a module named SequenceDicts.py first.
>    > 
>    > ---
>    > 
>    > 
>    > ```python
>    > # 3
>    > # Note how you can import a function (or variable) with a different name for your program!
>    > 
>    > from modules.SequenceDicts import proteinOneToThree as oneToThreeLetterCodes
>    > 
>    > oneLetterSeq = input('Give one letter sequence:')
>    >  
>    > if oneLetterSeq:
>    >     for oneLetterCode in oneLetterSeq:
>    >         if oneLetterCode in oneToThreeLetterCodes.keys():
>    >             print(oneToThreeLetterCodes[oneLetterCode])
>    >         else:
>    >             print("One letter code '{}' is not a valid amino acid code!".format(oneLetterCode))
>    > else:
>    >     print("You didn't give me any information!")
>    > ```
>    > 
>    > ---
>    > ### 11.4.4 Exercises
>    > 
>    > Write a program where you translate the RNA sequence `data/rnaSeq.txt` into 3 letter amino acid codes. Use the dictionary from section 8.2 (called myDictionary) and save it as a >    > module named SequenceDicts.py first. You can use the `readFasta.py` module from the modules folder. 
>    > 
>    > ---
>    > 
>    > 
>    > ```python
>    > from modules.SequenceDicts import standardRnaToProtein, proteinOneToThree
>    > 
>    > from modules.readFasta import readRnaFastaFile
>    > 
>    > (molName,description,sequenceInfo) = readRnaFastaFile("data/rnaSeq.txt")
>    > proteinThreeLetterSeq = []
>    > 
>    > for rnaCodon in sequenceInfo:
>    > 
>    >     aaOneLetterCode = standardRnaToProtein[rnaCodon]
>    >     aaThreeLetterCode = proteinOneToThree[aaOneLetterCode]
>    >     proteinThreeLetterSeq.append(aaThreeLetterCode)
>    > 
>    > print(proteinThreeLetterSeq)
>    > ```
>    > 
>    > ---
>    > ### 11.4.5 Exercises
>    > 
>    > Write a program that:
>    > - Has a function `readSampleInformationFile()` to read the information from this sample data file into a dictionary. Also check whether the file exists.
>    > - Has a function `getSampleIdsForValueRange()` that can extract sample IDs from this dictionary. Print the sample IDs for pH 6.0-7.0, temperature 280-290 and volume 200-220 using >    > this function.
>    > 
>    > ---
>    > 
>    > 
>    > ```python
>    > import os
>    >  
>    > def readSampleInformationFile(fileName):
>    >  
>    >     # Read in the sample information file in .csv (comma-delimited) format
>    > 
>    >     # Doublecheck if file exists
>    >     if not os.path.exists(fileName):
>    >         print("File {} does not exist!".format(fileName))
>    >         return None
>    >  
>    >     # Open the file and read the information
>    >     fileHandle = open(fileName)
>    >     lines = fileHandle.readlines()
>    >     fileHandle.close()
>    > 
>    >     # Now read the information. The first line has the header information which
>    >     # we are going to use to create the dictionary!
>    > 
>    >     fileInfoDict = {}
>    > 
>    >     headerCols = lines[0].strip().split(',')
>    > 
>    >     # Now read in the information, use the first column as the key for the dictionary
>    >     # Note that you could organise this differently by creating a dictionary with
>    >     # the header names as keys, then a list of the values for each of the columns.
>    > 
>    >     for line in lines[1:]:
>    >  
>    >         line = line.strip()  # Remove newline characters
>    >         cols = line.split(',')
>    > 
>    >         sampleId = int(cols[0])
>    > 
>    >         fileInfoDict[sampleId] = {}
>    > 
>    >         # Don't use the first column, is already the key!
>    >         for i in range(1,len(headerCols)):
>    >             valueName = headerCols[i]
>    >  
>    >             value = cols[i]
>    >             if valueName in ('pH','temperature','volume'):
>    >                 value = float(value)
>    > 
>    >             fileInfoDict[sampleId][valueName] = value
>    > 
>    >     # Return the dictionary with the file information
>    >     return fileInfoDict
>    > 
>    > def getSampleIdsForValueRange(fileInfoDict,valueName,lowValue,highValue):
>    >  
>    >     # Return the sample IDs that fit within the given value range for a kind of value
>    >  
>    >     #sampleIdList = fileInfoDict.keys()
>    >     #sampleIdList.sort()
>    >     sampleIdList = sorted(fileInfoDict.keys())
>    >     sampleIdsFound = []
>    > 
>    >     for sampleId in sampleIdList:
>    > 
>    >         currentValue = fileInfoDict[sampleId][valueName]
>    >  
>    >         if lowValue <= currentValue <= highValue:
>    >             sampleIdsFound.append(sampleId)
>    >  
>    >     return sampleIdsFound
>    >  
>    > if __name__ == '__main__':
>    >  
>    >     fileInfoDict = readSampleInformationFile("../data/SampleInfo.txt")
>    > 
>    >     print(getSampleIdsForValueRange(fileInfoDict,'pH',6.0,7.0))
>    >     print(getSampleIdsForValueRange(fileInfoDict,'temperature',280,290))
>    >     print(getSampleIdsForValueRange(fileInfoDict,'volume',200,220))
>    > ```
