// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyEvents {
    
    event store(address indexed user, uint256 id, uint256 data);
    
    function kuchKuchHotaHai(uint256 id, uint256 data) public {
        emit store(msg.sender, id, data);
    }

}