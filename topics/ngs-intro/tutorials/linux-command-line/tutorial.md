---
layout: tutorial_hands_on

title: "04 Linux command line"
zenodo_link: "https://data.bits.vib.be/pub/trainingen/PSA/"
questions:
  - "Download the data from GEO or ENA"
objectives:
  - "Basic knowledge of downloading data from GEO or ENA"
time_estimation: "15m"
key_points:
  - "SRA ID"
  - "GEO"
  - "ENA"
contributors:
  - janick-bits
---

### Your first command

> Print the word hello to the screen

```
echo hello
```
> Print the sentence “hello my friends to the screen (with open quotation and without end quotation)
Remember you can use the up arrow to go back to previously typed commands 
```
echo "hello my friends
```
Now the terminal hangs. We typed an incorrect command and the terminal does not know what to do. 

> What to type when the terminal hangs ?

Ctrl-C
If **Ctrl-C** fails, try hitting **ESC**. In most of the cases, this will do the trick.

> Open the manual of the echo command ?

```
man echo
```
The synopsis of this command is:
```
echo [-n] [string ...]
```

Things in between square brackets are optional, so it means that you can use echo without options and arguments.

When the manual page is longer than the terminal, you can scroll down the page one line at a time by pressing the down arrow key, or one page at a time by pressing the spacebar. To exit the man page, press **q** (for quit).

The manual explains that echo prints its argument by default to the screen and then puts the prompt on a new line. The way it does this is by appending a character called a newline (a special character that literally puts the text on a new line). Because echo is often used in programs to print out a sequence of strings not separated by newlines, there is an option to prevent the newline from being inserted.

> By reading the man page, find the command to print hello without a newline, and verify that it works as expected.
Again remember to use the up arrow to go to previously typed commands.
```
echo -n hello
```

> Open the manual of the sleep command, find how to make the terminal “sleep” for 5 seconds, and execute the command.
 
```
man sleep
```
According to the manual sleep has a required argument called number representing the number of seconds to sleep.
```
sleep 5
```
> Make the terminal sleep for 5000 seconds and rescue the terminal.
 
```
sleep 5000
```
That’s more than an hour so use Ctrl-C to break off the command.

### Navigating the Linux file system

Type the following command in the terminal:
```
cd
```
cd stands for change directory and is used for navigating the Linux file system

> Which directory are you in ?
To view the name of the current working directory, type
```
pwd
```
pwd stands for print working directory.
You see that using cd without arguments leads you to your home directory, on the BITS laptops this is /home/bits.
> Which directories are located in your home directory ?
To view a list of the files and directories that are located in the current working directory, type
```
ls
```
ls stands for **list** and is used for listing all files and directories in the current directory. 
On the BITS laptops the home directory **/home/bits** contains a set of folders like Desktop, Documents, Downloads...

> List all files and directories in your home directory that start with the letter D

```
ls D*
```
D(star) means everything which name starts with a **D**

A common pattern when using the command line is changing directories using **cd** and then immediately typing **ls** to view the contents of the directory.
> List the detailed content of your home directory ?

```
ls -l
```
the l in -l stands for **long output**. 
Among others, the detailed list shows a date and time indicating the last time a file was modified. The number before the date is the size of the file in bytes.
> List the content of the /usr/local/bin directory ?

```
ls /usr/local/bin
```
/usr/local/bin corresponds to a directory in the file system (/), with bin a subdirectory of local and local a subdirectory of usr.

If you have to reuse a variable often then it can be helpful to create a name for a variable, especially when the variable is long. Suppose you want to work in a directory called **Illumina_exp4_20042004_mapping_to_hg19_results**. To avoid repeating this long name over and over you can create a variable for it, give it a short name and use that in your commands. 

> Name the variable **folder**

Use the following command: ```folder=Illumina_exp4_20042004_mapping_to_hg19_results```

To create a new directory use the **mkdir** (make directory) command.

> Create the folder using the newly created variable

If you want to refer to a named variable in a command you have to preceed the name by a **$** sign to indicate that what is following is a **reference** to a variable.
So use the following command: ```mkdir ${folder}```
The curly braces delineate the start and end of the variable name.
Check if the folder is created using the **ls** command.

{{Wiki-img|NGS/Intro/CL3.png|500px}}
To remove a directory, use the **rm** (remove) command. You could use **rmdir** but this only works on empty folders. To remove a folder with the rm command you need to use the **-r** option. This stands for **recursively** which means it will remove the folder and its complete content. 

> Remove the Illumina_exp4_20042004_mapping_to_hg19_results directory.

Use the variable as an argument of the rm command:
```
rm -r ${folder}
```
Check if it's removed using the **ls** command.
Now navigate to the **NGS** folder which is located in the **/home/bits/** folder.

> Navigate to this location.
Since you want to navigate, you need to use the **cd** command. Since the NGS folder is located in the folder that you are currently in, you can simply give the name of the folder (NGS) as an argument:
```cd NGS```
If you want to move to a folder that's located in another location of the file system, you have to give the full path to the folder.

> Go to the **/usr/bin** folder
```cd /usr/bin```
> Go back to your home folder
```cd```

### Manipulating files

Even without a text editor, there are ways to create a file with text using the redirect operator **>**

> Create a file called test1.txt containing the text "Why do bioinformaticians work on the command line?" using echo

```
echo "Why do bioinformaticians work on the command line?" > test1.txt
```
The redirect operator > takes the text output of echo and redirects its contents to a file called test1.txt
> Check if it worked by viewing the content of the file on the screen
```
cat test1.txt
```
The name cat is short for “concatenate”. The command can be used to combine the contents of multiple files, but we use it here to dump the content of a single file to the screen. Cat is as a “quick-and-dirty” way to view the content of a file, less is a neater way. 
> Add the line "Because they don't want to scare you with huge amounts of data!" to the file and check if it worked
To add lines of text to a file, use the append operator **>>**:
```
echo "Because they don't want to scare you with huge amounts of data!" >> test1.txt
cat test1.txt
```
The append operator >> appends the text output of echo to the file test1.txt

> Create an empty file called test2.txt and check if it exists
To create an empty file, use the **touch** command:
```
touch test2.txt
ls
```
> List the names of all text files in your current directory

```
ls *.txt
```
Here *.txt automatically expands to all filenames that match the pattern “any string followed by .txt”.
> Rename the file test2.txt to test_partII.txt using mv and check if it worked
To rename a file use the mv command, short for **move**:
```
mv test2.txt test_partII.txt
ls *.txt
```
> Copy the file test_partII.txt to test2.txt and check if it worked
To copy a file use the cp command, short for **copy**:
```
cp test_partII.txt test2.txt
ls *.txt
```
You don't have to type out test_partII.txt, instead you can type something like test_-Tab thereby making use of tab completion. Tab completion involves automatically completing a word if there’s only one valid match on the system. For example, if the only file starting with the letters “test_” is test_partII.txt, test_-Tab refers to test_partII.txt
Especially with longer names, tab completion can save a huge amount of typing.

> Remove the file test_partII.txt and check if it worked
To remove a file use the rm command, short for **remove**:
```
rm test_partII.txt
ls *.txt
```
Download the file called exams.txt, containing the results of the spelling and maths exams of all 10-year olds of a school, into your home folder. Use wget to download the file from http://data.bits.vib.be/pub/trainingen/NGSIntro/exams.txt

> Download the file.
```
wget http://data.bits.vib.be/pub/trainingen/NGSIntro/exams.txt
```


> Show the first 10 lines of the file.
```
head exams.txt
```
Two complementary commands for inspecting files are head and tail, which allow to view the beginning (head) and end (tail) of a file. The head command shows the first 10 lines of a file.

> Show the last 10 lines of the file.
Similarly, tail shows the last 10 lines of a file.
```
tail exams.txt
```
Open the manual of head to check out the options of head. Learn how to look at the first n lines of the file. 

> Save the first 30 lines of exams.txt in a file called test.txt
```
head -n 30 exams.txt > test.txt
```
> Look at test.txt using the less command
```
less test.txt
```
There are many commands to look at the full content of a file. The oldest of these programs is called **more**, and the more recent and powerful variant is called **less**. Less lets you navigate through the file in several ways, such as moving one line up or down with the arrow keys, pressing space bar to move a page down... Perhaps the most powerful aspect of less is the forward slash key /, which lets you search through the file from beginning to end. 

> Search for Jasper in test.txt
The way to do this in less is to type /Jasper
The last three essential less commands are G to move to the end of the file and 1G to move back to the beginning. To quit less, type **q** (for quit).

> Look at the last 10 lines of the first 20 lines of exams.txt
```
head -n 20 exams.txt | tail 
```
The command runs head -n 20 exams.txt and then pipes the result through tail using the pipe symbol **|** 

The reason the pipe works is that the tail command, in addition to taking a filename as an argument, can take input from “standard in”, which in this case is the output of the command before the pipe. The tail program takes this input and processes it the same way it processes a file.

### Running tools

Bioinformatics tools are just commands on the commands line. You use them in exactly the same way as all the commands we have run up to now, by defining options and arguments. A list of options and arguments can be found in the help file. 

#### Installing and running sl

We have seen **ls** the list command and use it frequently to view the contents of a folder but because of miss-typing sometimes you would result in **sl**, how about getting a little fun in the terminal and not **command not found**. This is a general linux command, you can install it from a repository. 

