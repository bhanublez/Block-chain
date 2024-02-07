// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.4;

contract test{
    uint256 data;
    function set(uint256 x) public {
        data=x;
    }

    function get() public view returns(uint256){
        return data;
    }
    struct People{
        uint256 roll;
        string name;
        uint256 [5]mks;
    }

    People [] public pArr;
    function addDetail(string memory _name,uint256 _roll) public{
        uint256 [5] memory ro;
        for(uint256 i=0;i<5;i++){
            ro[i]=i;
        }
         People memory newperson=People({roll: _roll,name: _name,mks: ro });
         pArr.push(newperson);
    }
}