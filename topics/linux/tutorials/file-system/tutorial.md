---
layout: tutorial_hands_on

title: "03 Linux file system"

questions:
  - "How to get started with the file system in the terminal?"

objectives:
  - "get familiar with the most essential commands"
  - "learn what commands to use when navigating the file system"

time_estimation: "30m"
key_points:
  - "Where can I find my files"
  - "What are useful commands for file system operations"

contributors:
  - chdeb
---
## Tutorial on the linux file system

### Which protocol achieves highest compression ratio?
Let's do a little test. Download [this compressed file](http://data.bits.vib.be/pub/trainingmaterial/introduction_to_linux_for_bioinformatics/data_linux_training.tar.gz).

> Create a folder named 'Compression_exercise' in your home. Copy the downloaded tar.gz to it.
```
$ cd
$ mkdir Compression_exercise
$ cp Downloads/data_linux_training.tar.gz Compression_exercise/
```

> Unpack the data_linux_training.tar.gz  file.
```
$ tar -xvzf data_linux_training.tar.gz 
```

Alternative: you can specify the options without the '-' sign.
```
$ tar xvfz data_linux_training.tar.gz 
```

> Decompress the file DRR000542_1.fastq.subset.gz

```
$ gunzip DRR000542_1.fastq.subset.gz
```

> Copy the DRR000542_1.fastq.subset file to a new file called 'bzip2_test.fastq'. Compress this file with bzip2.

```
$ bzip2 bzip2_test.fastq
```

'''Tip''' If you would like to know how long the command took to finish, use '''time'''
```
$ time bzip2 bzip2_test.fastq
real	0m5.878s
user	0m5.728s
sys	0m0.112s
```

Three different times are given. What matters to you is the line 'real', also called the wall-clock time.

> Copy DRR000542_1.fastq.subset file to a new file called gzip_test.fastq and compress with gzip.
```
$ time gzip gzip_test.fastq
real	0m5.878s
user	0m5.728s
sys	0m0.112s
```

A relatively unknown package is lrzip, 'long range zip', which achieves very good results on big files. Let's try that one also!

> Copy DRR000542_1.fastq.subset file to a new file called lrzip_test.fastq and compress with lrzip.

```
$ lrzip lrzip_test.fastq
The program 'lrzip' is currently not installed.  You can install it by typing:
sudo apt-get install lrzip
```
'''apt-get''' is the command line tool to install software on Debian distro's. Equivalent to the software center.
```
$ sudo apt-get install lrzip
[sudo] password for joachim: 
Reading package lists... Done
Building dependency tree       
Reading state information... Done
The following packages were automatically installed and are no longer required:
  libnet-ip-perl diffstat libnet-dns-perl libparse-debianchangelog-perl
  gir1.2-unique-3.0 kde-l10n-engb python-webpy libnet-domain-tld-perl
  libemail-valid-perl libapt-pkg-perl python-flup kde-l10n-zhcn
Use 'apt-get autoremove' to remove them.
The following NEW packages will be installed:
  lrzip
0 upgraded, 1 newly installed, 0 to remove and 0 not upgraded.
Need to get 159 kB of archives.
After this operation, 313 kB of additional disk space will be used.
Get:1 http://be.archive.ubuntu.com/ubuntu/ precise/universe lrzip amd64 0.608-1 [159 kB]
Fetched 159 kB in 0s (780 kB/s) 
Selecting previously unselected package lrzip.
(Reading database ... 662617 files and directories currently installed.)
Unpacking lrzip (from .../lrzip_0.608-1_amd64.deb) ...
Processing triggers for man-db ...
Setting up lrzip (0.608-1) ...
```

Now we can compress:
```
Output filename is: lrzip_test.fastq.lrz
lrzip_test.fastq - Compression Ratio: 6.724. Average Compression Speed:  0.563MB/s.
Total time: 00:03:02.97
real	3m3.026s
user	3m1.947s
sys	0m0.804s
```

> Compare the sizes of the different resulting compressed files.

```
 $ ls -lh *zip*
-rw------- 1 bits bits 17M Oct 22 14:06 bzip2_test.fastq.bz2
-rw------- 1 bits bits 21M Oct 22 14:06 gzip_test.fastq.gz
-rw------- 1 bits bits 104M Oct 22 14:06 lrzip_test.fastq
-rw------- 1 bits bits 16M Oct 22 14:10 lrzip_test.fastq.lrz
```

