// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//This code is written by me (Bhanu pratap)
//You can copy it and modify it but don't forget to give me credit.

contract simpleBank{
    mapping(address => uint) public balances;
    address owner;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "You are not the owner.");
        _;
    }

    //struct that store deposited amount and date and sender address
    struct Deposit{
        uint amount;
        uint date;
        address sender;
    }
    //Array of Deposit struct
    Deposit[] public deposits;


     //struct that store withdraw amount and date and sender address
    struct Withdraw{
        uint amount;
        uint date;
        address sender;
    }

    //Array of Withdraw struct
    Withdraw[] public withdraws;


    //mapping of transfer
    struct Transfer{
        uint amount;
        uint date;
        address sender;
        address receiver;
    }

    //Array of Transfer struct
    Transfer[] public transfers;
    

    function deposit() public payable onlyOwner(){
        require(msg.value > 0, "Kuch toh de daal bhai");
        balances[msg.sender] += msg.value;
        deposits.push(Deposit(msg.value, block.timestamp, msg.sender));
    }
    
    function withdraw(uint amount) public onlyOwner(){
        require(amount > 0, "Kuch toh daal bhai");
        require(balances[msg.sender] >= amount, "Tere pass kuch hai bhi kiya?");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        withdraws.push(Withdraw(amount, block.timestamp, msg.sender));
    }
    
    function checkBalance() public view onlyOwner() returns(uint) {
        return balances[msg.sender];
    }

    
    function transfer(address to, uint amount) public onlyOwner() {
        require(amount > 0, "Kuch toh daal bhai");
        require(balances[msg.sender] >= amount, "Tere pass kuch hai bhi kiya?");
        balances[msg.sender] -= amount;
        payable(to).transfer(amount);
        transfers.push(Transfer(amount, block.timestamp, msg.sender, to));
    }


    function getOwner() public view onlyOwner() returns(address){
        return owner;
    }


    function getBalanceOf(address add) public view returns(uint){
        return balances[add];
    }   

    function getAllDeposits() public view onlyOwner() returns(Deposit[] memory){
        return deposits;
    }

    function getAllWithdraws() public view onlyOwner() returns(Withdraw[] memory){
        return withdraws;
    }

    function getAllTransfers() public view onlyOwner() returns(Transfer[] memory){
        return transfers;
    }


}