// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract Lottery {
    address public manager;
    address payable[] public participants;
    address public vijeta;
 
    constructor() {
        manager = msg.sender;
    }
 
    receive() external payable {
        require(msg.value == 1 ether, "Amount should be 1 ether");
        participants.push(payable(msg.sender)); //p[0,1,2,3,4]
    }
 
    function getBalance() public view returns (uint256) {
        require(manager == msg.sender, "Not Owner");
        return address(this).balance;
    }
 
    function random() public view returns (uint256) {
        return
            uint256(
                keccak256(
                    abi.encode(
                        block.difficulty,
                        block.timestamp,
                        participants.length
                    )
                )
            );
    }
 
    function selectWinner() public {
        require(manager == msg.sender, "Not Owner");
        require(participants.length >= 3);
        address payable winner;
        uint r = random();
        uint index = r % participants.length;
        winner = participants[index];
        vijeta = winner;
        winner.transfer(getBalance());
        participants = new address payable [](0);
 
    }
}