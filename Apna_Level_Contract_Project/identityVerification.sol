// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract identityVerification{
    
    //User ki details
    struct User{
        address userAddress;
        string name;
        string userID;
    }

    User[] private users;

    //Sample users
    constructor(){
        users.push(User(msg.sender, "Bhanu Pratap", "bhanu123"));
        users.push(User(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "Tusheet", "tusheet123"));
        users.push(User(0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2, "Raghav", "raghav123"));
        users.push(User(0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db, "Dipu", "dipu123"));
        users.push(User(0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB, "Chor", "chor123"));
    }

    function addUser(string memory _name, string memory _userID) public{
        bool condition = bytes(_name).length > 0 && bytes(_userID).length > 0;
        require(condition, "Kuch toh gadbad hai, check your details again.");
        users.push(User(msg.sender, _name, _userID));
    }

    function checkUserDetails(address _address) public view returns(string memory name, string memory userID){
        for(uint256 i = 0; i < users.length; i++){
            if(users[i].userAddress == _address){
                return (users[i].name, users[i].userID);
            }
        }
        return ("User tu hai kai nahi", "User ID tu hai kai nahi");
    }

    function checkUserDetailsByID(string memory _userID) public view returns(string memory name, address userAddress){
        for(uint256 i = 0; i < users.length; i++){
            if(keccak256(abi.encodePacked(users[i].userID)) == keccak256(abi.encodePacked(_userID))){
                return (users[i].name, users[i].userAddress);
            }
        }
        return ("User tu hai kai nahi", address(0));
    }


}