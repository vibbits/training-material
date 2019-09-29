---
layout: tutorial_hands_on

title: "03 Ecology Analysis using vegan"

questions:
  - "How to do an ecology analysis with the R package vegan?"

objectives:
  - "recapitulate the basics of working with R"
  - "learn how to visualize genus abundance tables"
  - "learn how to normalize abundances"
  - "learn how to use the vegan package including clustering and statistical testing"

time_estimation: "75m"

key_points:
  - "We showed how to install and load packages"
  - "We showed how to access the help system"
  - "We showed how to set the folder to work in"
  - "We showed how to define variables"
  - "We showed how to write a script"

contributors:
  - hildebra
  - janick-bits

---

# Ecology Analysis using vegan 
{:.no_toc}

In this exercise we will look at a data matrix of 16S rRNA counts in 74 samples.

This dataset is the microbiota composition of 74 mice from 5 different mice strains. The original research aim was to define the effect that the mouse genome has on the microbiota and what the effect of living in the same cage would be. However, we found much stronger trends in the data, and these we will look at in this exercise.

The 454 data was already compiled into a matrix with genus abundance per sample in a previous step. This matrix is called a feature abundance matrix, or abundance matrix for short. We will do an ecology-oriented analysis of the data, in later steps also taking metadata (experimental, environmental or clinical data that was collected for each sample, independent of the DNA) into account. The aim of this tutorial is to get an idea of the very basic steps of ecological data analysis using the programming language R.

The gene abundance table (Genus.txt) can be found in the folder /home/VIBTrainingX/NGS/metagenomics/higherLvl folder on the server. Those who are working on their own laptop can download it [from the lotus website](http://psbweb05.psb.ugent.be/lotus/data/LotuStutorial.tar.gz).

1. Set the folder with the provided files as your working directory in R using `setw`. This way required files can be easily loaded. To find out how to use this command, you can type ?setwd() to open the help. If there are other R-commands that you want to know more about, you can open the R-help for that command by entering in the R-prompt `?command`. This will be very useful when working with R, make sure to use this a lot as you can only learn more :o). 


> ### {% icon hands_on %} Hands-on: Exercise 1 
>
>  > ### {% icon question %} Question
>  >
>  > How to set the working directory in R 
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > setwd(“dir_to_data”) 
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }

2. Load the provided data into the matrix M (Genus.txt, actual genus abundance data), using the read.delim command, saving the loaded table as `M`. Make sure, the row names are correctly read in. As R reads the matrix as an object of class data.frame, we convert M from a data.frame to a matrix `M=as.matrix(M)`. This is important for some of the following calculations, where we need a `matrix` class object. 

> ### {% icon hands_on %} Hands-on: Exercise 1 
>
>  > ### {% icon question %} Question
>  >
>  > How to read in data as matrix ? 
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # read in data as matrix
>  > > M = read.delim(file="Genus.txt",row.names=1)
>  > > M = as.matrix(M) 
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }

The matrix you loaded represents the number of 16S sequences assignable to each genus, which we could find in the samples. Also note that not all genera are real genera, but partly assigned unknown sequences. With these groups we do not know if this is a single genus or in fact several genera or in extreme cases even several classes, that just all fall under the same phylum tag. What are the advantages and disadvantages of keeping such undefined groups in the data?
Use the function `edit(M)` to better view the abundance matrix.

3. Let’s look at some  basic features of the abundance matrix. The `summary(M)` command is a good start, but also look at total row and column counts (`colSums`, `rowSums` command). To see how the genera are distributed within each sample, we will plot a sample-wise density plot.We will be using a combination of the `density`, `lines` and `lapply` functions, to draw the densities of values found in each sample. Let’s start with looking at the density of the first sample. In R you can access specific columns by writing the matrix coordinates in square brackets. For example `M[1,]` shows the first row of a matrix, `M[,7]` shows the 7th column etc:

> ### {% icon hands_on %} Hands-on: Exercise 3 
>
>  > ### {% icon question %} Question
>  >
>  > How to estimate density of first sample ? 
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # estimate density of first sample
>  > > densityOfSample1 = density(M[,1])
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }


