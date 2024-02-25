// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Problem Statement 1: Decentralized Marketplace

// Objective: Develop a Decentralized Marketplace contract where 
//users can list items for sale and others can purchase them using Ether.

// Sellers should list items with a name and price.(done)
// Buyers can purchase items by sending Ether equal to the listed price.(done but transfer in wei, still its either)
// Ensure that the Ether sent by buyers is transferred to the seller.(done)
// Implement functionality to mark items as sold upon purchase to prevent further sales.(done)

// Seller koi bhi ho sakta hai, and buyer bhi koi bhi ho sakta hai 

contract decentralizedMarketplace{

    //Item ki details
    struct Item{
        string naam;//Product name
        int itemId;//Product id and it is the index of the product in the list
        uint256 price;//Product ki keemat also in wei
        address seller;//Seller address, decentralized isliye multiple seller ho sakte hain
        bool status;//Product sold or not
        string description;//Boleh toh item ki information
    }

    //Item ki list 
    Item[] private items;

    //Adding random items in the list taki time waste na ho and testing ke liye , remeber to remove this constructor in real world hmm
    constructor(){
        items.push(Item("Digital Laptop", 0, 982734923747429, msg.sender, false, "Yeh laptop zo karab hai."));
        items.push(Item("Mobile", 1, 75467983465995694565, msg.sender, false, "Mobile lakin old version."));
        items.push(Item("Unusable Tablet ", 2, 739857068048605865968, msg.sender, false, "Table toh lakin kiska hai pata nahi, and also feature peta nahi chori ka mal hai."));
        items.push(Item("Kuch bhi Headphone", 3, 435679589589567, msg.sender, false, "Used headphone hai, lakin sound quality is really patheatic"));
        items.push(Item("Earphone bass", 4, 987897987298478, msg.sender, false, "Earphone hai, lakin like all other product karab hai."));
    }

    //Adding item in the listu and koi bhi seller ben sakta hai
    function addItem(string memory _naam, uint256 _price, string memory _description) public{
        bool condition = bytes(_naam).length > 0 && _price > 0;// checking ki info toh hai and price bhi hai
        require(condition, "Your necessary details are missing. Please fill all the details. Correctly.");
        items.push(Item(_naam, int(items.length), _price, msg.sender, false, _description));//Adding item in the list
    }

    //Diplaying all the items in the list with there details to buyer one my one
    function displayItemDetail(uint256 _indexo) public view returns(string memory naam, uint256 price, address addressOfSeller, bool status, string memory productDetails){
        return (items[_indexo].naam, items[_indexo].price, items[_indexo].seller, items[_indexo].status, items[_indexo].description);
    }

    //Displaying all items naam and price and index whose status is false
    function displayAllItems() public view returns(string[] memory naamOfAllProduct , uint256[] memory priceInWei, int[] memory productID){
        //memory array is used by apun to store value for displaying
        string[] memory naam = new string[](items.length);
        uint256[] memory price = new uint256[](items.length);
        int[] memory indexo = new int[](items.length);
        uint256 count = 0;
        
        //Simple traverse karo and check karo ki product sold hai ya nahi
        for(uint256 i = 0; i < items.length; i++){
            if(items[i].status == false){
                naam[count] = items[i].naam;
                price[count] = items[i].price;
                indexo[count] = items[i].itemId;
                count++;
            }
        }
        return (naam, price, indexo);
    }

    //Buying the item from the list and money seller ko jayega
    function buyItem(uint256 _itemId) public payable{
        require(items[_itemId].status == false, "Sorry Bro/Sis item is already sold.");
        require(msg.value == items[_itemId].price, "You are not sending correct value of my product. Please send the correct value.");
        items[_itemId].status = true;//Item solded 
        address payable seller = payable(items[_itemId].seller);//Jisko sell karna hai uska address
        uint256 amount = items[_itemId].price;//Product ki price
        payable(seller).transfer(amount);//Seller ko paisa
    }

    //Addtional funtion to see log history of all the solded items
    function displaySoldedItems() public view returns(string[] memory naamOfAllProduct , uint256[] memory priceInWei, int[] memory productID){
        //memory array is used by apun to store value for displaying
        string[] memory naam = new string[](items.length);
        uint256[] memory price = new uint256[](items.length);
        int[] memory indexo = new int[](items.length);
        uint256 count = 0;
        //Simple traverse karo and check karo ki product sold hai ya nahi
        for(uint256 i = 0; i < items.length; i++){
            if(items[i].status == true){
                naam[count] = items[i].naam;
                price[count] = items[i].price;
                indexo[count] = items[i].itemId;
                count++;
            }
        }
        return (naam, price, indexo);//returning the solded items
    }


}