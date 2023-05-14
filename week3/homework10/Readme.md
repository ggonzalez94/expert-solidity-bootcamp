# Homework 10

1.  Why are negative numbers more expensive to store than positive numbers?
    I didn't find any compelling reason why this is true. Negative numbers in solidity are stored using [two's complement](https://www.cs.cornell.edu/~tomf/notes/cps104/twoscomp.html#:~:text=To%20get%20the%20two's%20complement,add%20one%20to%20the%20result.)
    The extra gas cost may come from the fact that extra operations may need to be needed to convert to and from this system.
2.  Test the following statement. Which is cheaper and why?
    Assume the denominator can never be zero

    1. ```
       result = numerator / denominator
       ```

    2. ```

       assembly {
           result := div(numerator, denominator)
       }
       ```

    The second block is cheaper in terms of gas because it performs and unchecked division, so it has less bytecode.
    Running it in Remix the first function costs 740 gas, while the second only 572.
    Using solidity and unchecked it costs 587 gas, so slightly more than using in-line assembly.
