// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract dusra{
    uint256 public value;
    function getValue() public view returns (uint256) {
        return value;
    }

}

contract apenaContract {
    
    function getValue(address add) public view returns (uint256 Value) {
        dusra d = dusra(add);
        uint256 value = d.getValue();
        return value;
    }

}