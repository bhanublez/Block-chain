// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.0;


// Create a contract with a setter function for an address variable.
// Implement validation within the setter to ensure the address is not empty (address(0)).

contract setterFuntion {
    address public value;
    constructor() {
        value = address(0);
    }
    function set(address adda) public {
        require(adda != address(0), "Adda abh nahi reha!");
        value = adda;
    }
}