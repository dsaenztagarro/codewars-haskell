Sorting Dictionaries (sortdict)
-------------------------------

Python dictionaries are inherently unsorted. So what do you do if you need to sort the contents of a dictionary.

In this kata you will create a function that returns a sorted list of (key, value) tuples (Javascript: arrays of 2 items).

The list must be sorted by the value and be sorted largest to smallest.

Run tests with: `runhaskell Dictionaries/Test.hs`

Sum up the random string (sumup)
--------------------------------

Given a random string consisting of numbers, letters, symbols, you need to sum up the numbers in the string.

Note:

Consecutive integers should be treated as a single number. eg, 2015 should be treated as a single number 2015, NOT four numbers
All the numbers should be treaded as positive integer. eg, 11-14 should be treated as two numbers 11 and 14. Same as 3.14, should be treated as two numbers 3 and 14
If no number was given in the string, it should return 0
Example:

str = "In 2015, I want to know how much does iPhone 6+ cost?"
The numbers are 2015, 6

Sum is 2021.

**NOTE**

`ghci`: `:set -XFlexibleContexts (ghci)`
