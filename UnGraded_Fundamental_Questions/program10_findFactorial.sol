// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;


// Develop a Solidity contract that includes a function 
// findFactorial taking an integer input num and calculates 
// its factorial. Use a loop to perform the computation and return the factorial value.

contract findFactorial {

    //Iterative approach factorial nikalne kai liye
    function find_Factorial(uint256 num) public pure returns(uint256) {
        uint256 fact = 1;
        for(uint256 i = 1; i <= num; i++) {
            fact = fact * i;
        }
        return fact;
    }

    //Now apun isko recurisve approach se bhi kar sakta hai
    function fac(uint256 num) public pure returns(uint256) {
        if(num == 0) {
            return 1;
        }
        else {
            return num * fac(num - 1);//Kitna small code kara dala
        }
    }

}