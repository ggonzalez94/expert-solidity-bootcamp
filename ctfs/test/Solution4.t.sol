// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Solution4.sol";

contract Solution4Test is Test {
    Solution4 public sol;

    function setUp() public {
        sol = new Solution4();
    }

    function test_storage() public {
        sol.solution(123);
    }
}
