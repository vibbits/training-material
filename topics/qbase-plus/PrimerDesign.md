---
layout: tutorial_hands_on

title: "Primer design exercises"
questions:
  - "How do you perform a qPCR analysis using the qbase+ software?"
objectives:
  - "Design qPCR experiments"
  - "Design qPCR primers"
  - "Use the qbase+ software to analyze the qPCR experiment results."
time_estimation: "5m"
contributors:
  - chdeb 
---
The following exercise will make you familiar with the Primer3Plus software for designing primers for PCR. Primer3Plus is the user-friendly version of Primer3, the standard software for primer design.

### Criteria for qPCR primers

Primers for qPCR have to follow all the gudelines for regular primers is and an additional set of rules specific for qPCR primers:

  - qPCR products are small: 80-160 bp
  - use intron or exon-exon junction spanning primers to detect genomic DNA contamination in the RNA samples. Primers of intron spanning primer pairs are located at both sides of an intron and will therefore generate a larger product on genomic DNA (containing the intron). Primer pairs containing an exon-exon junction spanning primer will not generate a PCR product on genomic DNA since the exon-exon junction only exist in the cDNA.
  - primer length between 9 and 30 bp with an optimum at 20 bp
  - melting temperature (Tm) of the primers between 58 and 60°C with an optimum at 59°C
  - maximum Tm difference between the primers of a pair: 2°C
  - GC content of the primers between 30 and 80% with an optimum at 50%
  - the 5 nucleotides at the 3' end of the primers should have no more than 2 G or C bases
  - avoid runs of 4 or more identical nucleotides (especially Gs)
  - primers must specifically target the region you want to amplify

