// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;


// Develop a contract with two uint256 variables numA and numB.
//  Create a function addNumbers that takes these variables as parameters,
//   performs addition, and returns the result.

contract addOperation {
    uint256 public numA;
    uint256 public numB;
    function addNumbers(uint256 a, uint256 b) public returns(uint256) {
        numA = a;
        numB = b;
        return numA + numB;
    }
}