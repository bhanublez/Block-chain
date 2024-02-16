// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Create a contract with a modifier onlyOwner restricting access to a function. 
// Implement a constructor to set the contract 
// deployer as the owner and apply the onlyOwner modifier to a function.

contract OnlyOwner {
    address public owner;
    
    constructor() {
        owner = msg.sender;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Apna owner nahi hai, bagh bagh!");
        _;
    }
    
    function changeOwner(address _nayamalik) public onlyOwner {
        owner = _nayamalik;
    }
}