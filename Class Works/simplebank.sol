// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleBank {
    mapping(address => uint256) public balances;
    address public owner;
    event depositDone(uint256 amount, address indexed depositedTo);

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable returns (uint256) {
        balances[msg.sender] += msg.value;
        emit depositDone(msg.value, msg.sender);
        return balances[msg.sender];
    }

    function withdraw(uint256 amount) public returns (uint256) {
        require(balances[msg.sender] >= amount, "Insufficient balance");
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
        return balances[msg.sender];
    }
}