Decide for yourself whether the extra time needed for higher compression is worth the gain in compression.

> Put the three files in a newly created folder 'results', and make an archive of it.

```
$ mkdir results
$ mv  *{bz2,q.gz,lrz} results/
$ ls results/
bzip2_test.fastq.bz2  gzip_test.fastq.gz  lrzip_test.fastq.lrz
$ tar cvf results.tar results/
$ rm -rf results/
$ ls -lh
total 281M
-rw------- 1 bits bits 104M May  4  2011 ERX000016.test.fastq
-rw-r--r-- 1 bits bits 21M Oct 22 14:02 ERX000016.test.fastq.tar.gz
-rw------- 1 bits bits 104M Oct 22 14:06 lrzip_test.fastq
-rw-r--r-- 1 bits bits 53M Oct 22 14:28 results.tar
```

### Symbolic links
Symbolic links (symlinks) point to a file, making the file accessible in another directory than where the file is. So you can avoid copying! When the original file is deleted, the symlink is dead. When you remove the symlink, the original file is still present. 
The syntax for symbolic links is:
```
$ ln -s /home/bits /data/large.fastq /home/bits /Projects/ProjectA/
```

Tip: when using **ln**, preferably provide absolute paths. If you want to use relative paths, make sure first going to the directory you want the link to be in, and create the link using a relative path (using '.' and '..' to make the path).

Removing symbolic links as such:
```
$ unlink /home/bits /Projects/ProjectA
```

In contrast, there is also something as a "hard link" (ln without the -s option). When you delete a hard link, the file to which it referred is gone. So 'ln -s' is mostly used.

