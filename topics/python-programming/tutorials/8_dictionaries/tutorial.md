---
layout: tutorial_hands_on

title: 08 Dictionaries
questions:
- Combine a set of values
objectives:
- Use Dictionaries to combine sets of values. 
time_estimation: 20 min
key_points:
- 
contributors:
- tmuylder

---


## 8.1 Introduction

So far we've seen variables that store one value or a series of values (see [section 5](../5_lists_and_tuples/tutorial.md): lists, tuples and sets). There is another way of storing information where you associate one variable with another; in Python this is called a dictionary. Dictionaries provide a very useful way of quickly connecting variables to each other.


## 8.2 Dictionary creation & usage

It is best to think of a dictionary as a set of *key:value* pairs, with the requirement that the keys are unique (within one dictionary). Dictionaries are initiated by using curly brackets {}, placing a comma-separated list of *key:value* pairs adds initial *key:value* pairs to the dictionary. This is how a dictionary would look like:


![Gentle-hands-on-introduction-to-Python-Programming Python Dictionary](../../images/myDictionary-cropped.PNG)





```python
myDictionary = {'A': 'Ala', 'C': 'Cys', 'D': 'Asp'}
myDictionary
```

You can recall or add values by using square brackets [ ] with the name of the key, or use the `get()`-method. 


```python
myDictionary['A']
```


```python
myDictionary.get('C')
```

If you would like to add a new pair of key-value: 


```python
myDictionary['E'] = 'Glu'
myDictionary
```

Note however that keys are unique and if you try to add a key that already exists. with a different value, it will overwrite it. 


```python
myDictionary['A'] = 'Glu'
myDictionary
```

So keys are unique, values are not!

Dictionaries, like lists, have several useful built-in methods. The most frequently used are listed here below:
- `keys()`	to list the dictionary's keys
- `values()` to list the values in the dictionary
- `get()`	call the value of a specified key
- `pop()`	to remove the specified key and its values


```python
myDictionary = {'A': 'Ala', 'C': 'Cys', 'D': 'Asp', 'E': 'Glu'}
list(myDictionary.keys())
```


```python
list(myDictionary.values())
```


```python
myDictionary.pop('E')
myDictionary
```

If you try to access a key that doesn't exist, Python will give an error:


```python
myDictionary = {'A': 'Ala', 'C': 'Cys', 'D': 'Asp', 'E': 'Glu'}
 
print(myDictionary['B'])
```

You should therefore always check whether a key exists:



```python
# Newlines don't matter when initialising a dictionary...
myDictionary = {
     'A': 'Ala',
     'C': 'Cys',
     'D': 'Asp',
     'E': 'Glu',
     'F': 'Phe',
     'G': 'Gly',
     'H': 'His',
     'I': 'Ile',
     'K': 'Lys',
     'L': 'Leu',
     'M': 'Met',
     'N': 'Asn',
     'P': 'Pro',
     'Q': 'Gln',
     'R': 'Arg',
     'S': 'Ser',
     'T': 'Thr',
     'V': 'Val',
     'W': 'Trp',
     'Y': 'Tyr'}

if 'B' in myDictionary.keys():
    print(myDictionary['B'])
else:
    print("myDictionary doesn't have key 'B'!")
```

---

