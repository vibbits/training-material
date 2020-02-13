---
layout: tutorial_hands_on

title: "04 Text mining, scripting and loops"

questions:
  - "How to automate my commands?"
  - "How to find patterns in text files?"

objectives:
  - "get familiar with writing basic scripts"
  - "learn what commands to use when searching the file system"
  - "get familiar with writing loops"

time_estimation: "60m"
key_points:
  - "How can I find a certain text in my files"
  - "What are scripts and how to use them"

contributors:
  - chdeb
---
## A script
A script is just a plain text file. I will show this below. It contains written instructions, that can be understood by a programming language, in our case **bash** .

### An example script 

> Create a text file named 'buddy' in your home with following content:
```
badday="Cheer up"
goodday="Doing great"
echo "$badday, $USER !"
echo "$goodday, $USER !"
```

> One way of doing this is:
```
nano buddy
```

> and copy of the contents of the header above. Save the contents by pressing <ctrl>+O. Close nano with <ctrl>+x
> What type of file did you create?
```
file buddy
buddy: ASCII text
```

> That file contains plain text. To execute the commands in that file, feed it as an argument to the program 'bash'.
```
bash buddy
Cheer up, bits !
Doing great, bits !
```

Few things to notice:
- in the script, we have defined 2 **variables** 'badday' and 'goodday'
- their values can be displayed by the program **echo** which takes as an argument the name of the variable preceded by a **$** sign.
- the $USER variable, is an **environment variable**. They can be used in scripts. Env variables are typically written in capitals.

### Getting more professional
We can make this easier. If you start your script with the symbol '#' and next specify the path to the interpreter, the terminal will feed this script automatically to the right interpreter for you! To see what this means, follow these steps.
> Find out the path to the program bash
```
which bash
/bin/bash
```

Now we know the path to bash, we have to provide this path, on the very first line, preceded by **#!** (shebang or crunchbang). If you have another type of script, let's say perl, you find out the path to perl, and at this path behind a #! on the very first line.
> Open the text file 'buddy', and add at the start of the file '#!' followed by the path to bash:
```
nano buddy
```

... edit the text
```
cat buddy
#!/bin/bash
badday="Cheer up"
goodday="Doing great"
echo "$badday, $USER !"
echo "$goodday, $USER !"
```

> Before turning the text file into a script, set the execute permission (to allow execution) with chmod
```
chmod +x buddy
```

> What type of file is your script?
```
file buddy 
buddy: Bourne-Again shell script, ASCII text executable
```

By setting the **shebang**, the interpreter on the command line knows that this is a bash script! 
> Now run your script as if it were a program (./<script_name>)
```
./buddy
Cheer up, bits !
Doing great, bits !
```

To make it more readable, often the extension **.sh** is given to the text file. Note that this is not necessary! Linux does not define file types by extensions.
> Rename your script to 'buddy.sh'
```
$ mv buddy buddy.sh
```

> **Alternative (less typing!)**
```
$ mv buddy{,.sh}
```

### A good habit

>The last line of your script should be 'exit 0'. If bash reaches this lines, it means that the script was successfully executed. Add it by opening the file with 'nano' and modifying its contents.
```
$ cat buddy.sh 
#!/bin/bash
badday="Cheer up"
goodday="Doing great"
echo "$badday, $USER !"
echo "$goodday, $USER !"
exit 0
```

> Alternative. Less typing! 
```
echo "exit 0" >> buddy.sh
```

This was our first bash script! I hope it was a painless experience.

## Download a Perl script
Many bioinformatics programs are written in python or perl. It's quick to type some python or perl code in a text file, and get your job done. Those scripts are **text files**. You can download and store scripts on your computer. Usually these files have .py or .pl extension. As long as you have python or perl on your system (by default in Linux!), you can run the scripts. 

### Run perl code
Let's try a small script below.

