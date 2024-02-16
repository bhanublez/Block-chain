// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Create a base contract Animal with properties like species and a function makeSound(). 
// Derive a contract Dog inheriting from Animal and add a breed property specific to dogs 
// along with a bark() function.

contract Animal {
    string public species;
    
    constructor(string memory _species) {
        species = _species;
    }
    
    function makeSound() public pure virtual returns(string memory) {
        return "Janwar ki awaz kase hoti hai...hmmm t*ti";
    }
}

contract Dog is Animal {
    string public breed;
    
    constructor(string memory _species, string memory _breed) Animal(_species) {    //Animal(_species) use kiya taki Animal ke constructor ko call kar sake
        breed = _breed;
    }
    
    function bark() public pure returns(string memory) {
        return "Bhow Bhow Bhow...";//bhow bhow bhow bhow, aaj kal coding mai kiya kiya karate hai
    }
}