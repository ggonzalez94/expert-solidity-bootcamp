// Using the Isolution3 interface write a function that takes an address and returns
// the codeSize of that address as a uint256.

// interface Isolution3 {
//     function solution(address addr) external view returns (uint256 codeSize);
// }

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Solution3 {
    function solution(address addr) external view returns (uint256 codeSize) {
        assembly {
            codeSize := extcodesize(addr)
        }
    }
}