Look at the object densityOfSample1 by simply entering the object name into the command prompt. Next try to visualize it with `plot(densityOfSample1)`. In this plot you see that most genera are at 0 abundance, some genera have an abundance <10 and some rare genera actually occur with a higher frequency, one genus even having ~1100 16S reads assigned to it. Which genus is this?

Alternatively you can also use the function `hist`, to plot a histogram of the abundances. Try to do this now.

> ### {% icon hands_on %} Hands-on: Exercise 4 
>
>  > ### {% icon question %} Question
>  >
>  > How to plot histogram of abundances ?
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # plot histogram of abundances
>  > > hist(M[,1], nclass = 50)
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }

We can use the `apply` command, to apply the density command to every column of M, which will return a list of density objects. The second argument to the `apply` function is the `margin` and is set to 2, which tells the `apply` function that we want to work on columns (margin = 2) and not on rows (margin = 1). Save this into object  `S_densities`.

> ### {% icon hands_on %} Hands-on: Exercise 5 
>
>  > ### {% icon question %} Question
>  >
>  > How to estimate densities of all samples ? 
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # estimate densities of all samples
>  > > S_densities = apply(M,2,density)
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }



To plot this start with:
```
# open a new plot window and set range of x and y axis
plot(1,1,type="n",ylim=c(0,3),xlim=c(0,5000)) 
```

This will open a new plotting window, already set to the range of x and y coordinates (xlim, ylim) we will need in this example. In this case we just want to plot a blank space, this is done with the `type=n` argument. Try to replace the argument by `type=p`, to actually see that point! S_densities is a list, so we use `lapply` (list apply), in combination with the `lines` function, try this now to plot all the density lines into the open plot window.

> ### {% icon hands_on %} Hands-on: Exercise 6 
>
>  > ### {% icon question %} Question
>  >
>  > How to plot density distributions of all samples ? 
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # plot density distributions of all samples
>  > > lapply(S_densities,lines)
> > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }


What you should see now in the plot window is the density distribution of all samples. The lines function is adding new lines, while a plot function makes a completely new plot. Try to replace the `lines` with `plot` to see this (it’s very fast, so keep a close eye on your plot). How are these lines already telling us something about the differences between the communities of each sample?

4. Maybe you noticed that the `colSums` command showed that the totals are not equal. What does this mean? In this state the data is actually not comparable among each other. One way to `correct` the data for this shortcoming is to normalize the matrix. In this step we will normalize the abundance matrix into variable M1: 

```
# normalize matrix: divide each column by the total of that column
M1 = sweep(M,2,colSums(M),"/")
```

The `sweep` command is extremely useful, as it will apply a simple arithmetic operation (like divide) in a matrix column- or row-wise with a vector of your choice. So it is very similar to `apply`, but takes more basic functions. In this case we will divide each column by the sum of the column, this is called normalization.

Now we will compare these matrices using the `barplot` function. For this we need to open another graphical window, using the `X11` function:
```
# create barplot of original and normalized data
barplot(M)
X11()
barplot(M1)
```

What do you notice about the sample composition? What does the graph mean? Discuss where you would want to normalize the data (and where not).

Close all open plots.

Now replot the sample-wise density plot (as you did in step 3), but start the plot with these adapted x and y ranges. Additionally we will this time label the x- and y-axis:

```
# open a new plot and define ranges and titles of x and y axis
plot(1,1,type="n",ylim=c(0,80),xlim=c(0,1),xlab="relative genus abundance", ylab="Frequency of genera") 
``` 

You will notice that the graph looks different from you previous plot. What changed due to the normalization? Are the samples more similar to each other using M or M1? 

If you spot a difference in species abundance between two samples using matrix M, is this difference real, does it have scientific value?