> Install sl
For installing you need superuser privileges !
```
sudo apt-get install sl
```
> Find out in the manual what sl stands for

```
man sl
```
You can find the solution in the **description** section of the manual.
> run the command

```
sl
```
:o)
Try out some of the options !!

#### Running blastp
In the folder /home/bits/Linux/ you find a file called [http://data.bits.vib.be/pub/trainingen/NGSIntro/sprot.fasta sprot.fasta] containing a set of protein sequences. We will use this file as a database for blast. The query sequence is the following: 
```
MLLFAPCGCNNLIVEIGQRCCRFSCKNTPCPMVHNITAKVTNRTKYPKHLKEVYDVLGGSAAWE
```

> Create a fasta file containing the query sequence using echo called seq.fasta

```
echo ">query seq" > seq.fasta
cat seq.fasta
echo MLLFAPCGCNNLIVEIGQRCCRFSCKNTPCPMVHNITAKVTNRTKYPKHLKEVYDVLGGSAAWE >> seq.fasta
cat seq.fasta
```
Blast can be done via the [https://blast.ncbi.nlm.nih.gov/Blast.cgi blast website], but you can also download the blast tool and run it locally (on your computer) via the command line. For instance if you want to blast against you own database of sequences, you have to do it locally. Blast has been installed on the bits laptops.

First you have transform your own database (the sprot.fasta file in our case) into a database that can be searched by blast using the **makeblastdb** command.

> Look at the help file of makeblastdb and find the options to define the input fasta file and the database type

```
makeblastdb -help
```
You have to define the input fasta file using the -in option and the type of sequences using the -dbtype option
> Create the blast database

```
makeblastdb -in sprot.fasta -dbtype prot
```
Now you can perform a blastp search using the **blastp** command. Write the results to a tabular text file with comments called output.txt

> Look at the help file of blastp and find the options to define input, database, output and output format

```
blastp -help
```
You need the -query, the -db, the -out and the -outfmt option
> Perform the blast and open the results with less

```
blastp -query seq.fasta -db sprot.fasta -out output.txt -outfmt 7
less output.txt
```

#### Running cutadapt

In this exercise we'll do some real NGS analysis on the SRR074262.fastq file that is stored in folder /home/bits/NGS/Intro. 

> Go to this folder and look at the 10 first lines of the file.

```
cd /home/bits/NGS/Intro
head SRR0474262.fastq
```
This data sets contain a high number of adapter sequences. These are reads that consist solely or partly of adapter sequence. You have to remove this adapter contamination using command line tools like [https://code.google.com/p/cutadapt/ cutadapt]. This tool is installed on the bits laptops. It is not a regular bash command (it's a python program) so it doesn't have a manual but it does have a help file.

> Check the help file of cutadapt for the option to define the adapter sequence and trim at the 3'ends of the reads.
To open the cutadapt help file type:
```
cutadapt -h
```
The **-a** option trims adapter sequences at the 3' end of the reads. 
At the top of the help file you see that the standard usage of the command is:
```
cutadapt -a ADAPTER -o output.fastq input.fastq
```
The sequence of the adapter is GATCGGAAGAGCTCGTATGCCGTCTTCTGCTTGAAA

> Trim the adapter sequence and store the trimmed sequences in a file called SRR074262trim.fastq
Go to the folder where the input file is located and type:
```
cutadapt -a GATCGGAAGAGCTCGTATGCCGTCTTCTGCTTGAAA -o SRR074262trim.fastq SRR074262.fastq
```
> Look at the first lines of the trimmed file
Go to the folder where the input file is located and type:
```
head SRR0474262trim.fastq
```

#### Running Picard

The trimmed fastq file is subsequently mapped resulting in a bam file that you can download from http://data.bits.vib.be/pub/trainingen/NGSIntro/1271011_reads.pair.1.list.accepted_hits.bam 

> Download the file via the command line

```
wget http://data.bits.vib.be/pub/trainingen/NGSIntro/1271011_reads.pair.1.list.accepted_hits.bam
```
> Rename the file SRR074262.bam
Remember to use tab autocompletion !
```
mv 1271011_reads.pair.1.list.accepted_hits.bam SRR074262.bam
```
This is a raw unsorted bam file, if we want to visualize the mapping results in IGV, we need to sort and index the file. We can do the sorting using one of [http://broadinstitute.github.io/picard/ the Picard tools], called SortSam. Picard can be downloaded from https://github.com/broadinstitute/picard/releases/download/2.8.2/picard-2.8.2.jar

> Download the file
Remember to use tab autocompletion !
```
wget https://github.com/broadinstitute/picard/releases/download/2.8.2/picard-2.8.2.jar
ll
```
For the tools to run properly, you must have Java 1.8 installed. To check your java version run the following command:
```
java -version
```
Running Java tools from the command line requires a special syntax: you have to start the command with **java** and then the name of the java tool and its options and arguments.

Java jar-files are archives of multiple java files (similar to tar archives of multiple regular files). They require an even more elaborate syntax. You have to start the command with **java -jar** and then the name of the jar file and its options and arguments. As you can see the picard tools come as a jar-file.

> Test the installation by opening the help file

```
java -jar picard-2.8.2.jar -h 
```
Bam files are enormous files that are hard to search through. The order of the reads in a bam file is the same as in the original fastq file. However, if you want to visualize the mapping results or if you want to calculate mapping statistics it's much more efficient to sort the reads according to genomic location. This can be achieved with the SortSam tool. Look in [https://broadinstitute.github.io/picard/command-line-overview.html the picard documentation] for the SortSam tool.

> Sort the bam file to SRR074262sorted.bam
Remember to use tab autocompletion !
```
java -jar picard-2.8.2.jar SortSam \
      I=SRR074262.bam \
      O=SRR074262sorted.bam \
      SORT_ORDER=coordinate
```
Bam files contain duplicate reads unless you removed them during the quality control step. MarkDuplicates locates and tags duplicate reads in a bam or sam file. Duplicate reads originate from the same fragment and were typically introduced during library construction using PCR. Duplicate reads can also result from a single cluster on the flow cell, incorrectly detected as multiple clusters by the optical sensor of the sequencing instrument.
MarkDuplicates compares sequences of reads and detects duplicates. The tool's output is a new SAM or BAM file, in which duplicates have been identified in the SAM flags field. If needed, duplicates can be removed using the REMOVE_DUPLICATE and REMOVE_SEQUENCING_DUPLICATES options. (See  [https://broadinstitute.github.io/picard/command-line-overview.html#MarkDuplicates the Picard documentation] for more details).

> Remove duplicates from the sorted bam file
Remember to use tab autocompletion !
```
java -jar picard.jar MarkDuplicates \
      I=SRR074262sorted.bam \
      O=SRR074262sortednodup.bam \
      M=marked_dup_metrics.txt \
      REMOVE_DUPLICATES=true
```
For visualization and easy access you can build an index to the bam file using BuildBamIndex. Look in [https://broadinstitute.github.io/picard/command-line-overview.html the picard documentation] for the BuildBam Index tool.

> Build the bai file for SRR074262sortednodup.bam
Remember to use tab autocompletion !
```
java -jar picard-2.8.2.jar BuildBamIndex \
      I=SRR074262sortednodup.bam 
```
Check if the files were generated.

### File compression

> Compress the SRR074262.bam file to .gz format
Remember to use tab autocompletion !
```
gzip SRR074262.bam
ll
```
> and unzip it again
Remember to use tab autocompletion !
```
gunzip SRR074262.bam.gz
ll
```

### Writing scripts

#### Writing and executing bash scripts

We are going to make additions to the bash script you find below:
```
#this program pretends to hack sites
!Define a variable str equal to " 0  1  23  45  6 789"
clear
!Print to screen: "hacking www.bits.vib.be"
!Do nothing for 2 seconds
!Print to screen: "Server hacking module is loading"
!Do nothing for 2 seconds
!Print to screen: "Hack module is starting in 2 seconds"
!Do nothing for 1 second
!Print to screen: "1 second"
!Do nothing for 1 second
ping -c 3 www.bits.vib.be
!Do nothing for 1 second
netstat
!Do nothing for 1 second
for i in {1..1000}
do
number1=$RANDOM
let "number1 %= ${#str}"
number2=$RANDOM
let "number2 %=4"
!Print to screen without newlines and with backslash escapes: "\033[1m${str:number1:1}\033[0m"
done
!Print to screen: "453572345763425834756376534"
!Do nothing for 3 seconds
!Print to screen: "www.bits.vib.be succesfully hacked!"
!Print to screen: "PASSWORD ACCEPTED: token is 453572345763425834756376534"
```

Open gedit and paste the code.

> Replace all lines that start with ! by the appropriate command

```
#this program pretends to hack sites
str=" 0  1  23  45  6 789"
clear
echo "hacking www.bits.vib.be"
sleep 2
echo "Server hacking module is loading"
sleep 2
echo "Hack module is starting in 2 seconds"
sleep 1
echo "1 second"
sleep 1
ping -c 3 www.bits.vib.be
sleep 2
netstat
sleep 1
for i in {1..1000}
do
number1=$RANDOM
let "number1 %= ${#str}"
number2=$RANDOM
let "number2 %=4"
echo -n -e "\033[1m${str:number1:1}\033[0m"
done
echo "453572345763425834756376534"
sleep 3
echo "www.bits.vib.be succesfully hacked!"
echo "PASSWORD ACCEPTED: token is 453572345763425834756376534"
```. 
> Add a shebang line to the top of the script

```
#!/usr/bin/env bash
#this program pretends to hack sites
str=" 0  1  23  45  6 789"
clear
...
``` 
Save the script as HackIt.sh

> If necessary make executable

```
chmod 755 HackIt.sh
```
> Run the script

```
bash HackIt.sh
```
What if you want to "hack" another website ? The easiest way to do allow for this is to enable to give the url as an argument of the bash command so that's what we'll do.

Reopen the file in gedit

> Replace www.bits.vib.be by $1

```
#!/usr/bin/env bash
#this program pretends to hack sites
str=" 0  1  23  45  6 789"
clear
echo "hacking $1"
sleep 2
echo "Server hacking module is loading"
sleep 2
echo "Hack module is starting in 2 seconds"
sleep 1
echo "1 second"
sleep 1
ping -c 3 $1
sleep 2
netstat
sleep 1
for i in {1..1000}
do
number1=$RANDOM
let "number1 %= ${#str}"
number2=$RANDOM
let "number2 %=4"
echo -n -e "\033[1m${str:number1:1}\033[0m"
done
echo "453572345763425834756376534"
sleep 3
echo "$1 succesfully hacked!"
echo "PASSWORD ACCEPTED: token is 453572345763425834756376534"
``` 
> Save and run the script again now giving www.kuleuven.be as an argument 

```
bash HackIt.sh www.kuleuven.be
```
$1 refers to the first argument of the command. If you have two arguments you use $1 and $2 to represent them.

#### Writing and executing Perl scripts

We are going to create and the perl script you find below:
```
#This program predicts if a sequence is protein, nucleic acid or rubbish
$seq = $ARGV[0];
if ($seq =~ /[JO]/) {
  print "is not a sequence, first illegal character is $&\n";
} elsif ($seq =~ /[EFILPQZ]/) {
  print "is protein\n";
} else {
  print "is nucleic acid\n";
}
```

Open gedit and paste the code.

> Add a shebang line to the top of the script

```
#!/usr/bin/env perl
#This program predicts if a sequence is protein, nucleic acid or rubbish
$seq = $ARGV[0];
if ($seq =~ /[JO]/) {
...
``` 
Save the script as SeqIt.pl

> If necessary make executable

```
chmod 755 SeqIt.pl
```
> Run the script using your first name in capitals as an argument

```
perl SeqIt.pl JANICK
```

#### Writing and executing Python scripts

We are going to make additions to the python script you find below:
```
#This program counts the number of amino acids in a protein sequence
!Define variable mySequence equal to "SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGI"
!Create a set myUniqueAminoAcids out of mySequence
for aaCode in myUniqueAminoAcids:
  !Print to screen, use format to fill in the values: "Amino acid {} occurs {} times."
```

Open gedit and paste the code.

> Replace all lines that start with ! by the appropriate command

```
#This program counts the number of amino acids in a protein sequence
mySequence = "SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGI"
myUniqueAminoAcids = set(mySequence)
for aaCode in myUniqueAminoAcids:
  print("Amino acid {} occurs {} times.".format(aaCode,mySequence.count(aaCode)))
```
> Add a shebang line to the top of the script

```
#!/usr/bin/env python
#This program counts the number of amino acids in a protein sequence
mySequence = "SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGI"
myUniqueAminoAcids = set(mySequence)
...
``` 
Save the script as CountIt.py

> If necessary make executable

```
chmod 755 CountIt.py
```
> Run the script

```
python CountIt.py
```
What if you want to "count" another protein ? The easiest way to do allow for this is to enable to give the sequence as an argument of the python command so that's what we'll do.

Reopen the file in gedit

> Adjust the code to read the first argument of the python command using the sys library

```
!#/usr/bin/env python
#This program counts the number of amino acids in a protein sequence
import sys
mySequence = sys.argv[1]
myUniqueAminoAcids = set(mySequence)
for aaCode in myUniqueAminoAcids:
  print("Amino acid {} occurs {} times.".format(aaCode,mySequence.count(aaCode)))
``` 
> Save and run the script again now giving QWEERTIPSDFFFGHKKKKLLLLLLLLLLLLLL as an argument 

```
python CountIt.py QWEERTIPSDFFFGHKKKKLLLLLLLLLLLLLL
```

sys.argv[1] refers to the first argument of the command. If you have two arguments you use sys.argv[1] and sys.argv[2] to represent them.

#### Installing and using Python tools

Installing Python-based tools is not done with apt-get, instead the comand pip is used. If pip is not yet installed, the terminal will show an error message saying that pip is currently not installed. You can install pip using apt-get.

As an example we will install Biopython, a Python library for bioinformatics. See [http://biopython.org/wiki/Download the documentation] for more details. 

> Install biopython 

You need superuser privileges for this
```
sudo pip install biopython
```
We will write a small python script to check if Biopython was successfully installed. In the folder /home/bits/Linux/ you find a file called [http://data.bits.vib.be/pub/trainingen/NGSIntro/sprot.fasta sprot.fasta] containing a set of protein sequences that we will use as input. Move to the folder containing the file.

We will use SeqIO module of Biopython to parse the fasta file with the protein sequences. Check out [http://biopython.org/wiki/SeqIO the tutorial of the module].

```
!Import the SeqIO module of the Bio library
!For every record in the sprot.fasta file do:
!Print the id of the seq_record to the screen
!Print the length of the sequence to the screen
```

Open gedit and paste the code.

> Replace all lines that start with ! by the appropriate command

```
from Bio import SeqIO
for seq_record in SeqIO.parse("sprot.fasta","fasta"):
     print(seq_record.id)
     print(len(seq_record))
```
> Add a shebang line to the top of the script

```
#!/usr/bin/env python
from Bio import SeqIO
for seq_record in SeqIO.parse("sprot.fasta","fasta"):
...
``` 
Save the script as ParseIt.py in the folder that contains the input file.

> If necessary make executable

```
chmod 755 ParseIt.py
```
> Run the script

```
python ParseIt.py
```

### Compressing and decompressing files

Some files or tools come in **.zip** format, how to decompress them ? 

In the **/usr/bin/tools** folder you can find the zipped version of the FastQC tool. To unzip it, you have to use the **unzip** command.

The **/usr/bin/** folder belongs to the root user, not to the bits user. Therefore only root is allowed to do manipulations in this folder. Switch to root using the **su** command or type **sudo** in front of your commands. The system will ask for the password: bitstraining on the BITS laptops. 

> Decompress the FastQC tool with unzip.
First look at the unzip manual to get an idea about the working of the command. 
```man unzip```
To unzip the file you can use the simple command: ```unzip name_of_the_zip_file```. Remember to use tab autocompletion.
This will generate a folder called FastQC in /usr/bin/tools.
After decompression use **ls** and **cd** to take a look at the content of the newly created **FastQC** folder. You will see the fastqc command in this folder.

> Make sure that you can read, write and execute the fastqc command and that other people can read and execute it.
To see the current permissions of the command:
```ls -l``` 
The command that allows you to change the access permissions of files and directories is **chmod** (change mode). chmod has two mandatory arguments:

 - A three digit number representing the access permissions you want to set. Each digit refers to a different audience: 

 - first digit refers to the owner of the file
 - second digit refers to the group the owner belongs to
 - third digit refers to all others

The numbers themselves represent the permissions:

 - 7 full access: read, write and execute
 - 6 read and write
 - 5 read and execute
 - 4 read only
 - 3 write and execute
 - 2 write only
 - 1 execute only
 - 0 no access
 

 - The name of the file for which you want to change the access permissions

 
{{Wiki-img|NGS/Intro/LCLExtra2.png|400px}}

As you can see **root** is the owner of the file. This is why you need to log on as superuser (= root) to be able to change root's files. 

### Sorting files

We want to sort the file exams.txt from highest to lowest score on maths.

> Sort the file based on score on maths. Write results to a file called examssort1.txt
You have to **sort** the lines in the file according to the maths score. So you want to sort the file based on the numbers in the second column: it means that you cannot use the default sort command (this will sort the lines based on the content of the first column) but you have to use an option that allows you to specify the column you wish to sort on.
When you look in the manual you see that you can use the -k option for this: 
```
sort -k2 exams.txt
```
This will sort the file according to the values in the second column, but it will overwrite the original file. To save the sorted list in a new file, examssort1.txt, use the **redirect operator: >**
```
sort -k2 exams.txt > examssort1.txt
```
> Use the head command to look at the sorted file.

```
head examssort1.txt
```
You can see that the sorting was not done correctly: it was done alphabetically, treating the numbers in the second column as characters, instead of numbers. This means that we are still missing an option that allows for numerical sorting.

> Sort the file numerically based on score on maths.
```
sort -k2 -n exams.txt > examssort1.txt
head examssort1.txt
```
This looks a lot better, but we still have to reverse the order since we want the scores from high to low. 

> Sort the file numerically from highest to lowest score on maths.
For this we need to add a third option to the **sort** command.
When you look in the manual you see that you can use the -r option for this:

```
sort -k2 -n -r exams.txt > examssort1.txt
head examssort1.txt
```
> Show the results of the 10 students with the highest scores on the maths exam using a single line of commands.

This means that you have to combine the **head** command and the **sort** command from the previous exercise into one single command. Remember that you can combine commands by writing them in the order they have to be performed, so in our case first **sort** then **head**, separated by the **pipe operator: |**

```
sort -k2 -n -r exams.txt | head
```
> Show only the names of the 10 students with the highest scores on the maths exam using a single line of commands.

To leave out gender and scores you have to use the **cut** command. To specify which columns to cut you can use the -f option. Please note that the -f option specifies the column(s) that you want to retain ! As an argument you have to specify the name of the file you want to cut.
In the manual you can see that TAB is the default delimiter for the cut command. So if you have a tab-delimited text file, as in our case, you do not need to specify the delimiter. Only if you use another delimiter you need to specify it.

```
sort -k2 -n -r exams.txt | head | cut -f3
```


**The case of chromosomes and natural sorting.**
'sort' will sort chromosomes as text; adding few more parameters allows to get the sort you need.

> Write a list of human chromosomes (values: 22 to 1 X Y MT) to the screen. Use {end..begin} to define a numerical range.

Remember that you can use **echo** to print text to the screen, so to generate text. Try
```
echo {22..1} X Y MT
```
and see what happens...
You don't want to numbers next to each other in one row, you want them in a column underneath each other. This means you want to replace the blanks by end-of-lines. 

> Replace blanks by end-of-lines. Use the sed command for this.

Look up the command for replacing text in the slides. Blanks are represented by **\ ** (back slash followed by a blank) and end-of-lines are represented by **\n** (back slash followed by n). To replace all blanks by an end-of-line you need to add the **g** option (see [http://sed.sourceforge.net/sed1line.txt sed tutorial] for more info). So 
```
sed "s/\ /\n/g"
```
should do the replacement. Of course you need to combine the two commands using the output of echo as input in sed. Look in the slides or the cheat sheet how to do this.
However, you do not want to print the text to the screen you want to print the text to a file. Look in the slides or the cheat sheet how to do this and try to combine the three parts of the command.

> Write chromosomes as a column to a file called chroms.txt

The correct solution is: 
```
echo {22..1} X Y MT | sed "s/\ /\n/g" > chroms.txt
```
The s in the sed argument refers to substitution: you want to substitute blanks by end-of-lines, it is followed by the character you want to replace (a blank or "\ "), then the character you want to replace it with (an end-of-line or "\n"), then you add g to use sed recursively, in other words to do the substitution more than once so each time a blank is encountered.
It prints the chromosome numbers as a column to the file chroms.txt

> Look at the file using the less command.

```
less chroms.txt
```
Remember to use q to leave a less page. 

> Sort the chromosome file by using a simple sort. Write results to chromssort.txt

```
sort chroms.txt > chromssort.txt
head chromssort.txt
```
Not good! This is a tricky problem that always comes up when you are working with chromosome numbers e.g. when sorting bam/sam files, annotation files, vcf files...

> Modify the sort command so that the sorting of the chromosomes is done in the correct way.

Most people solve it by specifying that you want sort to do natural sorting using the -V option:
```
sort -V chroms.txt > chromssort.txt
head chromssort.txt
```
Nice !
Now try with chr in front.

> Create a file with values chr22 to chr1 chrX chrY chrMT into one column called chroms2.txt in one single command

```
echo chr{22..1} chrX chrY chrMT | sed "s/\ /\n/g" > chroms2.txt
head chroms2.txt
```
> Sort the file into a new file called chromssort2.txt

```
sort -V chroms2.txt > chromssort2.txthead chroms2.txt
```

### Getting files from the internet

To download data via a link on the internet you can use the **wget** command.
For NGS analysis you often need to download genomic sequence data from the internet. As an example we are going to download the E.coli genome sequence from the iGenomes website: ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Escherichia_coli_K_12_MG1655/NCBI/2001-10-15/Escherichia_coli_K_12_MG1655_NCBI_2001-10-15.tar.gz

Download this file into the folder NGS/ChIPSeq/ in your home directory. 

> Download the data into this folder. 

Go to this folder and use the wget command to download the data:
```
cd /home/bits/NGS?ChIPSeq/
wget ftp://igenome:G3nom3s4u@ussd-ftp.illumina.com/Escherichia_coli_K_12_MG1655/NCBI/2001-10-15/Escherichia_coli_K_12_MG1655_NCBI_2001-10-15.tar.gz
ll
```
In the same way you can download NGS data from the internet. We are not going to actually do this because 
NGS data sets are enormous and can take hours to download. Interrupting the download is done with {{key press|Ctrl}} + C

> Decompress the file. 

```
tar -xzvf Escherichia_coli_K_12_MG1655_NCBI_2001-10-15.tar.gz
ll
```
This creates a new folder called Escherichia_coli_K_12_MG1655.
Go into this folder and look at the whole genome fasta sequence

> Look at the fasta sequence. 
Use **cd** to navigate the folders and **head** to look at the file
```
cd Escherichia_coli_K_12_MG1655
ll
cd NCBI
ll
cd 2001-10-15
ll
cd Sequence
ll
cd WholeGenomeFasta
ll
head genome.fa
```

### Installing tools

The FastQC tool was installed by unzipping it. Most tools can be installed using the **make** command. There are many ways to install software on Linux:

 - via the software manager, an application with a very easy user friendly interface
 - via the **apt-get** command
 - software packages written in Python are installed via the **pip install** command


These methods handle the installation and removal of software on Linux distribution in a simplified way. They fetch the software from software repositories on the internet. However, these repositories do not always contain the most up-to-date version of software packages, especially not for niche software like bioinformatics tools.

So to be on the safe side, it is recommended that you download the latest version of a tool from its website (using wget) and use **make** to install it. In that way, you have full control over the version of the tool that you are installing.

This is not true for pip. Pip does the difficult steps in the installation for you and accesses an up-to-date package repository, so Python programs can safely be installed using pip.

Download and install all packages in the **tools** folder of the **/usr/bin/** folder. This is a folder owned by root so it is a good idea to switch to superuser again.

#### Installing TopHat

In the Introduction training we use RNA-Seq reads. Mapping RNA-Seq reads is done using the TopHat tool. So we need to install the [http://ccb.jhu.edu/software/tophat/tutorial.shtml TopHat tool]. We are going to do this in the /usr/bin/NGS/ folder so we need to be superuser for this.

> Go to the TopHat website and fetch the download link.

 - Go to the [http://ccb.jhu.edu/software/tophat/tutorial.shtml TopHat website]
 - Right click the Linux download link
 - Select **Copy Link Location**

> Download the file into the /usr/bin/NGS/ folder.

 - Go to the terimnal
 - Navigate to the /usr/bin/NGS/ folder
 - Type **wget **
 - Press the Shift and Insert keys simultaneously to paste the url

TopHat is downloaded as a .tar.gz file 

> Decompress the file
For decompressing a .tar.gz file you need the following command:
```
tar -xzvf tophat-2.1.1.Linux_x86_64.tar.gz
```
Remember to use tab autocompletion !

This creates a new folder called tophat-2.1...
Go into the tophat folder and type:
```
./tophat
```

If this opens the help of tophat, it means the software has been installed correctly. It does not mean that you can use the software now. Well you can but you will always have to type the commands from inside the tophat folder like we do here or provide the full path to the tophat folder. The dot slash (./) in front of the command means use the tophat **that is located in this folder**. It tells the command line where it can find the script (./ = the current directory = /usr/bin/tools/tophat-2.1.1.Linux_x86_64/).To avoid this we can create a symbolic link for tophat2 (see later).

#### Installing samtools

When you navigate to the **tophat** folder in /usr/bin/NGS/ you see that samtools is automatically installed when TopHat was installed:
{{Wiki-img|NGS/Intro/MapRNASeq5.png|600px}}

If you see the samtools help page when you type
```
./samtools_0.1.18
```
it means that samtools is indeed installed
{{Wiki-img|NGS/Intro/MapRNASeq6.png|600px}}


[http://wiki.bits.vib.be/index.php/Introduction_to_ChIP-Seq_analysis Installing tools for the ChIP-Seq training]
#### Installing cutadapt

Cutadapt is a Python program that removes adapter sequences from NGS reads.
It has already been installed on the bits laptops but if you need to install it, use [http://wiki.bits.vib.be/index.php/Installing_cutadapt these instructions].

### Quality control of NGS data

#### Checking the quality of the Introduction training data using FASTQC====

In the /home/bits/NGS/Intro directory you can find a file called SRR074262.fastq (the file containing Arabidopsis RNA-Seq reads), that was used in the exercises on FastQC in Windows. FastQC is a tool that checks the quality of fastq files, containing NGS data.

We will now try to do the same FastQC analysis from command line in Linux. FastQC is a java-based tool that needs java to be able to run. 

> Check if the correct version of java is installed
In command line you can check if java is installed on your laptop using the following command:
```
java -version
```
You should see something like:
```
ava version "1.8.0_101"
Java(TM) SE Runtime Environment (build 1.8.0_101-b13)
Java HotSpot(TM) 64-Bit Server VM (build 25.101-b13, mixed mode)
```
If you get an error then you don't have java installed. If the version listed on the first line is less than 1.5 then you will have problems running FastQC and you need to update java on your laptop.

> Run FastQC
To run FastQC as a GUI just like in Windows type:
```
fastqc
```
This opens the FastQC GUI and you could load a fastq file via the GUI to get its quality report. However, you can also use fastqc as a command via the command line. 

> Open the file SRR074262.fastq to obtain the sequence of the contaminating adapter.
Check [http://wiki.bits.vib.be/index.php/Quality_control_of_NGS_data#Exercise_1:_Quality_control_of_the_data_of_the_introduction_training the exercise on FastQC in Windows] for details on the quality report that is generated
The big plus of running FastQC from command line is that command line allows you to combine and run a set of commands as a program by writing a command script.

#### Automating FASTQC analyses
If you have many FASTQ files to check you might prefer running FASTQC from command line so you can loop over your files and process the reports automatically. 

> View the help files of the fastqc command
As for most commands the -h option nicely opens the help file:
```
fastqc -h
```

{{Wiki-img|NGS/Intro/CLFastQC1.png|500px}}

To run via command line you can simply specify a list of files to process:
```
fastqc somefile.fastq someotherfile.fastq
```
You can specify as many files as you like. If you don't specify any files the program will open the GUI.

However, there are a few options that might be helpful to use. Since FASTQC can process FASTQ, SAM and BAM files, it is always safer to tell him upfront which format to expect.

We will generate FASTQC reports for the two FASTQ files in the /home/bits/NGS/RNASeq/ folder.

> Decompress the files
First you have to decompress the fastq files. In the cheat sheet look up the command for decompressing a .gz file
```
gunzip chr22_SRR1039509_1.fastq.gz
gunzip chr22_SRR1039509_2.fastq.gz
```
Decompression of the files results in two .fastq files that can be used as inputs generating the FASTQC reports.

> Generate the FASTQC reports for the two fastq files.
As you can see in the help file of fastqc, the -f option allows you to specify the format of the input file(s). 
```
fastqc -f fastq chr22_SRR1039509_1.fastq chr22_SRR1039509_2.fastq
```
The two .html files contain the FASTQC reports and can be opened in a browser. 

> Open the first report in firefox via command line

```
firefox chr22_SRR1039509_1_fastqc.html
```
By default, FastQC will create an HTML report with embedded graphs, but also a zip file containing individual graphs and additional data files containing the raw data from which the plots were drawn.

> Remove the .html and the .zip files 

```
rm *.zip
rm *.html
```
If you have many files you might want to use a for-loop instead of typing all file names into the command.

> Write a for-loop to process the two FASTQ files.
First go back to the folder that contains the fastqc command and make sure you are operating as superuser.
Take a close look at the syntax of the for-loop that is described in the slides. We are going to use the syntax for looping over files in a folder. Don' t forget the ***** to loop over all fastq files in the specified folder:
```
for file in /home/bits/NGS/RNASeq/*.fastq
do
fastqc -f fastq ${file}
done
```
Don't forget the **$** since file is just a variable that refers to the actual files in the folder. Write every line on a different line in the terminal.

When you go to the /home/bits/NGS/RNASeq folder you should see the same html and zip files as in the previous exercise. The two .html files contain the FASTQC reports and can be opened in a browser.
If you want to save your reports in a folder other than the folder which contains your fastq files you can specify an alternative location by using the **-o** option.

> Create a new folder called FASTQCresults

```
mkdir FASTQCresults
```
> Create a variable output. Its value is the path to the newly created folder.

```
output=/home/bits/NGS/RNASeq/FASTQCresults/
```
> Write a for-loop to analyze the quality of the fastq files and write the report to the new folder

Adjust the code of the for-loop to write the results to the newly created folder
```
for file in /home/bits/NGS/RNASeq/*.fastq
do
fastqc -f fastq -o ${output} ${file}
done
```
Don't forget the **$** since output and file are variables. Write every line on a different line in the terminal.
When you go to the /home/bits/NGS/RNASeq/FASTQCresults folder you should see the same html and zip files as in the previous exercise. The two .html files contain the FASTQC reports and can be opened in a browser.

In this way you can process hundreds of FASTQ files automatically. You can even write a script to process the reports and create a general overview of the quality of the complete experiment.

In the **Templates** directory of the /usr/bin/tools/FastQC/ you will find a file called **header_template.html** which you can edit to change the look of the report. This file contains all information concerning the layout of the FASTQC reports like the header for the report, the CSS section... and you can alter this however you see fit.


===Improving the quality of the data===
In this exercise we go back to the data set of the Intro training in folder /home/bits/NGS/Intro. 
Almost all NGS data sets contain a high number of contaminating adapter sequences. You can remove these adapters using command line tools like [https://code.google.com/p/cutadapt/ cutadapt]. See [http://wiki.bits.vib.be/index.php/Installing_cutadapt installation instructions].

> Check the help file for the option that defines the number of mismatches you allow (= error rate).
To open the cutadapt help files (it's not a regular bash command so it doesn't have a manual) type:
```
cutadapt -h
```

Scrolling down the help file shows that the **-e** option defines the maximum allowed error rate: the default is 0.1 meaning that it allows one mismatch every 10 nucleotides. Adapter sequences are identified by aligning each read to the adapter sequence: if the frequency of mismatches in the alignment is below the allowed error rate then the adapter sequence is trimmed from the read.
> Check the option you need for defining the adapter sequence
In the help file you see that you have multiple options:

 - **-a** to trim adapter sequences at the 3' end of the reads. In most cases this is the adapter that's causing the problems: when small RNA fragments are sequenced, the resulting reads can be longer than the RNA fragments. As a results they will contain (parts of) the 3’ adapter. In longer reads the adapter might even lie within the read:
```
MYSEQUEN                         (no adapter contaimination)
MYSEQUENCEADAP                   (part of adapter at 3' end)
MYSEQUENCEADAPTER                (adapter at 3' end)
MYSEQUENCEADAPTERSOMETHINGELSE   (adapter within the read)
```
Cutadapt will cut the adapter (part) and all sequence following it resulting in:
```
MYSEQUEN
MYSEQUENCE
MYSEQUENCE
MYSEQUENCE
```

 - **-g** to trim adapter sequences ligated at the 5' end of the reads. These adapters are expected to appear at the start of a read (where they can be just partially there) or somewhere within the read:
```
ADAPTERMYSEQUENCE              (5' end)
DAPTERMYSEQUENCE               (partial)
TERMYSEQUENCE                  (partial)
SOMETHINGADAPTERMYSEQUENCE     (within)
```
In all cases, the adapter itself and the sequence preceding it will be removed, leaving in all examples above:
```
MYSEQUENCE
```

 - **-b** to trim adapters at the 3' or 5' end of the read. If there is at least one base before the adapter, then the adapter is trimmed as a 3’ adapter and the adapter itself and everything following it is removed. Otherwise, the adapter is trimmed as a 5’ adapter and it is removed from the read, but the sequence after it it remains:
```
Before trimming 	        After trimming 	
MYSEQUENCEADAPTERSOMETHING 	MYSEQUENCE 
MYSEQUENCEADAPTER 	        MYSEQUENCE
MYSEQUENCEADAP 	                MYSEQUENCE
MADAPTER 	                M
ADAPTERMYSEQUENCE 	        MYSEQUENCE
PTERMYSEQUENCE 	                MYSEQUENCE
TERMYSEQUENCE 	                MYSEQUENCE
```


Since we probably have contaminating adapter at the 3' end we'll take the -a option
At the top of the help file you see that the standard usage of the command is:
```
cutadapt -a ADAPTER -o output.fastq input.fastq
```
You can find the sequence of the adapter in the FastQC report of SRR074262.fastq

> Trim the adapter sequence using the default error rate, store the trimmed sequences in a file SRR074262trim.fastq
So in our case the command is: 
```
cutadapt -a GATCGGAAGAGCTCGTATGCCGTCTTCTGCTTGAAA -o SRR074262trim.fastq SRR074262.fastq
```
Note that the default error rate means that you allow max. 10% mismatches in the alignment of adapter and read. 

> How many reads consisted solely of adapter sequence (and were consequently completely removed) ?
The output of the cutadapt command is:
```
This is cutadapt 1.8.1 with Python 2.7.6
Command line parameters: -a GATCGGAAGAGCTCGTATGCCGTCTTCTGCTTGAAA -o SRR074262trim.fastq SRR074262.fastq
Trimming 1 adapter with at most 10.0% errors in single-end mode ...
Finished in 66.92 s (7 us/read; 8.62 M reads/minute).

### Summary

Total reads processed:               9,619,406
Reads with adapters:                 2,327,902 (24.2%)
Reads written (passing filters):     9,619,406 (100.0%)

Total basepairs processed:   346,298,616 bp
Total written (filtered):    271,141,022 bp (78.3%)

### Adapter 1

Sequence: GATCGGAAGAGCTCGTATGCCGTCTTCTGCTTGAAA; Type: regular 3'; Length: 36; Trimmed: 2327902 times.

No. of allowed errors:
0-9 bp: 0; 10-19 bp: 1; 20-29 bp: 2; 30-36 bp: 3

Bases preceding removed adapters:
  A: 6.1%
  C: 1.5%
  G: 1.8%
  T: 3.0%
  none/other: 87.5%

Overview of removed sequences
length    count    expect    max.err    error counts
3    156030    150303.2    0    156030
4    48693    37575.8    0    48693
5    12005    9394.0    0    12005
6    8702    2348.5    0    8702
7    6686    587.1    0    6686
8    5546    146.8    0    5546
9    5958    36.7    0    5484 474
10    5479    9.2    1    4539 940
11    4197    2.3    1    3737 460
12    4038    0.6    1    3713 325
13    3392    0.1    1    3158 234
14    2730    0.0    1    2531 199
15    2801    0.0    1    2625 176
16    2384    0.0    1    2221 163
17    1887    0.0    1    1759 128
18    1998    0.0    1    1848 150
19    1572    0.0    1    1447 123 2
20    1257    0.0    2    1079 107 71
21    1141    0.0    2    1029 90 22
22    730    0.0    2    671 46 13
23    504    0.0    2    471 21 12
24    549    0.0    2    499 37 13
25    495    0.0    2    441 39 15
26    587    0.0    2    538 35 14
27    657    0.0    2    585 53 19
28    711    0.0    2    633 40 26 12
29    764    0.0    2    687 49 24 4
30    889    0.0    3    760 85 33 11
31    887    0.0    3    739 94 42 12
32    579    0.0    3    466 65 37 11
33    438    0.0    3    347 36 38 17
34    700    0.0    3    541 85 53 21
35    5390    0.0    3    4652 507 171 60
36    2037526    0.0    3    1870684 129754 20094 16994
```
In the last line you see the number of reads with 36 bases aligned to the adapter sequence. Since that is the total of the read (the reads are 36bp long) it means that over 2 million reads only consist of adapter sequence, 1.870.684 being completely identical to the adapter, 129.754 containing 1 mismatch with the adapter...
> Open the trimmed sequences in FastQC
To open the FastQC GUI type the fastqc command
```
fastqc
```
You can compare the results with these of the original reads on [http://wiki.bits.vib.be/index.php/Quality_control_of_NGS_data the Quality control of NGS data wiki page].

> Are all the reads still 36 nt long after trimming ?
In the **Basic statistics** tab you see that the length of the reads varies as was to be expected after trimming

{{Wiki-img|NGS/Intro/fastqcTrim1.png|400px}}  
> Have the quality scores of the reads significantly changed after trimming ?
The **Per base sequence quality** is similar to that of the untrimmed file, as is the **Per sequence quality**. The latter one just shows a lower number of sequences since the 2 million reads that consisted solely of adapter sequence are no longer taken into account.

{{Wiki-img|NGS/Intro/fastqcTrim2.png|400px}} 

Quality scores have changed a bit of course since you removed bases and reads from the data set but you did not trim based on quality but based on similarity to an adapter sequence so the scores of the trimmed reads are similar to those of the untrimmed reads. If you had trimmed low quality bases, the quality scores would have been higher in the trimmed reads.
> Has the per base sequence content improved as a result of the trimming ?
The **Per base sequence content** - the tool to detect adapter contamination - plot has greatly improved allthough it is still not considered stable enough.

{{Wiki-img|NGS/Intro/fastqcTrim3.png|400px}} 
> What are the bumps you see in the Sequence length distribution plot ?

This question is related to the results of the trimming:
```
Overview of removed sequences
length    count    expect    max.err    error counts
3    156030    150303.2    0    156030
4    48693    37575.8    0    48693
5    12005    9394.0    0    12005
...
33    438    0.0    3    347 36 38 17
34    700    0.0    3    541 85 53 21
35    5390    0.0    3    4652 507 171 60
36    2037526    0.0    3    1870684 129754 20094 16994
```
As you can see here over 2 million reads corresponded to adapter over their entire length and as a result were trimmed to length zero. This is the large peak at length zero on the plot. Over 150000 reads contain 3 bases that belong to the adapter. These 3 bases have been cut leaving reads of 33 nt long: this is the small peak you see on the plot at length 33. All intermediate lengths of adapter contamination have been detected but in such a small fraction of reads that you cannot see the influence of the trimming on the plot.

{{Wiki-img|NGS/Intro/fastqcTrim4.png|400px}} 
FASTQC calls a failure for this plot because it knows the file contains Illumina data and it expects the reads to have the same lengths. The software does not consider the fact that this is no longer true after trimming.

> Are there any overrepresented sequences left ?
The 2 million sequences that were initially detected as contaminating adapters are still in the list but now as sequences with zero length. The other contaminating sequences are of course still present but at very low counts.

{{Wiki-img|NGS/Intro/fastqcTrim6.png|400px}} 
> Are there any overrepresented hexamers ?
FASTQC still detects overrepresented hexamers although at much lower counts than before. These are probably parts of the remaining overrepresented sequences.

{{Wiki-img|NGS/Intro/fastqcTrim5.png|400px}}

### Linking files

#### Linking FastQC

In the previous exercise you had to specify the path of the fastqc command, otherwise the operating system was not able to find (and thus execute) the command. You can avoid having to specify the path every time you want to execute a command by creating a link to the command using the **ln** command.
You can soft or hard links, for what we want to achieve a soft link is fine. When you place a link to the command in /usr/local/bin you will be able to run the program from any location by just typing
```
fastqc
```
So the overall format of the command is as follows:
```
ln -s (soft link) path_where_fastqc_is (source path) /usr/local/bin/fastqc (destination path)
```

> What's the command you would need for creating this soft link ? 
When you look in the manual of **ln** you see that for creating a soft link you need the **-s** option. So you use the following command: 
```
ln -s /usr/bin/tools/FastQC/fastqc /usr/local/bin/fastqc
```
Check if you can run the fastqc command from any location now.

#### Linking Tophat2

If you don't create a symbolic link you have to specify the full path of the command when you want to run it, otherwise the operating system is not able to find (and thus execute) the command. You can avoid having to specify the full path every time you want to execute a command by creating a link to the command using the **ln** command. For creating symbolic links you need superuser powers!
You can make soft or hard links, for what we want to achieve a soft link is fine. When you place a link to the command in /usr/local/bin/ you will be able to run the program from any location by just typing its name.
So the overall format of the command is as follows:
```
ln -s (soft link) path_where_command_is (source path) /usr/local/bin/name (destination path)
```

> Create a symbolic link for tophat2
For creating the link you need the following command:
```
sudo ln -s /usr/bin/NGS/tophat-2.1.1.Linux_x86_64/tophat2 /usr/local/bin/tophat2
```
Remember to use tab autocompletion !
Now type **tophat2**. If you see the help file, the link works.

If you mess up the link you have to remove it before you can try again using the following command:
```
sudo unlink /usr/local/bin/tophat2
```


#### Linking samtools

We will also do the same for samtools to use samtools from anywhere in the file system. 

> Create a symbolic link for samtools
Create a link using the **ln -s** command:
```
sudo ln -s /usr/bin/NGS/tophat-2.1.1.Linux_x86_64/samtools_0.1.18 /usr/local/bin/samtools-0.1.18
```
Check if the command works. If you type
```
samtools-0.1.18 view
```
(one of the possible samtools commands) you should see the manual of the command.
In many cases you will have several versions of samtools running on your laptop. That's why I don't call the tool samtools but I choose the full name including the version number.

[http://wiki.bits.vib.be/index.php/Introduction_to_ChIP-Seq_analysis#Linking_tools Linking tools for the ChIP-Seq training]


### Mapping reads

#### Mapping reads of the ChIP-Seq training with Bowtie

### Mapping reads with Bowtie

*Exercise created by Morgane Thomas Chollier*

#### Obtaining the reference genome
If you are going to follow the ChIP-Seq training, skip this part: you are going to do these steps during the ChIP-Seq training. The fasta file containing the reference genome is called Escherichia_coli_K12.fasta and is stored in the /home/bits/NGS/ChIPSeq/ folder on the BITS laptops. Alternatively you can use the file that you downloaded via wget in exercise 3.

If you are not going to follow the ChIP-Seq training, go on and see how to obtain the reference genome. 

Back to the ChIP-Seq data of *E. coli*. In this experiment we want to see which genomic regions are bound to transcription factor FNR. However, at this point what we have is a set of reads that are identified by their location of the flow cell. To answer our question we should link the reads to regions in the genome.
To obtain their genomic coordinates, we will map each read on the reference genome sequence
As said before, for Illumina reads the standard mappers are BWA and Bowtie (version 1 and 2). In this exercise we will use Bowtie version1. 
Check out the [http://wiki.bits.vib.be/index.php/Linux_command_line#Installing_Bowtie installation instructions for Bowtie].

Bowtie1 was installed and a symbolic link was created so the command should work from anywhere in the file system when you type bowtie-1.1.2

> What happens when you type the bowtie command ?  
This prints the help of the program. However, the help file is a bit difficult to read ! If you need to know more about the program, it's easier to directly check [http://bowtie-bio.sourceforge.net/manual.shtml the  manual on the website]
Bowtie needs a reference sequence to align each read on it. 

> Which *E. coli* strain was used in the experiment ?  
Go to [http://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1003565 the paper] and check the part **Strains and growth conditions** in the **Materials and methods** section. There you see that the experiment was done using *E. coli* K-12 MG1655.

{{Wiki-img|NGS/Intro/mapping1.png|600px}}
So we need the genome sequence of *E. coli* K-12 MG1655 and it needs to be in a specific format (=index) for bowtie to be able to use it. Several pre-built indexes are available to download on [http://bowtie-bio.sourceforge.net/manual.shtml the bowtie webpages] or the [http://support.illumina.com/sequencing/sequencing_software/igenome.html iGenomes website].

Although the *E. coli* sequence is available we will not use it to show you how you should proceed if you don't find your reference sequence here. In that case you will need to make the index file yourself. 

If you can't find your reference on the iGenomes website you have to download it from:

 - [http://genome.ucsc.edu/ UCSC]
 - [http://www.ensembl.org/index.html Ensembl]
 - [http://www.ncbi.nlm.nih.gov/ NCBI]

Since Ensembl focuses on higher eukaryotes, we are going to download the genome from NCBI.

> Which reference sequence was used in the experiment ?  
Go to [http://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1003565 the paper] and check the part **High-throughput RNA sequencing (RNA-seq) analysis**. There you see that the reads were mapped to an NCBI sequence with version number **U00096.2**.

{{Wiki-img|NGS/Intro/mapping2.png|600px}}

> Search for this sequence on NCBI ?  
Go to [http://www.ncbi.nlm.nih.gov/ the NCBI website], select the **Nucleotide** database, type **U00096.2** as a search term and click **Search**. In the record of this sequence you see that an updated version is available. Click the **See current version** link. 

{{Wiki-img|NGS/Intro/mapping3.png|500px}}

This sequence is not a RefSeq sequence (the high quality part of NCBI Genbank). You can see that because the version number does not contain an underscore and all RefSeq version numbers contain an underscore.

> Is there a RefSeq sequence available ?  
In [http://www.ncbi.nlm.nih.gov/nuccore/U00096.3 the record of the current version], scroll down to the **Related information** section in the right menu. There you see that a RefSeq sequence is available. Click the **Identical RefSeq** link. 

{{Wiki-img|NGS/Intro/mapping4.png|600px}}

This brings us to a RefSeq record with version number NC_000913.3. Note that we will not take this lastest version but the previous one (NC_000913.2), because the available tools for visualization have not been updated yet to the latest version. This will not affect our results.

> Download the sequence of the previous version of the RefSeq record in FASTA format  
Search the **Nucleotide** database for **NC_000913.2**

{{Wiki-img|NGS/Intro/mapping5.png|600px}}

{{Wiki-img|NGS/Intro/mapping6.png|600px}}


 - In the record expand the **Send to** section (red).
 - Select **File** as destination (green). This means that you download the data on your computer.
 - Select **FASTA** format (blue).
 - Click **Create File**.

This creates a file called **sequence.fasta** in the **Downloads** folder in your **Home** folder. Copy the downloaded file to the folder where the fastq files are located (/home/bits/NGS/ChIPSeq on the BITS laptops) and rename it as **Escherichia_coli_K12.fasta**.

#### Writing a bash script to map the reads to the reference genome

Suppose that you expect to be doing many NGS experiments on *E. coli*. Each time we analyze a data set, we will have to map the reads against the *E. coli* genome. The best way to ensure that you can reuse commands during the next analysis, is to combine them into a script (= small program). Since the script will consist of command line (= bash) commands, the script is called a bash script.

You cannot do the mapping directly on the .fasta file, you need to index the file first. Reference genomes from the Bowtie /iGenomes website are already indexed so when you get your reference there you can skip this step. Reference genomes downloaded from NCBI, Ensembl or UCSC need to be indexed using the bowtie-build command.  

Indexing a reference genome is a one-time effort: you do not have to repeat it each time you do a mapping. This is why we are not going to include the indexing in the script.  

> Create a variable called folder containing the path to the folder that contains the E. coli fasta file

```
folder=/home/bits/NGS/ChIPSeq/
```
> Check out the manual of the bowtie-1.1.2-build command to see the arguments it takes
Since we have created a soft link for the bowtie-1.1.2-build command, the command should work from any location in the Linux file system. To see to help file just type the command:
```
bowtie-1.1.2-build 
```
In the help file you see that you need to specify the reference genome that you want to index as an input (in our case the E. coli fasta file) and that you have to specify the output file.
```
Usage: bowtie-build [options]* <reference_in> <ebwt_outfile_base>
    reference_in            comma-separated list of files with ref sequences
    ebwt_outfile_base       write Ebwt data to files with this dir/basename
```
We will give the output files the same name as our input file: Escherichia_coli_K12

> Prepare an indexed reference sequence for E. coli using the bowtie-build command, use the folder variable
So as an input the command expects the name of the input and the output file. 
```
bowtie-1.1.2-build ${folder}Escherichia_coli_K12.fasta ${folder}Escherichia_coli_K12
```
bowtie-build will index the Escherichia_coli_K12.fasta generating a whole set of .ebwt files whose name all start with Escherichia_coli_K12. We will write a bash script to do the rest of the mapping.

Writing a script can be done in any text editor. On the BITS laptops you can use gedit:

 - Click the **Menu** at the bottom left corner of the desktop
 - Type **gedit** in the text search box
 - Click the **Text Editor** button

{{Wiki-img|NGS/Intro/script1.png|300px}}
The first thing you do when you write a script is define all the variables you need.
We need the following variables:

 - The **folder** that contains the reference genome.
 - The name of the **input** fastq file you want to map (if it's in the same folder as the reference as it is in our case). If the fastq file is in another folder you have to specify the full path to the file.

> Create the required variables 
```
folder=/home/bits/NGS/ChIPSeq/
input=SRR576933
```
Make sure that the file containing the indexed reference genome and the fastq files containing the *E. coli* reads are located in the same folder.

> Check the help file for bowtie-1.1.2 
 Go back to the terminal and type
```
bowtie-1.1.2
```
> What is the first argument bowtie expects ?
As first argument bowtie expects the path to the ebwt files (= the genome index files) so in our case that's Escherichia_coli_K_12
```
Usage: 
bowtie [options]* <ebwt>
```
> What is the second argument bowtie expects ?
As second argument bowtie expects the information of the input file containing the reads, in our case SRR576933.fastq Bowtie can be used to map single end reads as we have but also to map paired end reads. In the case of paired end reads you have two fastq files, one with the upstream reads and one with the downstream reads. That's why you can specify two input files m1 and m2. In our case it's just one file.
```
Usage: 
bowtie [options]* <ebwt> {-1 <m1> -2 <m2> 

  <m1>    Comma-separated list of files containing upstream mates (or the
          sequences themselves, if -c is set) paired with mates in <m2>
  <m2>    Comma-separated list of files containing downstream mates (or the
          sequences themselves if -c is set) paired with mates in <m1>
```
> What is the final argument bowtie expects ?
As final argument bowtie expects the output file which is in our case SRR576933.sam
```
Usage: 
bowtie [options]* <ebwt> {-1 <m1> -2 <m2> | --12 <r> | <s>} [<hit>]
  <hit>   File to write hits to (default: stdout)

```
You need to tell bowtie which type of file your input file is.  

> What is the option for doing this ?
Via the option: -q indicates the input file is in FASTQ format.
```
Usage: 
Input:
  -q                 query input files are FASTQ .fq/.fastq (default)
```
Fastq is the default, so you don't have to explicitly set this option. If you don't specify it in your command bowtie will automatically assume your input is in fastq format.

You need to tell bowtie the maximum number of mismatches you allow in the alignments of your reads to the reference.  

> What is the option for doing this ?
Via the option: -v 
```
Alignment:
  -v <int>           report end-to-end hits w/ <=v mismatches; ignore qualities
```
If you set this option's argument to 2, it means that bowtie will allow two mismatches anywhere in the read, when aligning the read to the genome sequence.

Then we want to set an option that allows to define a number of bases that should be trimmed from the 3' ends of the reads before the alignment is done.

> What is the option for doing this ?
Via the option: -3 
```
  -3/--trim3 <int>   trim <int> bases from 3' (right) end of reads
```
We want to set this option to trim the last base from the 3' ends of the reads before the alignment is done.

We also want to specify that we only want reads that map specifically to one location in the genome in our output.

> What is the option for doing this ?
Via the option: -m 
```
  -m <int>           suppress all alignments if > <int> exist (def: no limit)
```
Finally we want to specify that the output should be SAM format.

> What is the option for doing this ?
Via the option: -S 
```
SAM:
  -S/--sam           write hits in SAM format
```
> Write the error channel to a file called SRR576933.out
Via the option: -S 
```
2> SRR576933.out 
```
In the script you use the variables to you have created instead of the actual file name SRR576933

> Map the reads to the indexed reference sequence ?

So the full script becomes:
```
folder=/home/bits/NGS/ChIPSeq/
input=SRR576933
bowtie-1.1.2 ${folder}Escherichia_coli_K12 -q ${folder}${input}.fastq  -v 2 -m 1 -3 1 -S 2> ${folder}${input}.out > ${folder}${input}.sam
```
We asked the mapper to create a sam file with mapping results. In the same way we could create a bam file. While SAM files can be inspected using Linux commands (head, less, grep, ...), BAM format is compressed and requires a special parser to read the file. Samtools is used to view bam files but it can also be used to analyze sam files.

Look at this [http://davetang.org/wiki/tiki-index.php?page=SAMTools very informative wiki on samtools] and the [http://samtools.sourceforge.net/samtools.shtml official manual of samtools]. The manual does not document some of the commands, so it is better to first look in the wiki to find the command you need and then look in the manual to have an overview of the options it uses.

We will use samtools to get a rough idea of the quality of the mapping. Look at the samtools wiki to see which command you need for getting the basic statistics of a sam file.

> Command to get the basic stats of the mapping file.  
On the [http://davetang.org/wiki/tiki-index.php?page=SAMTools samtools wiki] 

{{Wiki-img|NGS/Intro/samtools2b.png|300px}}

you can see that you need the **samtools flagstat** command for this.
However samtools flagstat expects a bam file as input. So look at the samtools wiki to see which command you need for transforming a sam into a bam file.

> Command to convert sam into bam files.  
On the [http://davetang.org/wiki/tiki-index.php?page=SAMTools samtools wiki] you can see that you need the **samtools view** command for this. 
For the exact command you need to know if the sam file contains a header. Let's assume that the sam file indeed contains a header (it does, I checked). The symbolic link for samtools is samtools-0.1.18  Notice that we include the version number of bowtie and samtools in the symbolic link because we have mutiple versions of bowtie and samtools installed on the laptops.

> Add the command for transforming the sam into a bam file to your script

```
folder=/home/bits/NGS/ChIPSeq/
input=SRR576933
bowtie-1.1.2 ${folder}Escherichia_coli_K12 -q ${folder}${input}.fastq  -v 2 -m 1 -3 1 -S 2> ${folder}${input}.out > ${folder}${input}.sam
samtools-0.1.18 view -bS  ${folder}${input}.sam > ${folder}${input}.bam
```
> Add the command for analyzing the bam file to your script
```
folder=/home/bits/NGS/ChIPSeq/
input=SRR576933
bowtie-1.1.2 ${folder}Escherichia_coli_K12 -q ${folder}${input}.fastq  -v 2 -m 1 -3 1 -S 2> ${folder}${input}.out > ${folder}${input}.sam
samtools-0.1.18 view -bS  ${folder}${input}.sam > ${folder}${input}.bam
samtools-0.1.18 flagstat ${folder}${input}.bam
```
Bash scripts all have one characteristic: the first line of a bash script is always the following:
```
#!/bin/bash
```
This tells the system which program should be used to interpret the script (in this case: /bin/bash)
 

> Add this line to your script
So the full script becomes:
```
#!/bin/bash
folder=/home/bits/NGS/ChIPSeq/
input=SRR576933
bowtie-1.1.2 ${folder}Escherichia_coli_K12 -q ${folder}${input}.fastq  -v 2 -m 1 -3 1 -S 2> ${folder}${input}.out > ${folder}${input}.sam
samtools-0.1.18 view -bS  ${folder}${input}.sam > ${folder}${input}.bam
samtools-0.1.18 flagstat ${folder}${input}.bam
```
Save the script as "my_mapping" in the /home/bits/NGS folder.
{{Wiki-img|NGS/Intro/script2.png|400px}}

> Check permissions of the script and change them if needed.
Go to the folder where you have saved the script: /home/bits/NGS and type
```
ll
```
The script is not executable:
{{Wiki-img|NGS/Intro/script4.png|300px}}
Make it executable by typing:
```
chmod 755 my_mapping
ll
```
To run the script make sure you are in folder containing the script (/home/bits/NGS) and type:
```
./my_mapping
```
The mapping should take few minutes as we work with a small genome. For the human genome, we would need either more time, or a dedicated server.

The samtools flagstat command displays an overview of the alignment results on your screen. The results are not very informative because the data set comes from a single-end sequencing experiment. You just see that 62% of the reads were mapped. This may seem low but remember that we haven't done any cleaning on the file. According to FASTQC the file contains about 30% of adapter sequences that will not map.

Repeat the analysis for the control sample SRR576938.fastq  These two fastq files come from a ChIP-Seq experiment, the first contains the reads of the ChIP sample, the second of the control sample, which consists of fragmented genomic DNA. You need both to identify regions in the genome that are represented more in the ChIP reda than in the control (these are the regions that bind to the transcription factor).

> Repeat the analysis for sample SRR576938.fastq ?
Repeating the mapping is easy now the only thing you need to do is changing the value of the input variable in the script:

 - Reopen the script in gedit
 - Change the name of input file
 - Save the changes
 - In the terminal go to the folder containing the script (/home/bits/NGS)
 - Run the script by typing:
```
./my_mapping
```

 
> How many reads of the control sample were mapped ?
In the flagstat results, you see that 95% of the reads was mapped. This is of course ok but you expected a high percentage here since the control sample is nothing more than the reference genome cut up into small pieces. 
At this point, you have two sam and two bam files, one for the treated sample, one for the control sample. 

For paired-end data flagstat results are much more informative, see an example below:

{{Wiki-img|NGS/Intro/samtools3.png|500px}}

This overview deserves some explanation:

 - **nan** means **Not A Number** (e.g: divided by 0 )
 - **paired in sequencing** means reads that belong to a pair regardless of the fact that they are really mapped as a pair
 - **read1** means forward reads
 - **read2** means reverse reads
 - **properly paired** means that both mates of a read pair map to the same chromosome, oriented towards each other, and with a sensible insert size
 - **with itself and mate mapped** means that both reads of a pair map to the genome but they are not necessarily properly paired, they just map somewhere on the genome
 - **singletons** means that one of the reads of a pair is unmapped while its mate is mapped
 - **with mate mapped to a different chr** means reads with a mate mapped on a different chromosome
 - **with mate mapped to a different chr (mapQ >= 5)** means reads with a mate mapped on a different chromosome having a mapping quality greater than 5

> Compare the number of forward and reverse reads in the paired-end experiment.  
the counts of forward and reverse reads are to be found on the lines ending with read1 and read2 respectively. As you see the number of reverse reads exceeds the number of forward reads by 439. 
> How many reads were mapped as a pair in the paired-end experiment?   
12.911.388 reads were properly mapped as a pair, that's 85,68% of the total number of reads

You can find similar info in the SRR576933.out file in the ChIPSeq folder (using the **less** command), which also contains some statistics about the mapping.

> How many reads were mapped according to this file ?
You see that 62% of the reads was mapped, which is good considering 30% of the reads contained adapter sequences. Type **q** to leave the less editor. This result is in agreement with the result of the samtools flagstat command.


#### Visualize mapping in IGV

IGV is installed on the bits laptops and can be run using the **igv** command.
```
igv
```

This opens the graphical user interface of the tool (similar to what we have with firefox during the class). Be patient, it might take a few minutes for the program to start.

We open the bam file that was generated by the Picard modules in IGV. The bam file contains Arabidopsis reads. This means we have to visualize them on the Arabidopsis genome. Change the genome in IGV from Human hg19 to A. thaliana (TAIR10).

{{Wiki-img|NGS/Intro/IGV3.png|700px}}

This should display the Arabidopsis genome in the top and the bottom view.
Now it's time to load the mapped reads via **File** in the top menu and **Load from File**.

{{Wiki-img|NGS/Intro/IGV4.png|300px}}

Select the .bam file to open. You don't need to load the .bai file, it's suffcient that it is present in the same folder as the .bam file. 
This loads the data into the center view. At this point, you can't see the reads, you have to zoom in to view them.
According to the [http://journals.plos.org/plosone/article?id=10.1371/journal.pone.0025279#s3 supplemental material] accompanying the paper describing this data set, AT1G02930 is highly expressed in all samples and differentially expreesed during the defense response in ''A. thaliana''. So we will zoom in on this gene. You can do this by typing the accession number in the top toolbar and clicking **Go**:

{{Wiki-img|NGS/Intro/IGV5.png|700px}}

The reads for this gene are now visualized in the center view. You can zoom in even more using the zoom bar in the top toolbar:

{{Wiki-img|NGS/Intro/IGV6.png|700px}}

Zoom in until you see the nucleotides of the reference sequence.

{{Wiki-img|NGS/Intro/IGV7.png|700px}}

The reads are represented by grey arrows, the arrow indicating the orietation of the mapping. Hovering your mouse over a read gives additional info on the mapping. The colored nucleotides indicate mismatches between the read and the reference. Alignments that are displayed with light gray borders and white fill, have a mapping quality equal to zero. Interpretation of this mapping quality depends on the mapper as some commonly used mappers use this convention to mark a read with multiple alignments. In such a case, the read also maps to another location with equally good placement. It is also possible the read could not be uniquely placed but the other placements do not necessarily give equally good quality hits. 

By default IGV calculates and displays the coverage track (red) for an alignment file. When IGV is zoomed to the alignment read visibility threshold (by default 30 KB), the coverage track displays the depth of the reads displayed at each locus as a gray bar chart. If a nucleotide differs from the reference sequence in greater than 20% of quality weighted reads, IGV colors the bar in proportion to the read count of each base (A, C, G, T). You can view count details by hovering the mouse over a coverage bar:

{{Wiki-img|NGS/Intro/IGV8.png|700px}}
