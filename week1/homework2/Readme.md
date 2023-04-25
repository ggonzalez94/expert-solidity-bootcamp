# Homework 2

## Solidity

Write a function that will delete items (one at a time) from a dynamic array without leaving gaps in the array. You should assume that the items to be deleted are chosen at random, and try to do this in a gas efficient manner.
For example imagine your array has 12 items and you need to delete the items at indexes 8, 2 and 7.
The final array will then have items {0,1,3,4,5,6,9,10,11}

## Solution

To test the solution run the following commands:

1. Install dependencies

```
$ yarn
```

2. Run tests. This will print the length and items before and after deletion. It will also assert that the new length is 9.

```
$ yarn hardhat test
```
