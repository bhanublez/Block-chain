// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//First thing this code is not written by me it written by tusheet sir 
//I have just copied it from the class work and pasted it here directly 
// and written my comment what i understand from the code
 
contract Lottery {
    address public manager; //manager to handle ticket
    address payable[] public participants;//Folks that paying ticket price
    address public vijeta;//Stores address of Winner
 
    constructor() {
        manager = msg.sender;// Manager is the one who deploys the contract
    }
 
    receive() external payable {
        require(msg.value == 1 ether, "Amount should be 1 ether");//Price of ticket
        participants.push(payable(msg.sender)); //p[0,1,2,3,4] here we are storing the address of the participants
    }
 
    function getBalance() public view returns (uint256) {
        require(manager == msg.sender, "Not Owner");// Only manager can get the balance
        return address(this).balance; //returns the balance of the contract
    }
 
    function random() public view returns (uint256) {
        return
            uint256(//typecasting
                keccak256(//keccak256 is used to hash the data
                    abi.encode(//abi.encode is used to convert the data into bytes
                        block.difficulty,//difficulty of the current block
                        block.timestamp,// timestamp of the current block
                        participants.length //length of the participants array
                    )
                )
            );
    }
 
    function selectWinner() public {
        require(manager == msg.sender, "Not Owner");// Only manager can select the winner
        require(participants.length >= 3,"Not enough participants");//Minimum 3 participants required to select the winner
        address payable winner;//Stores the address of the winner
        uint r = random();//random number
        uint index = r % participants.length;//index of the winner
        winner = participants[index];//address of the winner
        vijeta = winner;//address of the winner
        winner.transfer(getBalance());//transfer the balance to the winner
        participants = new address payable [](0);//reset the participants array
 
    }
}