There are many programs for designing primers, the most important ones:

  - [Primer3](http://frodo.wi.mit.edu/) \[1\] or use it's user-friendly version: [Primer3Plus](http://primer3plus.com/cgi-bin/dev/primer3plus.cgi)\[2\]
  - [PrimerBLAST](http://www.ncbi.nlm.nih.gov/tools/primer-blast/index.cgi?LINK_LOC=BlastHome)\[3\]

The major downside of Primer3 and Primer3Plus is the fact that you have to check the specificity of the primers yourself. Primer3 will suggest a number of primer pairs that fulfill all of the above requirements, but Primer3 will not check the specificity of the primers. So you have use BLAST to check the specificity of the suggested primer pairs. Very often, the selected primers are not specific and you have to repeat the entire Primer3 analysis.
If you use Primer3 and do the BLAST yourself, BLAST against Refseq sequences unless they are not available for the organism you work with or you have reasons to believe that they are not complete (i.e. they do not represent the full genome). For model organisms, you can BLASTagainst the Refseq database. Limit the database to sequences from the organism you work with.
Additionally, it is especially important to check that the primers are specific at the 3' end because that's the site where the polymerase will attach nucleotides. So it is recommended to not use primers that contain long identical stretches (\> 15nt for primers of 20nt long) to other regions in the genome, and certainly not if these stretches comprise the last nucleotide at the 3' end of the primer.
For these exercises we will use PrimerBLAST since [it uses the same algorithm to pick primers as Primer3](http://www.ncbi.nlm.nih.gov/tools/primer-blast/primerinfo.html) \[4\] and does the specificity check for you\!

## Designing qPCR primers for the fruit fly tap gene

### Designing qPCR primers using PrimerBLAST

The RefSeq entry NM_079400 contains the sequence of the D. melanogaster mRNA coding for tap, the target of Poxn. Tap encodes a bHLH protein expressed in larval chemosensory organs and involved in the response to sugar and salt. We wish to amplify the region encoding the Helix-loop-helix domain. In the sequence of the RefSeq record, the domain is located between position +577 and +745.
We want to design qPCR primers for measuring the expression level of the hlh domain using SYBR green. Remember that it is advised to design intron/exon-exon junction spanning primers for qPCR experiments that are based on fluorescent labels to detect/avoid amplification of contaminating genomic DNA.

| Check in NCBIs Gene database if the hlh domain contains any introns ? |
| :------------------------------ |
|To know the location of the introns, you need the genomic sequence instead of the mRNA sequence.

 - Go to <a href="https://www.ncbi.nlm.nih.gov/nuccore/NM_079400">the NCBI RefSeq record</a>.
 - In the right menu click the link to the <strong>Gene</strong> record
 - In the <strong>Genomic regions, transcripts and products</strong> secton you can see that the gene contains no introns: the transcript is not chopped up into pieces when aligned to the genome. Click <a href="https://www.ncbi.nlm.nih.gov/gene/39934">here</a> for an example of a gene with introns.

Next, we will design primers to measure the expression of the hlh domain.

| Go to Primer BLAST by using the link in the Refseq record |
| :------------------------------ |
|Go back to the RefSeq mRNA record. There, you can go directly to PrimerBLAST by clicking the <b>Pick Primers</b> link in the <b>Analyze this sequence</b> section of the right menu.

Since you want to measure the expression of the hlh domain you want
primers that are located inside the domain.

| Define the range of the sequence in which you want to design primers. |
| :------------------------------ |
|You have to specify the range as follows:

| Define the primer parameters to comply with the rules of qPCR primer design: product size and Tm. |
| :------------------------------ |
|To comply with the rules for qPCR primer design, you have to change the settings for PCR product size and melting temperature:

The PrimerBLAST automatically decides to check primer specificity in the Drosophila (organism ID: 7227) RefSeq mRNA database which is exactly what you want. For the qPCR you are going to use RNA samples from fruitfly. This means that the primers will only come into contact with Drosophila mRNAs so you only have to check their specifity in this database.
<thead>
<tr class="header">
<th style="text-align: left;">Make sure the last 2 nucleotides are completely specific. |
| :------------------------------ |
|You want to ensure that the 3' end of the primers really is specific:

The PrimerBLAST gives you a set of 9 primer pairs that are specific (according to the criteria that you have specified) and that fulfill all other requirements that you have defined. Look at the detailed report of the first primer pair:

All parameters are quite self-explanatory except for the Self complementary and Self 3'complementarity scores.

  - The first score represents the local alignment score when aligning a primer to itself. The scoring system gives 1.00 for a match, -1.00 for a mismatch. This means that the lower the score (the more mismatches), the less likely that the primer binds to itself.
  - The second score represents the global alignment score when aligning a primer to itself. Here again, the lower the score, the better.

The scores are followed by information on the specificity of the primer: alignments of the two primers to all target sequences from the database that match the criteria that you specified. In these alignments dots represent matching nucleotides while letters represent mismatches. A specific primer pair will have two alignments (one for each primer): both perfect alignments (all dots) to the sequence you want to amplify.

### Analyzing primer characteristics using OligoAnalyzer

[OligoAnalyzer](https://eu.idtdna.com/calc/analyzer) is a tool implemented by ID\&T (who sell primers) to check the characteristics of your primers. Take the first primer that is suggested by Primer-BLAST, the pair resulting in a product of 100bp.

| What's the Tm of the first primer ? |
| :------------------------------ |
|Copy the sequence of the first primer in the <b>Sequence</b> box, adjust the concentrations to these that are typically used in PCR (see slides) and click <b>Analyze</b>:
As you can see the predicted melting temperature is 63.9 ºC, which is slightly different from the prediction made by BLAST. There are many different methods to predict Tm and each method will give a different result. Assumed concentrations of primers and ions have an enormous impact on the Tm prediction. So don't worry about these differences: these are theoretical calculations anyway, the only way to determine Tm values is by doing actual PCR. As long as the difference in Tm between the two primers is not too large, everything is fine.

| What's the Tm of the second primer ?                                                                                                                                             |
| :------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Copy the sequence of the second primer in the <b>Sequence</b> box and click <b>Analyze</b>. The predicted melting temperature is also 63.9 ºC , the same Tm as the first primer. |

Remember that the second primer had a large Self complementarity score according to PrimerBLAST.

| Check the self-complementarity of the second primer in OligoAnalyzer ? |
| :------------------------------ |
|Click <b>Self-Dimer</b>:

You see that the highest scoring alignment indeed has 6 matches, giving a score of 6 as predicted by PrimerBLAST.

| Do you expect this self-complementarity will give problems in the PCR ? |
| :------------------------------ |
|No, the complementarity is concentrated at the center of the primer, not at the 3' end. Since polymerases add bases at the 3’ end of the primer, the primer duplex cannot be extended so it will not give rise to aspecific products. <a href="https://eu.idtdna.com/pages/docs/default-source/default-document-library/idt_self-dimer_and_hetero-dimer_results_guide.pdf">ID&amp;T recommends to avoid complementary stretches of more than 2 bp at the 3’ end</a>.
However, even if the primer dimer cannot be extended, it could interfere when its formation competes with the annealing of primer and target. This is only the case when the stability of the dimer is similar to the stability of a perfectly matched primer-target duplex. The stability of the perfectly matched duplex is shown as a Maximum Delta G at the top of results. So non-extendable dimer structures that are much shorter than the intended duplex, as we have here, are not going to disrupt the PCR reaction.
It is advised to review all possible interactions between primers so both Self-Dimer (primers binding to themselves) and Hetero-Dimer (primers binding to each other) interactions between primers are examined.

| Is it likely that the primers bind to each other ? |
| :------------------------------ |
|Click <b>Hetero-Dimer</b>:

This opens a text box to enter the second primer. Click <b>Analyze</b>. There is one structure (the fourth one) that looks problematic because there is a stretch of 3 matching nucleotides at the 3'end of one of the primers.

So you might consider taking a look at the second pair of primers that PrimerBLAST suggests. On the other hand, this structure is has relatively high free energy (delta G). The structure with the lowest total free energy, the target-primer duplex, is most important because it will dominate in solution. Structures with higher free energy are less stable and will be present in smaller amounts in the reaction mixture.

Take a look at the second primer pair that was suggested by PrimerBLAST.

| Is it likely that these primers bind to each other ?                                 |
| :----------------------------------------------------------------------------------- |
| No these primers do not form duplex structures that could pose a problem during PCR. |

## Designing qPCR primers for the human F9 gene

### Designing qPCR primers using PrimerBLAST

The RefSeq entry NM_000133.3 contains the sequence of the human mRNA coding for coagulation factor F9. The gene contains 8 coding exons and gives rise to a transcript of 2780 bp encoding a protein of 461 amino acids.
Next, we want to design primers to measure the expression of the F9 gene.

Go to [the RefSeq record of this transcript](http://www.ncbi.nlm.nih.gov/nuccore/NM_000133.3) to study its structure. When you scroll down to the <b>features</b> section you see that the CDS is located from position 40 to position 1415. Since RNA degradation starts at the 5'end of transcripts, we don't want to pick primers at the 5'end. On the other hand, we don't want to pick primers in the long 3'UTR either because it doesn't contain any introns (the exons are all coding) and we want to design exon-exon junction or intron spanning primers.
Let's try to find exon-exon junction spanning primers between position 400 and 1600, with optimal anneal temperature = 60.

| Find primers that fulfill the above defined criteria |
| :------------------------------ |
|Go to <a href="http://www.ncbi.nlm.nih.gov/tools/primer-blast/index.cgi?LINK_LOC=BlastHome">PrimerBLAST</a> and fill in the form as follows:

Exclude predicted sequences in the database to search in .

| Find primers that fulfill the above defined criteria |
| :------------------------------ |
|Go to <a href="http://www.ncbi.nlm.nih.gov/tools/primer-blast/index.cgi?LINK_LOC=BlastHome">PrimerBLAST</a> and fill in the remainder of the form as follows:

The PrimerBLAST gives you a set of 10 primer pairs. Look at the detailed
report of the first primer pair:

As you can see the primers are not specific: they can bind to various other targets albeit with lower affinity because of the mismatches . The best option seems to be primer pair 7, which binds to both F9 transcript variants and potentially to one unintended target, but as you can see the last nucleotide at the 3' end of both primers are specific.

### In silico PCR in the UCSC Browser

We will proceed using the third primer pair Primer-BLAST suggests. You can visualize the PCR product (and additional annotation) in the UCSC Genome Browser using [UCSC's In Silico PCR tool](http://genome.ucsc.edu/cgi-bin/hgPcr).
Select the most recent version of the human genome and paste the sequences of forward and reverse primers in their respective boxes. Click <b>submit</b>
Normally, this returns the location and the sequence of the PCR product but our primer pair doesn't return a match. When you think about this was to be expected since we are working with exon-exon junction spanning primers that are not able to match the genome sequence. So checking SNPs is not so straight-forward in the case of exon-exon junction spanning primers.
We will repeat the primer search now searching for intron-spanning primers to show you how to use the in silico PCR tool. Taking into account the fact that the results for the exon-exon junction spanning primers were so messy we will make the search more stringent this time:

  - We will the minimum number of mismatches to 4
  - and at least 3 mismatches in the last 3 bps at the 3'end

| Find intron spanning primers that fulfill the above defined criteria |
| :------------------------------ |
|Go back to the Primer-BLAST and fill in the form like in the previous exercise except that they should span an intron:

Primer-BLAST returns 10 primer pairs. Again the seventh primer pair is
the specific one.

| Take the seventh suggested primer pair and check for SNPs in the UCSC Browser |
| :------------------------------ |
|Go to <a href="http://www.ncbi.nlm.nih.gov/tools/primer-blast/index.cgi?LINK_LOC=BlastHome">PrimerBLAST</a> and paste the sequences of forward and reverse primers in their respective boxes.
This time the search finds a PCR product:

Clicking the location visualizes the PCR product in the UCSC genome browser. Remove unnecessary trancks by right clicking the box in front of them and selecting <strong>hide</strong>

Add tracks showing relevant annotation like position of SNPs...

Setting the SNPs track from <b>hide</b> to <b>full</b> shows the SNPs in the browser. Center the forward primer by grabbing and dragging it to the center.

Zoom in to <strong>base</strong> display to see if the forward primer is matching any SNPs.

As you can see the forward primer does match two SNPs but none of them are located near the 3'end of the primer.

1.  <http://frodo.wi.mit.edu/>
2.  <http://primer3plus.com/cgi-bin/dev/primer3plus.cgi>
3.  <http://www.ncbi.nlm.nih.gov/tools/primer-blast/index.cgi?LINK_LOC=BlastHome>
4.  <http://www.ncbi.nlm.nih.gov/tools/primer-blast/primerinfo.html>