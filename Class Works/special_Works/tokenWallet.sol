// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Problem Statement 2: Simple Token Wallet
// Objective: Develop a contract called TokenWallet where users can track their token balances.
// •	Define a mapping to track the token balance of Ethereum addresses.
// •	Implement a function that allows users to update their token balance.
// •	Create a function for users to check their own token balance.

contract TokenWallet{
    mapping(address => uint) private balances;
    address private owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You not owner!!!");
        _;
    }

    event BalanceUpdated(address indexed user, uint balance); // log maintain karata hai

    function updateBalance(uint balance) public {
        balances[msg.sender] = balance;
        emit BalanceUpdated(msg.sender, balance);

    }

    function checkBalance() public view returns(uint) {
        return balances[msg.sender];
    }

    function checkBalanceAtAddresss(address add) public view onlyOwner returns(uint) {
        return balances[add];
    }


}

    