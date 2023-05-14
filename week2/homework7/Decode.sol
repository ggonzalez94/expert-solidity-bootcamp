// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Decode {
    event transferOccurred(address, uint256);

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
}
