# Homework 3

1. What are the advantages and disadvantages of the 256 bit word length in the EVM?
   The 256 bit word length is a very uncommon design decision on a VM,
    - It has the advantage that it facilitates some common 256 bit primitives such as keccack256 and eliptic-curve operations.
    - Most processors are 32 bits and 64 bits, so working with 256 bit words make it more expensive and slow. Also smaller size variables can waste storage if not [packed correctly](https://medium.com/coinmonks/gas-optimization-in-solidity-part-i-variables-9d5775e43dde)
2. What would happen if the implementation of a precompiled contract varied between
   Ethereum clients ?
   Pre compiles are a way to make what would be computational expensive operations (if implemented as regular smart contracts) cheaper in terms of gas.
   Ethereum precompiles are a set of special smart contracts that are built into the Ethereum protocol to perform specific functions more efficiently than if they were implemented using EVM bytecode. These functions are computationally expensive, and implementing them as precompiles allows them to be executed with lower gas costs compared to their equivalent in Solidity. Precompiles are assigned fixed addresses, starting from `0x1`(e.g `ecrecover`,`SHA-256`, `alt_bn128`).
   If the implementation of these precompile were to vary between different clients, this could cause networks splits, since different clients would have different views of the state of the chain.
