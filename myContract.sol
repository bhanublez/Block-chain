// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyContract {
    uint256 public myUint;//state variable - stored on the blockchain 
    //uint256 is an unsigned integer of 256 bits

    function setMyUint(uint256 _myUint) public {
        myUint = _myUint;//local variable assigned to state variable
    }

    function getMyUint() public view returns (uint256) {
        return myUint;//returns state variable
    }

    bool public myBool;//state variable - stored on the blockchain
    //bool is a boolean value of true or false

    function setMyBool(bool _myBool) public {
        myBool = _myBool;//local variable assigned to state variable
    }

    function getMyBool() public view returns (bool) {
        return myBool;//returns state variable
    }
}