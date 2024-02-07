// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract simpleBank{
    mapping(address => uint) public balances;
    address public owner;
    
    constructor(){
        owner = msg.sender;
    }
    
    function deposit() public payable{
        require(msg.value > 0, "Kuch toh de daal bhai");
        balances[msg.sender] += msg.value;
    }
    
    function withdraw(uint amount) public{
        require(amount > 0, "Kuch toh daal bhai");
        require(balances[msg.sender] >= amount, "Tere pass kuch hai bhi kiya?");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
    
    function checkBalance() public view returns(uint){
        return balances[msg.sender];
    }
    
    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }
    
    function transfer(address to, uint amount) public{
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
    
    
    
}