- Download a simple perl script [here](http://data.bits.vib.be/pub/trainingmaterial/introduction_to_linux_for_bioinformatics/motifs_new.pl)
- Download the dna file [here](http://data.bits.vib.be/pub/trainingmaterial/introduction_to_linux_for_bioinformatics/dna.txt)
- Save the file, under ~/Downloads for now.
- Open Geany on your computer, and copy the script code to Geany.
- Execute the script by clicking the little 'gear' box. For this script, you will need to download the dna.txt file as input.
- The results of the script appear in a small window. It will ask for an input (depending on your script). Enter the required details.

### Extract some lines ## 

> Download the bed file [here](http://data.bits.vib.be/pub/trainingen/Linux/TAIR9_mRNA.bed) via command line 
```
wget http://data.bits.vib.be/pub/trainingen/Linux/TAIR9_mRNA.bed
```

> Look at the first 10 lines of this file. 
```
$ head TAIR9_mRNA.bed 
chr1	2025600	2027271	AT1G06620.1	0	+	2025617	2027094	0	3	541,322,429,	0,833,1242,
chr5	2625558	2628110	AT5G08160.1	0	-	2625902	2627942	0	6	385,143,144,186,125,573,	2167,1523,1269,928,659,0,
chr5	2625558	2628110	AT5G08160.2	0	-	2625902	2627942	0	7	258,19,143,144,186,125,573,	2294,2167,1523,1269,928,659,0,
chr4	12006985	12009520	AT4G22890.5	0	+	12007156	12009175	0	10	370,107,97,101,57,77,163,98,80,263,	0,802,1007,1196,1392,1533,1703,1945,2120,2272,
chr4	12007040	12009206	AT4G22890.2	0	+	12007156	12009175	0	9	315,113,97,101,57,77,163,98,101,	0,741,952,1141,1337,1478,1648,1890,2065,
chr4	12006985	12009518	AT4G22890.3	0	+	12007156	12009175	0	10	370,113,97,101,57,77,163,98,80,257,	0,796,1007,1196,1392,1533,1703,1945,2120,2276,
chr4	12006985	12009520	AT4G22890.4	0	+	12007156	12009175	0	10	370,104,97,101,57,77,163,98,80,263,	0,805,1007,1196,1392,1533,1703,1945,2120,2272,
chr4	12006985	12009520	AT4G22890.1	0	+	12007156	12009175	0	10	370,113,97,101,57,77,163,98,80,263,	0,796,1007,1196,1392,1533,1703,1945,2120,2272,
chr2	14578539	14581727	AT2G34630.2	0	+	14578688	14581632	0	11	293,93,81,72,132,87,72,86,133,189,275,	0,797,1120,1320,1488,1711,1898,2165,2435,2649,2913,
chr2	14578629	14581727	AT2G34630.1	0	+	14579725	14581632	0	11	203,96,81,72,132,87,72,86,133,189,275,	0,704,1030,1230,1398,1621,1808,2075,2345,2559,2823,
```

This is a typical bioinformatics text file, with every row divided in field by tabs. 
> Extract all lines that start with chr1 from the TAIR9_mRNA.bed and put them in a new text file “chr1_TAIR9_mRNA.bed”.
```
 $ grep "^chr1" TAIR9_mRNA.bed > chr1_TAIR9_mRNA.bed
```

### Checking the data ##

> Download human chromosome 21 from [this link](https://data.bits.vib.be/pub/trainingen/Linux/Homo_sapiens.dna.chromosome21.zip) and unzip the file.
```
wget https://data.bits.vib.be/pub/trainingen/Linux/Homo_sapiens.dna.chromosome21.zip
```

```
unzip Homo_sapiens.dna.chromosome21.zip
```

Entries in a fasta file start with > 
> How many entries are in that fasta file? Remember you can combine commands with a |.
```
grep "^>" Homo_sapiens.GRCh37.73.dna.chromosome.21.fa | wc -l
```

### How many?

Use the TAIR9_mRNA.bed file used in the first exercise. Remember it looks like this
```
chr1	2025600	2027271	AT1G06620.1	0	+	2025617	2027094	0	3	
chr5	2625558	2628110	AT5G08160.1	0	-	2625902	2627942	0	6	
chr5	2625558	2628110	AT5G08160.2	0	-	2625902	2627942	0	7	
chr4	12006985	12009520	AT4G22890.5	0	+	12007156	12009175	0	10	
chr4	12007040	12009206	AT4G22890.2	0	+	12007156	12009175	0	9	
```

If you want to find entries that lie on the + strand of a certain chromosome, you need to find lines that start with the chromosome number and that contain a + sign. The number of characters between the chromosome number and the + sign is variable.
> How many genes are lying on the + strand of the first chromosome ?
> Since you need to use the + sign to represent a set of characters of variable length you need to use egrep for this:
```
grep "^chr1.+\+" TAIR9_mRNA.bed | wc -l
```

### More complex extraction

Get the last exon size for all mRNA records in Arabidopsis. Use TAIR9_mRNA.bed for this: this file contains the exon sizes. See the [.BED page](https://wiki.bits.vib.be/index.php/.bed) to check that the field we need is field 11. This contains a comma separated list of the sizes of all the exons of a mRNA
> Get the exon sizes for all mRNA records in Arabidopsis. Write them to a file called exons.txt
```
awk '{ print $11 }' TAIR9_mRNA.bed > exons.txt
```

> Take a look at the first 10 lines of exons.txt
```
head exons.txt
```

If we try to print the last field with awk, using ',' as a delimiter, things go wrong:
```
awk -F',' '{ print $NF }' > lastexons.txt
```

The reason is that the last field is empty, because the lines end with a ','. We need to remove the last ',' and can use sed for this.
> Remove the last comma from the lines and save in a file called exonsclean.txt. You want to substitute the comma at the end of the line by nothing:
```
sed 's/,$//' exons.txt > exonsclean.txt
head exonsclean.txt
```

> Fetch the last field from exonsclean.txt and save in a file called lastexons.txt
```
awk -F',' '{ print $NF }' exonsclean.txt > lastexons.txt
head lastexons.txt
```

> Sort exonsizes from largest to smallest into a file called lastexonssort.txt
```
sort -nr lastexons.txt > lastexonssort.txt
head lastexonssort.txt
```

You can use uniq to summarize the results
```
uniq -c lastexonssort.txt | head
      2 6885
      1 5616
      1 5601
      1 5361
      1 5239
      1 4688
      2 4470
      1 4446
      1 4443
      1 4275
```

### Analyzing a short read alignment

SAM ('sequence alignment map') file format is the format which summarizes the alignment of reads to a reference genome. Is is one of the key files in NGS analysis, and you can learn a lot from it. See the [SAM page](https://wiki.bits.vib.be/index.php/.sam) for a description of this format.
> Download the sam file from [here](http://data.bits.vib.be/pub/trainingen/Linux/sample.sam)
```
wget http://data.bits.vib.be/pub/trainingen/Linux/sample.sam 
```

> How many lines has the SAM file?
```
wc -l sample.sam
```

100015 lines

> How many lines start with '@', which is the comment symbol in the SAM format.
```
grep '^@' sample.sam | wc -l
```

15 lines

You can use grep to skip the lines starting with '@', since they are comment lines.
```
grep -v '^@' sample.sam | head
```

> Write the FLAG field (second field) to a file called flags.txt and pipe the grep results to awk to print the second field.
```
grep -v '@' sample.sam | awk '{ print $2 }' > flags.txt
head flags.txt
```

> Sort and summarize (using uniq) flags.txt and pipe the grep results to awk to print the second field.
```
sort -nr flags.txt | uniq -c
```

> Sort the results on number of times observed (the first field). We build on the previous command, and just pipe the output to sort -nr. We do not have to use the option -k, since sort always takes the first field.
```
sort -nr flags.txt | uniq -c | sort -nr 
```

### Advanced
We use the TAIR9_mRNA.bed to answer this.
First we check how many different genes are in the file. A gene has the code ATG. Splice variants have to same AT number but different version number (the numbers after the . are different. We are not interested in splice variants so want to remove the .1, .2... before counting. You can do this by using the . as a field delimiter
> Remove everything after the . and save in a file called TAIRpart.txt
```
awk -F'.' '{ print $1 }' TAIR9_mRNA.bed > TAIRpart.txt
head TAIRpart.txt
```

Now you need to summarize the fourth column of this file and count the lines of the result
> How many different genes are in the file?
```
cut -f4  TAIRpart.txt | sort | uniq | wc -l
```

27379

When you look at TAIR9_mRNA.bed you see that the the fifth column contains 0.
> Check if there is any entry that contains another number in that column ? (summarize will give you the answer)
```
cut -f5 TAIR9_mRNA.bed | sort -nr | uniq -c
```

No
Another example: Show all Arabidopsis mRNA with more than 50 exons
```
awk '{ if ($10>50) print $4 }' TAIR9_mRNA.bed
```

> Print the number of exons (field number 10) of mRNAs from the first chromosome.
```
grep '^chr1'  TAIR9_mRNA.bed | awk '{ print $10 }' 
```

> Obtain AT numbers (field 4) and exon info (field 11)
```
awk '{ print $4,",",$11 }'  TAIR9_mRNA.bed 
```

## Bash Aliases to enhance your productivity

You specify aliases in the **.bashrc file** in your home directory. 
```
alias myalias="<my fancy command>"
```

Change 'my fancy command' to a real command!!
Before you can use your new aliases, you have to reload the .bashrc file. You do this by 
```
$ source ~/.bashrc
```

or 
```
$ . ~/.bashrc
```

Now, let's do this exercise.
Sometimes you might want to open a big text file from the end on, and start scrolling towards the top. We will create an **alias** for this in this exercise.
> Create an alias that starts scrolling from the bottom. Tip: it's less and the appropriate option you must configure. Read through the man page of less. To help you: you can search for the string "at the end". Open the man page of less 
```
$ man less
```

> Type "/at the end" and <ENTER>. Less will search in the content for "at the end". Examine the entries with the string./ Go to the following result by typing "/" followed by ENTER.
> The option is: add the alias by opening .bashrc with an editor, and adding the line:
```
alias sell="less +G"
```

> When you have changed the content of .bashrc, it needs to be reloaded. Close your terminal and fire it up again. OR execute:
```
$ . ~/.bashrc
```

```
$ source ~/.bashrc
```

> We now have **sell** to our disposal, which starts scrolling large text files from the end of the file.
```
$ sell /var/log/syslog
```

### Show all aliases on your system

Forgot an alias? To see all your aliases, run the command 
```$ alias```.

## Writing loops

**For** loops are used to repeat commands a number of times. We will start with two simple examples.
> Write a for loop to create 3 files: test1.txt, test2.txt, test3.txt
```
for i in 1 2 3
do
touch test$i.txt
done
ls -l
```

> Write a for loop to create 3 folders: folder1, folder2, folder3
```
for i in 1 2 3
do
mkdir folder$i
done
ls -l
```

