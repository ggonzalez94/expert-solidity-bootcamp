//Using the Isolution4 interface write a function that takes a uint256 and saves it to storage slot 3.
// interface Isolution4 {
//     function solution(uint256 value) external;
// }

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Solution4 {
    constructor() {
        // Write to storage slot 3 so that subsequent writes are cheaper.
        // Future optimization: Maybe deleting other storage slots will do gas refunds?
        assembly {
            sstore(
                3,
                0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff
            )
        }
    }

    function solution(uint256 value) external {
        assembly {
            sstore(3, value)
        }
    }
}
