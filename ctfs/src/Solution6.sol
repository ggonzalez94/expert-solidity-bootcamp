//Using the Isolution6 interface write a function that will take the messageHash (plus params)
// and return the signer of the message.

//Hint: Don't forget to prepend your message with “\x19Ethereum Signed Message:\n32”
interface Isolution6 {
    function solution(
        bytes32 messageHash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external pure returns (address signer);
}

// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Solution6 {
    function solution(
        bytes32 messageHash,
        uint8 v,
        bytes32 r,
        bytes32 s
    ) external pure returns (address signer) {
        bytes32 prefixedHash = keccak256(
            abi.encodePacked("\x19Ethereum Signed Message:\n32", messageHash)
        );
        signer = ecrecover(prefixedHash, v, r, s);
    }
}
