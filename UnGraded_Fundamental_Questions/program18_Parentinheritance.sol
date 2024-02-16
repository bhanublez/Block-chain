// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;


// Construct a base contract Parent with a function calculate().
//  Derive a contract Child inheriting from Parent and override the calculate()
// function in the child contract with a new implementation.


// Kitna complex code hai yai toh samajh nahi aaya mujhe
contract Parent {
    function calculate() public pure virtual returns(uint256) {
        return 0;
    }
}

contract Child is Parent {
    function calculate() public pure override returns(uint256) {
        return 10;
    }
}

