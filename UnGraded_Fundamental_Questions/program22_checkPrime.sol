// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Create a contract with a pure function that checks whether a given number (n) is a prime number or not. 
// The function should solely perform calculations without accessing contract state.

contract PrimeNumber {
    function isPrime(uint256 n) public pure returns(bool) {
        if(n <= 1) {
            return false;
        }
        for(uint256 i = 2; i*i <= n; i++) {
            if(n % i == 0) {
                return false;
            }
        }
        return true;
    }
}