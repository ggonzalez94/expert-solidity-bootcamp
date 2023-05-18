// Using the Isolution5 interface calculate Modular Exponentiation (base**exp % mod).
// Implementing it from scratch would take too much gas so you will need to use the precompiled contract at address 0x05
interface Isolution5 {
    function solution(
        bytes32 b,
        bytes32 ex,
        bytes32 mod
    ) external returns (bytes32 result);
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Solution5 {
    function solution(
        bytes32 b,
        bytes32 ex,
        bytes32 modul
    ) external view returns (bytes32 result) {
        assembly {
            // define pointer
            let p := 0x80
            // store data assembly-favouring ways
            mstore(p, 0x20) // Length of Base
            mstore(160, 0x20) // Length of Exponent
            mstore(192, 0x20) // Length of Modulus
            mstore(224, b) // Base
            mstore(256, ex) // Exponent
            mstore(288, modul) // Modulus
            pop(staticcall(gas(), 0x05, p, 0xc0, p, 0x20))
            // data
            result := mload(p)
        }
    }

    // function solutionSolidity(
    //     bytes32 b,
    //     bytes32 ex,
    //     bytes32 modul
    // ) external view returns (bytes32) {
    //     bytes memory input = abi.encode(
    //         uint256(32), // Length of Base
    //         uint256(32), // Length of Exponent
    //         uint256(32), // Length of Modulus
    //         b,
    //         ex,
    //         modul
    //     );
    //     assembly {
    //         let output := mload(0x40)
    //         if iszero(staticcall(gas(), 0x05, input, 0xc0, output, 0x20)) {
    //             revert(0, 0)
    //         }
    //         return(output, 0x20)
    //     }
    // }
}
