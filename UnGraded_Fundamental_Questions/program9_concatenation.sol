// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Construct a contract with a string variable greeting initialized 
// to "Hello". Implement a function concatenateString that appends "World"
//  to the greeting variable and returns the updated string.

contract concatenation {
    string public greeting;//Ku karna greeting late maro
    constructor() {
        greeting = "Hello";
    }
    function concatenateString() public returns(string memory) {
        greeting = string(abi.encodePacked(greeting, " World of Bhanu"));
        return greeting;
    }
}
```