// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Develop a contract where a getter function retrieves the value of an uint256 variable.
//  Test this function to ensure it correctly returns the value.

contract getterFuntion {
    uint256 public value;
    constructor() {
        value = 100;
    }
    function get() public view returns(uint256) {
        return value;
    }
}