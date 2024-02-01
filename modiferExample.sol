pragma solidity ^0.8.0;

contract  A{
    address public owner;
    constructor(){
        owner = msg.sender;
    }
    modifier onlyOwner(){
        require(owner == msg.sender,"You are not the owner");
        _;
    }
    function fun1() public view onlyOwner() returns(string memory){
    //    require(owner == msg.sender,"You are not the owner");
         return "Hello Guys";
    }

    function fun2() public view returns(string memory){
        assert(owner == msg.sender);
        return "Hello Guys";
    }
}