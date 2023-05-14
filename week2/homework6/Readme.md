# Homework 6

1. Create a Solidity contract with one function
   The solidity function should return the amount of ETH that was passed to it, and the function body should be written in assembly.

    We use the `callvalue` opcode for this. You can find the code [here](./ReturnEth.sol)

2. Do you know what this code is doing ? [gist](https://gist.github.com/extropyCoder/9ddce05801ea7ec0f357ba2d9451b2fb)

    My best take so far is that it is a factory that creates 2 copies of itself(deploys to smart contracts to two different addresses)

-   It sends eth to the first one(the same amount that is sent to the tx)
-   It doesn't send any eth to the second one

After completing deployment of the two new smart contract, it `selfdestructs`

3. Explain what the following code is doing in the Yul ERC20 contract

    ```solidity
      function allowanceStorageOffset(account, spender) -> offset {
         offset := accountToStorageOffset(account)
         mstore(0, offset)
         mstore(0x20, spender)
         offset := keccak256(0, 0x40)
      }

      function accountToStorageOffset(account) -> offset {
                offset := add(0x1000, account)
            }
    ```

It calculates the storage location for the allowance mapping (which is a nested mapping). It returns storage location of the allowance for an account and spender key (`allowance[account][speder]`).
For more details on how the storage location is calculated for mappings you can check out [here](https://docs.soliditylang.org/en/v0.8.19/internals/layout_in_storage.html#mappings-and-dynamic-arrays)
Open Question: I expected the result to have to keccack256, according to the documentation. Maybe this is an optimization where you can pre compute some stuff?
