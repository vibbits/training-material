---
layout: tutorial_hands_on

title: 03 Compare Structures
zenodo_link: ''
questions:
- how to structurally align protein structures
objectives:
- Use rigid body structural alignment in YASARA
time_estimation: 15M
key_points:
- Superimposition of related structures is a very efficient approach to spot similarities and differences of structutally related proteins.
contributors:
- abotzki
- jvdurme

---

## Structural comparison and RMSD
We compare structures by structurally aligning them on top of each other. That is, we
align structurally equivalent atoms. For now, we will only use CA atoms as a representation of the backbones. 
But Yasara also can align on any type of atom you want. You always need to specify:

-  source object(s): the structure(s) that needs to be rotated and translated to superpose on anoth
er structure
-  target object: the structure to superpose on

An optimal alignment is found when the root-mean-square deviation (RMSD) is at a minimum.
The RMSD is given as follows, where R is the distance between two structurally equivalent atom pairs (CA in our case) and n is the total number of atom pairs:
![RMSD](../../images/RMSD.gif "calculation of RMSD")


> ### {% icon hands_on %} Hands-on: Data download
>
> 1. Download the following adapted PDB files from [Zenodo](https://zenodo.org/record/3550492#.XdeNL1dKiUk)
>
>    ```
>     1DKX_1.pdb 1DKY_1.pdb 1DKZ_1.pdb 3DPO_1.pdb 3DPP_1.pdb
>    ```
>
{: .hands_on}

## Aligning multiple structures using YASARA

Now load all of them in YASARA:

```
File > Load > PDB File
```

and select the CA (C-alpha) view (F4) and superpose with the MUSTANG algorithm:


```
Analyze > Align > Objects with MUSTANG
```


In the first window you have to select the source objects that will be repositioned. Select Objects 2 till 5. In the second window you select the target Object to superpose on. That would then be the first object.

Notice that YASARA prints the RMSD of every structural alignment in the lower Console. Open the Console by pressing the spacebar once or twice to extend it.

Color the atoms by their B-factor:

```
View > Color > Atom > Belongs to or has > All
Then choose BFactor in the next window and press 'Apply unique color'.
```

High BFactors are yellow, low BFactors are blue.

**TODO Add h5p. Get clarification: answer options? Is this a yes or a no?**

### {% icon question %} Questions

Do you see a correlation between the BFactors and the variability in the structure?

> <details markdown="1">
> <summary>{% icon solution %} Solution
> </summary>
>
> ![Structural alignemnt](../../images/aligned-structures.png)
>
>
> </details>


# Conclusion
{:.no_toc}

Structural alignment of related structures is a very efficient approach to spot similarities and differences of structutally related proteins.
