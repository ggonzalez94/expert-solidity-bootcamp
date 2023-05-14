// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

contract Query {
    function query(
        uint _amount,
        address _receiver,
        function(address, uint256) internal returns (bool) X
    ) internal {
        bool result = X(_receiver, _amount);
        require(result, "Result of function call has to be true");
    }

    function transfer(
        address _receiver,
        uint256 _amount
    ) internal returns (bool) {
        return false; //Hardcoded return to test the revert
    }

    function callMe(uint _amount, address _receiver) public {
        query(_amount, _receiver, transfer);
    }
}
