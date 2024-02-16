// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Design three contracts: LivingBeing, Animal, and Mammal. 
// Implement LivingBeing as the base contract, Animal inheriting from LivingBeing,
//  and Mammal inheriting from Animal.
//  Add properties and functions specific to each contract level.

contract LivingBeing {
    string public naam;
    uint256 public umar;
    
    constructor(string memory _naam, uint256 _ummar) {
        naam = _naam;
        umar = _ummar;
    }
}

//copied these code from last program
contract Animal is LivingBeing {
    string public species;
    
    constructor(string memory _naam, uint256 _ummar, string memory _species) LivingBeing(_naam, _ummar) {
        species = _species;
    }
    
    function makeSound() public pure virtual returns(string memory) {
        return "Janwar ki awaz kase hoti hai...hmmm t*ti";
    }
}

contract Mammal is Animal {
    string public mammalNaam;
    string public fartSound;

    constructor(string memory _naam, uint256 _ummar, string memory _species, string memory _mammalNaam, string memory _fartSound) Animal(_naam, _ummar, _species) {
        mammalNaam = _mammalNaam;
        fartSound = _fartSound;
    }

    function makeSound() public pure override returns(string memory) {
        return "Mammal ki waha (you thinking it right) ki awaz kase hoti hai...hmmm ";
    }
    
    
}

