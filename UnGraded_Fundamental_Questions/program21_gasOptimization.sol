// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Construct a contract with multiple state variables and use
//  a constructor to set their initial values efficiently, 
// considering gas optimization techniques.

contract GasOptimization {
    uint256 public mai;
    uint256 public tu;
    uint256 public woh;
    
    constructor(uint256 _mai, uint256 _tu, uint256 _woh) {
        mai = _mai;
        tu = _tu;
        woh = _woh;
    }
}

//Note: what exactly is gas optimization techniques? (Inta peta to reduce gas consumption in smart contracts.)
// lakin kiya mera code gas optimized hai ya nahi peta nahi. 