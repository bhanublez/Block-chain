// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


/*Develop a contract with two state variables counter A and counter B, 

both initialized to 0. Implement functions increment A and decrement B that respectively 

increment counter A by 1 and decrement counter B by 1*/

contract counterAB {

 uint public cA=0;

 int public cB=0;

 function incrementdecrement() public {

 cA++;

 cB--;

 }

 function incrementdecrementshow() public view returns(uint, int){

 return (cA ,cB);

 }

 

}