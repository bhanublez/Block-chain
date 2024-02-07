// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;



// Construct a contract with a function is Prime that takes a uint256 parameter. 

// Use loops and conditions to verify if the provided number is a prime number and 

// return a boolean value. 

contract checkPrime{
    function check_Prime(uint256 n)public pure returns(bool){
        if(n<=1){
            return false;
        }
        for(uint256 i=2;i<n;i++){
            if(n%i==0){
                return false;
            }
        }
        return true;
    }
}