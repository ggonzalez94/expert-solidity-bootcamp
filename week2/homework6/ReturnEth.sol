// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract ReturnEth {
    function returnEth() external payable returns (uint256 amountSent) {
        assembly {
            amountSent := callvalue() //get amount of wei sent to the function
        }
    }
}
