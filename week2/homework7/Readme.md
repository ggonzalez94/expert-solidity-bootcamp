# Homework 7 - Functions

1. The parameter X represents a function.
   Complete the function signature so that X is a standard ERC20 transfer function (other than the visibility)
   The query function should revert if the ERC20 function returns false.

    ```solidity
       function query(uint _amount, address _receiver, X) public {
     ...
     }
    ```

    You can find a solution to this using internal functions in the [Query smart contract](./Query.sol).  
     Here's a code snippet for the query function:

    ```solidity
        function query(
            uint _amount,
            address _receiver,
            function(address, uint256) internal returns (bool) X
        ) internal {
            bool result = X(_receiver, _amount);
            require(result, "Result of function call has to be true");
        }
    ```

    For more info on function types check the solidity [docs](https://docs.soliditylang.org/en/v0.8.20/types.html#function-types)

2. The following function checks function details passed in the data parameter.

```solidity
    function checkCall(bytes calldata data) external{
    }
```

The data parameter is bytes encoded representing the following

-   Function selector
-   Target address
-   Amount (uint256)

Complete the function body as follows  
The function should revert if the function is not an ERC20 transfer function.
Otherwise extract the address and amount from the data variable and emit an event with those details
`event transferOccurred(address,uint256);`

The solution is in the [Decode smart contract](./Decode.sol). TL;DR we take the first 4 bytes of the calldata(function selector) and compare it against the first 4 bytes of the `keccack256` of the transfer function signature. If that fails, we revert, otherwise we use `abi.decode` to get the parameters and emit the event.
Code snippet:

```solidity
    function checkCall(bytes calldata data) external {
        // Check that the data is long enough to contain a function selector
        // and two arguments (address and uint256).
        require(data.length >= 4 + 32 + 32, "Data is too short");
        bytes4 selector = bytes4(data[:4]);
        bytes4 transferSelector = bytes4(
            keccak256("transfer(address,uint256)")
        );
        require(selector == transferSelector, "Selector is not transfer");
        (address receiver, uint256 amount) = abi.decode(
            data[4:],
            (address, uint256)
        );
        emit transferOccurred(receiver, amount);
    }
```
