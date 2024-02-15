// SPDX-License-Identifier: MIT
 
pragma solidity ^0.8.0;

contract callKeccak{
    function call_Keccak()public pure returns(bytes32 value) {
        return keccak256(("Bhanu"));
    }

}