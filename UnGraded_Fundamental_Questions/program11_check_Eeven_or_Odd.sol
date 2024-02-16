// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;


// Develop a contract with a function check Number that takes a uint256 parameter. 
// Within this function, use an if statement to check if 
// the number is even or odd, and return a corresponding string message.

contract check_Even_ODD {
    function checkNumber(uint256 num) public pure returns(string memory) {
        
        // if(num % 2 == 0) {
        //     return "Even";
        // }
        // else {
        //     return "Odd";
        // }


        //ternary operator sai or easy way mai bhi kar sakta hai
        return (num % 2 == 0) ? "Even" : "Odd";
    }
}