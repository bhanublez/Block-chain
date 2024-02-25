// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract stonePaperScissorGame{
    //Single player game
    uint256 private mychoice;
    uint private computerChoice;
    uint private nounce = 0;

    //Write set of rules for noobs
    function rules() public pure returns(string memory){
        return "Rules: \n1. Stone breaks Scissor\n2. Scissor cuts Paper\n3. Paper covers Stone and \n4. \n If both players choose the same, the game is a tie.\n \n And choice are 1 , 2 and 3 for stone, paper and scissor respectively";
    }

    

    //Computer ka choice
    function computerChoiceGenerator() private{
        computerChoice = uint(keccak256(abi.encodePacked(block.timestamp,msg.sender,nounce)))%3 + 1;
        nounce++;        
    }

    //StonePaperScissor game
    function play(uint256 _mychoice) public returns(string memory){
        require(_mychoice>0 && _mychoice<4, "Invalid choice");
        mychoice = _mychoice;
        computerChoiceGenerator();
        if(mychoice==computerChoice){
            return "Game is a tie";
        }
        else if(mychoice==1 && computerChoice==2){
            return "Computer wins";
        }
        else if(mychoice==2 && computerChoice==3){
            return "Computer wins";
        }
        else if(mychoice==3 && computerChoice==1){
            return "Computer wins";
        }
        else{
            return "You win";
        }
    }
    

        
}