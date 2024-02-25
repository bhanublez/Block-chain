// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract apnaVoting{
        
        //Voter ki details
        struct Voter{
            address voterKaAdress;//Voter ka address
            bool status;//Voter ne vote kiya hai ya nahi
            uint256 voteIndex;//Voter ne kis index pe vote kiya hai (matlab ki kis candidate ko vote kiya hai)
            bool rightToVor;//Voter ko voting ka right hai ya nahi
        }
        
        Voter[] private voters;
        
        struct Candidate{
            string name;//Candidate ka naam
            uint256 voteCount;//Candidate ko kitne votes mile hai
        }
        
        Candidate[] private candidates;
        
        address owner;
        
        constructor(){
            owner=msg.sender;
            candidates.push(Candidate("Bhanu pratap", 0));
            candidates.push(Candidate("Tusheet Sir", 0));
            candidates.push(Candidate("Ragav Cada", 0));
            candidates.push(Candidate("Dipu", 0));
            candidates.push(Candidate("Chor", 0));
        }
        
        function addVoter() public{
            for(uint i=0; i<voters.length; i++){
                require(voters[i].voterKaAdress!=msg.sender, "Chal Be, you are already added.");
            }
            voters.push(Voter(msg.sender, false, 0, false));
        }
        
        
        function giveRightToVote(address _voterAddress) public{
            require(msg.sender==owner, "Only owner can give the right to vote.");
            for(uint i=0; i<voters.length; i++){
                if(voters[i].voterKaAdress==_voterAddress){
                    voters[i].rightToVor=true;
                }
            }
        }

        function vote(uint256 _voteIndex) public{
            require(voters.length>0, "Koi voter hi nahi hai.");
            require(_voteIndex<candidates.length, "tu pagal hai kya, aise candidate hi nahi hai.");
            for(uint i=0; i<voters.length; i++){
                if(voters[i].voterKaAdress==msg.sender){
                    require(voters[i].status==false, "Chal Be, you have already voted.");
                    voters[i].status=true;
                    voters[i].voteIndex=_voteIndex;
                    candidates[_voteIndex].voteCount++;
                }
            }
        }

        //Show all candidates 
        function allCandidates() public view returns(string[] memory){
            string[] memory allCandidatesName = new string[](candidates.length);
            for(uint i=0; i<candidates.length; i++){
                allCandidatesName[i]=candidates[i].name;
            }
            return allCandidatesName;
        }

        function winningCandidate() public view returns(string memory WinnerName){
            require(voters.length>0, "Koi voter hi nahi hai.");

            uint256 maxVote=0;
            uint256 maxVoteIndex=0;
            for(uint i=0; i<candidates.length; i++){
                if(candidates[i].voteCount>maxVote){
                    maxVote=candidates[i].voteCount;
                    maxVoteIndex=i;
                }
            }
            return candidates[maxVoteIndex].name;
        }

        //Total voters
        function totalVoters() public view returns(uint256){
            return voters.length;
        }

}