### Linking data instead of copying
In the Rice Example directory (should be available under your home): download [http://rice.plantbiology.msu.edu/pub/data/Eukaryotic_Projects/o_sativa/annotation_dbs/pseudomolecules/version_7.0/all.dir/all.gff33 this annotation file] into the 'Genome data'/'Annotation' directory. Make a symbolic link to this file in the 'Genome data'/'Sequence' directory. Read the first 10 lines from the symbolic link file.
> When you have tried yourself, see the solution.
```
$ cd Rice\ Example/
~/Rice Example $ ls
bin  Genome data
~/Rice Example $ cd Genome\ data/Annotation/
~/Rice Example/Genome data/Annotation $ ls
~/Rice Example/Genome data/Annotation $ wget http://rice.plantbiology.msu.edu/pub/data/Eukaryotic_Projects/o_sativa/annotation_dbs/pseudomolecules/version_7.0/all.dir/all.gff3
--2013-10-28 11:45:26--  http://rice.plantbiology.msu.edu/pub/data/Eukaryotic_Projects/o_sativa/annotation_dbs/pseudomolecules/version_7.0/all.dir/all.gff3
           => `all.gff3'
Resolving http://rice.plantbiology.msu.edu (http://rice.plantbiology.msu.edu)... 35.8.196.190
Connecting to http://rice.plantbiology.msu.edu (http://rice.plantbiology.msu.edu)|35.8.196.190|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD (1) /pub/data/Eukaryotic_Projects/o_sativa/annotation_dbs/pseudomolecules/version_7.0/all.dir ... done.
==> SIZE all.gff3 ... 81498659
==> PASV ... done.    ==> RETR all.gff3 ... done.
Length: 81498659 (78M) (unauthoritative)
100%[======================================>] 81,498,659  1.34M/s   in 65s     
2013-10-28 11:46:33 (1.20 MB/s) - `all.gff3' saved [81498659]
~/Rice Example/Genome data/Annotation $ ls ..
Annotation  Sequence
~/Rice Example/Genome data/Annotation $ cd ../Sequence/
~/Rice Example/Genome data/Sequence $ ln -s ../Annotation/all.gff3 .
~/Rice Example/Genome data/Sequence $ ls -l
total 381300
lrwxrwxrwx 1 bits bits 22 Oct 28 11:49 all.gff3 -> ../Annotation/all.gff3
-rw-r--r-- 1 bits bits 390444160 Mar  8  2013 IRGSPb5.fa.masked
-rw-r--r-- 1 bits bits 55 Mar  8  2013 IRGSPb5.fa.masked.gz.md5
~/Rice Example/Genome data/Sequence $ head all.gff3 
##gff-version 3
Chr1	MSU_osa1r7	gene	2903	10817	.	+	.	ID=LOC_Os01g01010;Name=LOC_Os01g01010;Note=TBC%20domain%20containing%20protein%2C%20expressed
Chr1	MSU_osa1r7	mRNA	2903	10817	.	+	.	ID=LOC_Os01g01010.1;Name=LOC_Os01g01010.1;Parent=LOC_Os01g01010
Chr1	MSU_osa1r7	exon	2903	3268	.	+	.	ID=LOC_Os01g01010.1:exon_1;Parent=LOC_Os01g01010.1
Chr1	MSU_osa1r7	exon	3354	3616	.	+	.	ID=LOC_Os01g01010.1:exon_2;Parent=LOC_Os01g01010.1
Chr1	MSU_osa1r7	exon	4357	4455	.	+	.	ID=LOC_Os01g01010.1:exon_3;Parent=LOC_Os01g01010.1
Chr1	MSU_osa1r7	exon	5457	5560	.	+	.	ID=LOC_Os01g01010.1:exon_4;Parent=LOC_Os01g01010.1
Chr1	MSU_osa1r7	exon	7136	7944	.	+	.	ID=LOC_Os01g01010.1:exon_5;Parent=LOC_Os01g01010.1
Chr1	MSU_osa1r7	exon	8028	8150	.	+	.	ID=LOC_Os01g01010.1:exon_6;Parent=LOC_Os01g01010.1
Chr1	MSU_osa1r7	exon	8232	8320	.	+	.	ID=LOC_Os01g01010.1:exon_7;Parent=LOC_Os01g01010.1
```

### Introduction: symbolic links to easily install manually applications
If a package is not available via a package manager, manual installation might be an option. I put manually applications in '''/opt'''. Next, I link them to a correct location on our system, usually '''/usr/local/bin'''. Below you have some examples of this, which you can try out yourself.

If you want to manually install apps, '''/opt''' is the advised directory. However, only the administrator ('root') can access /opt. You can check that the /opt directory belongs to root with <pre>ls -l /opt</pre>
To be able to copy and write stuff into /opt, we need root permissions. To do so, precede your commands with '''sudo''', as exemplified in the next exercise below. When we do that, our password will first be asked. Next, the command is executed with root permissions. In this way, we can edit contents in root-owned directories! You are a sudoer!

### Transpose, a tool to transpose
Transpose is an extremely convenient text tool to transpose tabular data. We will use it later. The code is hosted on [http://sourceforge.net/projects/transpose/ SourceForge].

> Download transpose installation file (zip) via the browser. Copy them to /opt using **sudo cp**.
Go to the Sourceforce website with the browser, and click on the Download button.
```
Downloads $ sudo cp transpose-2.0.zip /opt
[sudo] password for joachim: 
 Downloads $
```

We need to precede the ''cp'' command with the ''sudo'' command, since only the root user can copy into ''/opt''.
> Unpack the installation in /opt, compile the binary and test it with 'tranpose --help'. Use sudo to do so.

```
$ pwd
/opt
$ ls trans*
transpose-2.0.zip
$ sudo unzip transpose-2.0.zip 
Archive:  transpose-2.0.zip
   creating: transpose-2.0/
   creating: transpose-2.0/win32-bin/
  inflating: transpose-2.0/win32-bin/transpose.exe  
   creating: transpose-2.0/src/
  inflating: transpose-2.0/src/transpose.c  
  inflating: transpose-2.0/README 
```

The zip file is now unpacked. Let us now compile the code. ALWAYS have a look at the README file for this.
```
$ cd transpose-2.0
$ head README
To Compile:
	gcc transpose.c -o transpose
To Install - Just copy into your path. e.g.:
	cp transpose /usr/local/bin/
$ cd src/
$ sudo gcc transpose.c -o transpose
```

The program **gcc** compiles the human readable code in the file **transpose.c** and produces a binary file out of it, called **transpose**.
> We can now run the binary file from within the directory.
```
$ ./transpose --help
       Description:     
	This software is released under the GPL license
	Reshapes delimited text data - amongst other things, it can transpose a matrix of plain text data.
```

> Create a symbolic link to the newly created binary to /usr/local/bin. This directory collects binaries/commands to be used on the command line.
```
 $ sudo ln -s /opt/transpose-2.0/src/transpose /usr/local/bin
 $ which transpose 
/usr/local/bin/transpose
```

