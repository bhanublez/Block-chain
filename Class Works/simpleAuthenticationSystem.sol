// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Problem Statement 4: Simple Authentication System
// Objective: Create a contract SimpleAuth for a basic user authentication system.
// •	Define a mapping to associate Ethereum addresses with a boolean indicating whether the address is "registered" or not.
// •	Implement a function that allows an address to register itself (setting its associated boolean to true).
// •	Include a function that checks if an address is registered.

contract SimpleAuth{
    mapping(address => bool) private registered;


    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You not owner!!!");
        _;
    }

    function register() public onlyOwner() {
        registered[msg.sender] = true;
    }

    function registerUsingAddress(address add) public onlyOwner {
        registered[add] = true;
    }

    function checkRegistered() public view returns(bool) {
        return registered[msg.sender];
    }

    function checkRegisteredAtAddresss(address add) public view onlyOwner returns(bool) {
        require(registered[add] == true, "Who? You are not registered!!!y");
        return registered[add];
    }

    function getOwner() public view returns(address) {
        return owner;
    }

    function getSenderAddress() public view returns(address) {
        return msg.sender;
    }
}