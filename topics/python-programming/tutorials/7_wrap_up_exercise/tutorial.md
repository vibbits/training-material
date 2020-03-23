---
layout: tutorial_hands_on

title: 07 Wrap-up exercise
questions:
- This section combines all of the previous tutorials in one complex exercise
objectives:
- Exploit basic Python built-in features in a more difficult set-up. 
time_estimation: 1h

contributors:
- tmuylder

---



As we introduced a lot of new concepts it is important that you practice them.

----

> ### {% icon hands_on %} Exercise 7
>
> Write a program that does the following:
> 
> 1. Ask the user for a full DNA sequence
>     - Make sure the sequence contains only GACT
> 2. Once you have a valid sequence
>     - For each DNA fragment the user enters:
>         - Check if it occurs in the full sequence
>         - Print out the sequence position if so
>         - Track each fragment
>     - Keep on asking the user for DNA fragments, stop if they just press return
> 3. As a summary, print out all fragments with their position that you tracked
> 
> **Tips** to complete this exercise in case you get stuck.
> - Use while loops: you can use the condition to decide when to end the loop depending on the user input
> - Track the sequence fragment and position data using a list
> - Use string methods!
> - To check the full DNA sequence, you can count how many times each GACT letter occurs, add up these counts, and compare this value to the total length of the full DNA sequence
> 
>    > <details markdown="1">
>    > <summary>{% icon solution %} Solution
>    > </summary>
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
>    > </details>
>
{: .hands_on}
