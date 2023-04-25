// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

contract Array {
    uint[] public myDynamicArray;

    error IndexOutOfBounds(); //Custom errors are more gas efficient than require with a string revert message

    constructor() {
        myDynamicArray = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11];
    }

    function deleteAtIndex(uint8 index) external {
        if (index >= myDynamicArray.length) {
            revert IndexOutOfBounds();
        }

        // Swap the element at the given index with the last element
        myDynamicArray[index] = myDynamicArray[myDynamicArray.length - 1];

        // Remove the last element
        myDynamicArray.pop();
    }
    
    function getArrayLength() external view returns (uint256) {
        return myDynamicArray.length;
    }
}