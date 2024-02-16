// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Construct a contract with a function calculate that takes two uint256 parameters.
//  Inside this function, declare a local variable result that calculates the multiplication
//   of these parameters and returns the result

contract multiplication {
    function calculate(uint256 a, uint256 b) public pure returns(uint256) {
        uint256 result = a * b;
        return result;
    }
}