// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//A simple Number guessing game

contract apnaGame {
    uint256 public randomNumber;

    //Generating random number
    constructor() {

        randomNumber = (block.timestamp % 100) + 1;
    }

    function guessTheNumber(uint256 _number) public view returns (string memory) {
        if (_number == randomNumber) {
            return "Congratulations! You have guessed the right number";
        } else if (_number < randomNumber) {
            return "Try a bigger number";
        } else {
            return "Try a smaller number";
        }
    }    

    //Random number change karna
    function changeRandomNumber() public {
        randomNumber = (block.timestamp % 100) + 1;
    }
}