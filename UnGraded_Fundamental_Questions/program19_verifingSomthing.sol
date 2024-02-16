// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;


// Develop a contract with a constructor that initializes a state variable to a default
//  value upon contract deployment.
//  Verify this initialization by retrieving the value.

contract Initialize {
    uint256 public value;//apna state variable
    
    constructor() {
        value = 10;
    }
    
    function getValue() public view returns(uint256) {
        return value;
    }
}