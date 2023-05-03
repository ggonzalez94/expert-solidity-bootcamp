# Homework 1

1. Look at the example in this [gist](https://gist.github.com/extropyCoder/4243c0f90e6a6e97006a31f5b9265b94) When we do the CODECOPY operation, what are we overwriting?
   When deploying a smart contract, a transaction with the address set to null is sent to the network with the following data:
   `<init code> <runtime code> <constructor parameters>`
   The init code for this excercise is `608060405234801561001057600080fd5b50601160008190555060b6806100276000396000f3fe`.
   When running the init code, the first thing that the EVM does is set the free memory pointer(`0x40`) to `0x80`, but that is then overwritten when executing the `CODECOPY` operation to return the runtime bytecode.
   [This](https://youtu.be/RxL_1AfV7N4?t=1063) video is a great resource to understand how this happens under the hood.
2. Could the answer to Q1 allow an optimisation?
   The question is not super clear, but the EVM could skip setting the free memory pointer in the init code when it is not necessary.
3. Yes, since the constructor is not payable if you send eth along with the deploy transaction it will revert. If we check at the opcode from the snippet, we can see a `REVERT` instruction that is reached only when `CALLVALUE` is not zero.
4. Write some Yul to add 0x07 to 0x08 and store the result at the next free memory location.

Writing directly to memory location `0x80`, which is the first memory available:

```solidity
    // Should add 0x07 to 0x08 and store the result in location 0x80
    function addToMemory() public pure {
        assembly {
            mstore(0x80, add(0x07,0x08))
        }
    }
```

Getting the next memory location available from the first memory pointer and updating it after:

```solidity
    // Should add 0x07 to 0x08 and store the result in the next free memory location. It also updates the free memory pointer
    // Unnecesary for this case since we don't have any other memory management operations before or after - but serves as an example
    function addToFreeMemory() public pure {
        assembly {
            let memoryPointer := mload(0x40)
            mstore(memoryPointer, add(0x07, 0x08))
            mstore(0x40, add(memoryPointer, 0x20)) //add one word(32bytes)
        }
    }
```

5. Can you think of a situation where the opcode EXTCODECOPY is used?
   It can be used to compare or verify a contract's bytecode. More details [here](https://ethereum.stackexchange.com/questions/59779/what-is-the-purpose-of-extcodecopy#:~:text=It%20is%20used%20to%20check,file%20to%20confirm%20its%20legitimacy.)

6. Complete the assembly exercises in this [repo](https://github.com/ExtropyIO/ExpertSolidityBootcamp/tree/main/exercises/assembly)

    ```solidity
    pragma solidity ^0.8.4;

    contract Intro {
        function intro() public pure returns (uint16) {
            uint256 mol = 420;

            // Yul assembly magic happens within assembly{} section
            assembly {
                // stack variables are instantiated with
                // let variable_name := VALßUE
                // instantiate a stack variable that holds the value of mol
                let num := mol

                // To return it needs to be stored in memory
                // with command mstore(MEMORY_LOCATION, STACK_VARIABLE)
                mstore(0x80, num)

                // to return you need to specify address and the size from the starting point
                return(0x80, 0x20) //return from location 0x80 with an offset of 32 bytes
            }
        }
    }
    ```

    ```solidity
    pragma solidity ^0.8.4;

    contract Add {
        function addAssembly(uint256 x, uint256 y) public pure returns (uint256) {
            // Intermediate variables can't communicate between  assembly blocks
            // But they can be written to memory in one block
            // and retrieved in another.
            // Fix this code using memory to store the result between the blocks
            // and return the result from the second block
            assembly {
                let result := add(x, y)
                //not necesary here since we don't have anything else in memory(we could directly use 0x80), but still good practice
                let memPtr := mload(0x40)
                mstore(memPtr, result)
            }

            assembly {
                let memPtr := mload(0x40)
                return(memPtr, 32) //32 bytes offset
            }
        }
    }
    ```