For the next step the R-library vegan is required. It is a set of functions specifically designed for ecological data analysis. The package has been installed on the bits laptops. If you were to install the package, you could do so using the command: `install.packages(“vegan”)`. More details on the [vegan web site ](http://cc.oulu.fi/~jarioksa/softhelp/vegan.html). Load vegan, using the `library` command.


> ### {% icon hands_on %} Hands-on: Exercise 7 
>
>  > ### {% icon question %} Question
>  >
>  > How to load the vegan package ?
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # load vegan package
>  > > library(vegan)
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }


Let’s try to put the differences we observed in sample density into numbers. To do this, ecologists rely on the concept of diversity. Diversity describes the evenness of species distributions as well as the richness of species that are observed in a given ecological system. We will first calculate the Shannon diversity, using vegan’s `diversity` command. Try to do this per sample, using the `apply` function again. Save the result in object `div`.

> ### {% icon hands_on %} Hands-on: Exercise 8 
>
>  > ### {% icon question %} Question
>  >
>  > How to calculate Shannon diversity index for each sample using the normalized data ? 
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # calculate Shannon diversity index for each sample using the normalized data 
>  > > div = apply(M1,2,diversity,index="shannon")
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }

Now we can see in action what these indices are actually doing for us. Plot the density of the sample with the lowest and highest diversity in red and blue on your previous density plot of M1, this you do by first finding out which diversity indexes are the maximum and minimum values using the `which.max` and `which.min` functions on the object `div`. Don’t forget to have the last density plot still open (or replot it from step 4 on M1), than add the lowest samples as a blue line and the highest sample as a red line, using the `lines` command. 

> ### {% icon hands_on %} Hands-on: Exercise 9 
>
>  > ### {% icon question %} Question
>  >
>  > Find samples with lowest and highest Shannon diversity index and add them to the density plot ? 
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # find samples with lowest and highest Shannon diversity index and add them to the density plot
>  > > which.min(div) #should be bl16
>  > > which.max(div) #should be bl48
>  > > lines(density(M1[,"bl16"],adjust =0.5),col="blue")
>  > > lines(density(M1[,"bl48"],adjust =0.5),col="red")&
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }

You can now readjust the window by changing the `ylim` and `xlim` attribute in the plot function, if necessary (tip, try to rerun using `ylim=c(0,180)`). Try to explain why the colored samples have the highest & lowest diversity. What does this tell about an ecosystem (remember that these are genus abundances).
Raise your hand if you reached this step.

A different way to normalize the data is to sample exactly equal amounts of 16S rDNA for each sample in this experiment. Of course in practice this is impossible to do, but we can simulate this, by randomly selecting a subset of 16S rDNA. This is called rarefaction. Rarefy your original abundance matrix (M) into M2, using 1000 reads per sample, using the `rrarefy` function of vegan. Note that you need to transpose (command `t()`) the matrix, before giving it to `rrarefy`. Transform the matrix back and save it as `M2`.

> ### {% icon hands_on %} Hands-on: Exercise 10 
>
>  > ### {% icon question %} Question
>  >
>  > How to normalize via rarefaction ?
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # Alternative way of normalization
>  > > M2 = t(rrarefy(t(M),sample=2000))  #vegan needs transformed matrix, and we need it back-transformed
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }

Use `colSums(M2)` to check if the rarefaction worked. The main use of rarefaction is in calculating diversity and richness correctly, for this we will look in the following step at observed richness.

The concept of observed richness within a sample is pretty simple (but useful): richness describes the number of different species that occur at least once in a sample. This can be calculated in two steps:

```
# Species present in sample: TRUE or 1 if species is present, FALSE or 0 if species is absent
OnceOrMoreOftenPresent = M1>0
``` 

The sum of each column in this matrix will tell us how many species were detected in total within the respective sample, use the `apply` and `sum` functions , saving the result in `rich1`.

> ### {% icon hands_on %} Hands-on: Exercise 11 
>
>  > ### {% icon question %} Question
>  >
>  > How to calculate the sum of each column ?
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # Calculate sum of each column
>  > > rich1 = apply(OnceOrMoreOftenPresent,2,sum)
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }


Compare the richness values in `rich1` to the richness obtained on the rarefied matrix `M2`, calculated with a shortened command:

