// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.0;

// Build a contract with two setter functions:
// one to set a bool variable and another to 
// set a uint256 variable. Implement a third 
// function that calls both setters in a specific order.

contract setterFuntion {
    bool public apnaBool;
    uint256 public apnaInt;
    constructor() {
        apnaBool = false;
        apnaInt = 0;
    }
    function setBool(bool _apnaBool) public {
        apnaBool = _apnaBool;
    }
    function setUint(uint256 _apnaInt) public {
        apnaInt = _apnaInt;
    }
    function callBoth() public {
        setBool(true);
        setUint(100);
    }

}