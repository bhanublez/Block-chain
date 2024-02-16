// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Create a contract with a view function to convert a given amount of Ether into Wei. 
// Ensure that the function only reads the 
// Ether amount and converts it without modifying the contract state.



contract Conversion {
    function convertEtherToWei(uint256 _etherkitna) public pure returns(uint256) {
        // 1 ether = 10^18 wei
        return _etherkitna * 1 ether;// or return _etherkitna * 10**18;
    }
}