```
# Calculate number of present species in each sample using the rarefied data
rich2 = apply(M2>0,2,sum)
``` 

Compare rich1 and rich2 in a matrix value by value. We use the `cbind` command to bind two vectors column wise together, so we get a matrix with 2 columns. Order this matrix by the richness values in rich1, using the `order` command and accessing the vector representation with `[]` square brackets.

```
# Create new matrix with two columns: rich1 and rich2 and order rows according to rich1 values
cbind(rich1,rich2)[order(rich1),]
```

What does the second part of the formula do? What happens if you change that to order(rich2)?

Discuss which richness values have the highest value to the researcher and why the order is very different between these two richness estimates. Is one way clearly wrong?

Why did we choose 1000 as cutoff for the sequences per sample? What is the maximum value we could choose? 

First samples are clustered to see underlying data structures. For this tutorial we will choose a hierarchical clustering, based on a bray-curtis distance between samples, using the function `vegdist`. Make  sure the distances are calculated between Samples and not Genera.

Next, use the function `hclust` on the distance matrix, saving the output in variable `cluster`, and subsequently plot the clustering of the samples (using `plot`).
Take a guess of how many groups there might be in this clustering?

> ### {% icon hands_on %} Hands-on: Exercise 11 
>
>  > ### {% icon question %} Question
>  >
>  > How to cluster samples and plot results ?
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # cluster samples and plot results
>  > > BCD = vegdist(t(M1), dist="bray")
>  > > cluster = hclust(BCD)
>  > > plot(cluster)
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }

To visualize the samples and their relatedness to each other in a two-dimensional space, we can use an ordination to visualize the data in a low dimensional space. The dimensionality of the original matrix (73 genera=73 dimensions) is reduced to two dimensions. If you know what a PCA (Principal component analysis) is, this step will use a conceptually similar, but methodologically quite different technique to perform an ordination of the data, NMDS (non-metric multidimensional scaling).

Start by calculating a 2-dimensional NMDS of the data using M1, using the Bray-Curtis distance in the function `metaMDS`, saving the result to `nmds`. Again, make sure that samples are being ordinated and not Genera.

> ### {% icon hands_on %} Hands-on: Exercise 11 
>
>  > ### {% icon question %} Question
>  >
>  > How to calculate the NMDS ?
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # calculate NMDS
>  > > nmds = metaMDS(t(M1),distance = "bray") #actual NMDS command, matrix needs to be transformed to conform with vegan’s standards
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }

Take a look at the `nmds` object and explore some of its features (e.g. type `str(nmds)` to see what variables are stored within the NMDS object). Try to find out what the `stress` of your ordination is. What does stress stand for (tip: go to the R help on metaMDS)? Next we can visualize the NMDS, similar to what you get out of PCA’s, displaying samples only:
```
# plot NMDS
plot(nmds,display ="sites")
```

The important difference of NMDS compared to PCA is, that NMDS works with any kind of distance metric, while PCA can only use Euclidean distances between samples. A second important feature of NMDS is, that this method finds non-parametric, monotonic relationships between objects; in short: it doesn’t assume a specific data distribution. Why might these two features be important for ecologists? 

You might have noticed that you see two clusters, similar to the hierarchical clustering of the data. We can get for each sample the identity within the two clusters using the `cutree` commands, specifying k=2 (2 clusters). This can be plotted into the NMDS with the following command:

```
# identify clusters
memb = cutree(cluster, k = 2)
ordispider(nmds,memb)
```

Congratulations, you have just visualized the mouse enterotypes. Next we are going to look closer at these. If you want to know the exact methods to detect enterotypes in your data visit [http://enterotype.embl.de/enterotypes.html http://enterotype.embl.de/enterotypes.html]

In the last step, we will test for all the genera in the matrix whether they show significant differences between two clusters. The scientific question we are posing here is: what are the significant differences in the gut microbiota of between enterotypes? We will use a non-parametric test (kruskal-wallis) to do the tests, as ecological data is in most cases not normally distributed. This test is very similar to the student t-test, and the interpretation works just the same way. Use the function `kruskal.test` to test the first genera (M[1,]) for significant differences between the two cluster groups (in object `memb`). Save the output of this command in variable `Kt`.

> ### {% icon hands_on %} Hands-on: Exercise 12 
>
>  > ### {% icon question %} Question
>  >
>  > How to test if there is a difference between the two clusters for the first genus ? 
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # Test if there is a difference between the two clusters for the first genus
>  > > Kt = kruskal.test(M1[1,],memb)
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }


