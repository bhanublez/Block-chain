// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Problem Statement 1: Basic Contact List

// Objective: Create a contract named ContactList that allows users to store and retrieve phone numbers associated with names.

// •     Use a struct named Contact to hold a person's naam and phone number.

// •     Implement a mapping to associate Ethereum addresses with their Contact.

// •     Write a function to allow users to add or update their contact information.

// •     Include a function to retrieve a user's contact information by their Ethereum address.

// see less

contract ContactList{
     struct Contacts{
        string naam;
        string phoneNumber; //apun int bhi leh sakteh hai
     }

     mapping (address=>Contacts) private contants;

    function addD(string memory naam,string memory phoneNumber)public{
        contants[msg.sender].naam=naam;
        contants[msg.sender].phoneNumber=phoneNumber;
    }

    function updateD(string memory naam,string memory phoneNumber)public{
        contants[msg.sender].naam=naam;
        contants[msg.sender].phoneNumber=phoneNumber;
    }

    function getInfo(address add)public view returns (string memory ,string memory){
        return (contants[add].naam,contants[add].phoneNumber);      
    }

    function getSenderAddress() public view returns (address){
        return msg.sender;
    }

}