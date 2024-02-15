pragma solidity ^0.5.0;

contract payableContract {
   address payable public amir;
   uint public dena;

   constructor() public payable {
      amir = msg.sender;
      dena = msg.value;
   }
   function becomeamir() public payable returns (bool) {
      if (msg.value > dena) {
         amir.transfer(msg.value);
         amir = msg.sender;
         dena = msg.value;
         return true;
      } else {
         return false;
      }
   }
}