> ### {% icon hands_on %} Exercise 8.2.1 
>
> Use a dictionary to track how many times each amino acid code appears in the following sequence:
> ```
> SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGISCKVTNIEGLLHKNNWNIED  
> NNIKNASLVQIDASNEQSSTSSSMIIDAQISNALNAQQYKVLIGNREWMIRNGLVINNDVNDFMTEHERKGRTAVLVAVDDELCGLIAIADT
> ```
> Tip: use the one-letter code as key in the dictionary, and the count as value.
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    > ```python
>    > # Use a dictionary to track how many times each amino acid code appears in the following sequence:
>    > # SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGISCKVTNIEGLLHKNNWNIEDNNIKNASLVQIDASNEQSSTSSSMIIDAQISNALNAQQYKVLIGNREWMIRNGLVINNDVNDFMTEHERKGRTAVLVAVDDELCGLIAIADT
>    > # Tip: use the one-letter code as key in the dictionary, and the count as value. 
>    > mySequence = "SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGISCKVTNIEGLLHKNNWNIEDNNIKNASLVQIDASNEQSSTSSSMIIDAQISNALNAQQYKVLIGNREWMIRNGLVINNDVNDFMTEHERKGRTAVLVAVDDELCGLIAIADT"
>    >  
>    > # First way to do this, using sets (condensed)
>    > aminoAcidCount = {}
>    > myUniqueAminoAcids = set(mySequence)
>    > for aaCode in myUniqueAminoAcids:
>    >     print("Amino acid {} occurs {} times.".format(aaCode,mySequence.count(aaCode)))
>    >     aminoAcidCount[aaCode] = mySequence.count(aaCode)
>    > ```
>    > 
>    > </details>
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
>    >
>    > ```python
>    > # Another way to do this, a little bit more elaborate and using the myDictionary as a reference for iteration
>    > mySequence = "SFTMHGTPVVNQVKVLTESNRISHHKILAIVGTAESNSEHPLGTAITKYCKQELDTETLGTCIDFQVVPGCGISCKVTNIEGLLHKNNWNIEDNNIKNASLVQIDASNEQSSTSSSMIIDAQISNALNAQQYKVLIGNREWMIRNGLVINNDVNDFMTEHERKGRTAVLVAVDDELCGLIAIADT"
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
>    > </details>
>
{: .hands_on}


## 8.3 A practical example of dictionaries
An practical example of dictionaries can be found in Biopython. Imagine that we want to extract some information from a GenBank file ([NC_005816](https://www.ncbi.nlm.nih.gov/nuccore/NC_005816/))   


```python
# Imports the SeqIO object from Biopython
from Bio import SeqIO

# Reads in (just one record of) the GenBank file
record = SeqIO.read("data/NC_005816.gb","genbank")
print(record)
```

The SeqRecord object (which we see here) has an id, name and description as well as a sequence. For other (miscellaneous) annotations, the SeqRecord object has a dictionary attribute *annotations*. Most of the annotations information gets recorded in the annotations dictionary.


```python
print(record.id)
print(record.name)
print(record.description)
#print(record.seq)
```


```python
record.annotations
```


```python
record.annotations['organism']
```


```python
record.annotations['source']
```

(In general, `organism` is used for the scientific name (in Latin, e.g. *Arabidopsis thaliana*), while `source`
will often be the common name (e.g. thale cress). In this example, as is often the case, the two fields are
identical.)


```python
record.annotations['accessions'] # This could be a list of values, hence the list. 
```

## 8.4 More with dictionaries
As mentioned here above, you can have a dictionary with a list of values for one key:


```python
TriplicateExp1 = {'name': 'experiment 1', 'pH': 5.6, 'temperature': 288.0, 'volume': 200, 'calibration':'cal1', 'date':['01-01-2020','02-01-2020']}
TriplicateExp1
```

You can, however, only use variables that cannot change keys (so tuples are OK, lists are not), and keys have to be unique: if you add a key that already exists, the old entry will be overwritten:


```python
dates = ('date1','date2') # tuple

TriplicateExp1[dates] = ['01-01-2020','02-01-2020']
TriplicateExp1
```

It is also possible to have a so-called nested dictionary, in which there is a dictionary within a dictionary. 


```python
TriplicateExp2 = {'name': 'experiment 2', 'pH': 5.8, 'temperature': 286.0, 'volume': 200, 'calibration':'cal1', 'date':'03-01-2020'}
TriplicateExp3 = {'name': 'experiment 3', 'pH': 5.4, 'temperature': 287.0, 'volume': 200, 'calibration':'cal1', 'date':'04-01-2020'}
Triplicate = {
    'exp1':TriplicateExp1,
    'exp2':TriplicateExp2,
    'exp3':TriplicateExp3
}
Triplicate
```

## 8.5 Conclusion

