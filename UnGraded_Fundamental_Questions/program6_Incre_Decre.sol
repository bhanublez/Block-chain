// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;


// Develop a contract with two state variables counter A and counter B, both initialized to 0.
//  Implement functions increment A and decrement B that respectively increment counter A by 1 
//  and decrement counter B by 1

contract Incre_Decre {
    uint256 public A;
    uint256 public B;
    constructor() {
        A = 0;
        B = 0;
    }
    function incrementA() public {
        A += 1;
    }
    function decrementB() public {
        B -= 1;
    }
}