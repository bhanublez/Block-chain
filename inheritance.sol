// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract A{
    function check1() public pure returns (string memory){
        return "We ar in Check 1 of A contract";
    }
     function check2() public pure returns (string memory){
        return "We ar in Check 2 of A contract";
    } 
    function check3() public pure virtual returns (string memory){
        return "We ar in Check 3 of A  contract";
    } 
    function check4() public pure virtual returns (string memory){
        return "We ar in Check 4 of A contract";
    }
}

contract B{
    function check1() public pure returns (string memory){
        return "We ar in Check 1 of B contract";
    }
     function check2() public pure returns (string memory){
        return "We ar in Check 2 of B contract";
    } 
    function check3() public pure returns (string memory){
        return "We ar in Check 3 of B contract";
    } 
    function check4() public pure returns (string memory){
        return "We ar in Check 4 of B contract";
    }
}

contract C is A{
 function check3() public pure override  returns (string memory){
        return "We ar in Check 3 of B contract";
    } 
    function check4() public pure override  returns (string memory){
        return "We ar in Check 4 of B contract";
    }
}