// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Immutable {

    address public immutable apun;

    uint public immutable value;

  	bytes1 public immutable ohhhhhhh = 0x00;
    constructor(uint dal) {
        apun = msg.sender;
        value = dal;
    }
}