Look at the output of this function. This will show you a human readable summary of the test and the result. You can access elements of a list (`Kt` is a list in this case) using the `$` operator. Try to extract the p-value from the `Kt` object.

Once you know how, we can start to calculate the significance for every genus in the M1 matrix,. These p-values we will store in a newly created vector `pvals`. Let’s add the first 2 p-values to the vector:

```
# Test if there is a difference between the two clusters for the first and second genera. Store p-values in a vector.
pvals = c()
pvals[1] = kruskal.test(M1[1,], memb)$p.value
pvals[2] = kruskal.test(M1[2,], memb)$p.value
```

Since doing this 73 times takes a long time, we will be using a for-loop to `loop` over the matrix and do this for us. We could as well use the apply function, but the syntax would get a little more complicated, since we are only interested in a subpart of the result, the $p.value part. Try to write a for-loop, to calculate the p-value 73 times.

> ### {% icon hands_on %} Hands-on: Exercise 13 
>
>  > ### {% icon question %} Question
>  >
>  > How to test if there is a difference between the two clusters for all genera ? 
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # Test if there is a difference between the two clusters for all genera
>  > > for (i in 1:dim(M1)[1])
>  > > {
>  > >         pvals[i] = kruskal.test(M1[i,], memb)$p.value
>  > > }
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }

As an additional help, you can add the name of the taxa to the pvals vector using the names command (that will name a vector):

```
# Add names to the vector
names(pvals) = dimnames(M1)[[1]] 
```

Which taxa are significantly different?

In this case we will use the normalized M1 matrix, can you explain why we do not use the M or M2 matrix? Would either be wrong to use?

In total we were testing in 73 genera, if their p-value was below a threshold of 0.05. What is the chance of observing data with a p-value >0.05 by random chance? How many genera do you expect to be below this threshold by random chance? 

To avoid statistical errors of this kind, we will use a Benjamini-Hochberg multiple testing correction, implemented in the R function `p.adjust`. Save the result as `qvals`.

> ### {% icon hands_on %} Hands-on: Exercise 14 
>
>  > ### {% icon question %} Question
>  >
>  > How to perform multiple testing correction of p-values using Benjamini-Hochberg method ? 
>  >
>  > > ### {% icon solution %} Solution
>  > > ```
>  > > # Multiple testing correction of p-values using Benjamini-Hochberg method
>  > > qvals = p.adjust(pvals,method ="hochberg")
>  > > ```
>  > {: .solution }
>  {: .question }
{: .hands_on }

What do you see in this test? What would you report on this dataset, based on these values?

Try sorting the q-values to see the most significant differences first:
```
# Sorting q-values
sort(qvals)
```

Now that you have finished the tutorials, you should be able to analyze any new dataset of amplicon data, using the LotuS pipeline and performing a basic analysis with R, including
* Data normalization
* Clustering analysis
* Ordination
* Univariate statistics
You can always expand upon these concepts, using this tutorial as starting point. Just remember that R is a very flexible language, and all these commands can be expanded for new purposes and visualizations.

### Data sources
All the material provided in this tutorial are from metagenomic study on mice knockouts. Further analysis of the data can be found in the reference below.

### Reference 

Hildebrand, F., Nguyen, A. T. L., Brinkman, B., Yunta, R. G., Cauwe, B., Vandenabeele, P., … Raes, J. (2013). Inflammation-associated enterotypes, host genotype, cage and inter-individual effects drive gut microbiota variation in common laboratory mice. Genome Biology, 14(1), R4. doi:10.1186/gb-2013-14-1-r4

