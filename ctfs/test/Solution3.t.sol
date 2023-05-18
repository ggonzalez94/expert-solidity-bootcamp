// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import "forge-std/Test.sol";
import "../src/Solution3.sol";

contract Solution3Test is Test {
    Solution3 public sol;
    uint256 mainnetFork;
    address constant usdcAddress =
        address(0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48);
    string MAINNET_RPC_URL =
        "https://eth-mainnet.g.alchemy.com/v2/sNeHddUXY-9axjz5eRRDg0uox6Q7LijO";

    function setUp() public {
        mainnetFork = vm.createFork(MAINNET_RPC_URL);
        vm.selectFork(mainnetFork);
        sol = new Solution3();
    }

    function test_getCode() public {
        vm.selectFork(mainnetFork);
        uint256 codeSize = sol.solution(usdcAddress);
        assertGt(codeSize, 0, "codeSize should be greater than 0");
    }
}
