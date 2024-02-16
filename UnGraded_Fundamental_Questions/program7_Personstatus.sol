// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Create a Solidity contract that maintains state variables name 
// (string), age (uint256), and isActive (bool) for a person.
//  Implement functions to update and retrieve these attributes.

contract PersonStatus {
    string public name;
    uint256 public age;
    bool public isActive;

    function update(string memory _name, uint256 _age, bool _isActive) public {
        name = _name;
        age = _age;
        isActive = _isActive;
    }

    function retrieve() public view returns (string memory, uint256, bool) {
        return (name, age, isActive);
    }
}