// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//A simple Number guessing game

contract apnaGame {
    uint8 private answer;
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Tere liyeh nahi hai ye game");
        _;
    }

    event win(address _winner);

    event answerSet(uint8 _answer);

    event answerGuessed(address _guesser, uint8 _guess);

    constructor() {
        owner = msg.sender;
        answer = 77;
        emit answerSet(answer);
    }

    function setAnswer(uint8 _answer) public onlyOwner {
        answer = _answer;
        emit answerSet(answer);
    }

    function guess(uint8 _guess) public {
        require(_guess > 0 && _guess < 100, "Enter a number between 1 and 100");
        if (_guess == answer) {
            emit win(msg.sender);
        } else {
            emit answerGuessed(msg.sender, _guess);
        }
    }
}