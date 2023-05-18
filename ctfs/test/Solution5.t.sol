// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Solution5.sol";

contract Solution5Test is Test {
    Solution5 public sol;

    function setUp() public {
        sol = new Solution5();
    }

    function test_exponent() public {
        bytes32 b = bytes32(uint256(2));
        bytes32 ex = bytes32(uint256(3));
        bytes32 mod = bytes32(uint256(3));
        bytes32 result = sol.solution(b, ex, mod);
        assertEq(result, bytes32(uint256(2)), "result should be 0x00000");
    }

    // function test_exponentWithEncode() public {
    //     bytes32 b = bytes32(uint256(2));
    //     bytes32 ex = bytes32(uint256(3));
    //     bytes32 mod = bytes32(uint256(3));
    //     bytes32 result = sol.solutionSolidity(b, ex, mod);
    //     assertEq(result, bytes32(uint256(2)), "result should be 0x00000");
    // }
}
