// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Problem Statement 5: Product Ownership Registry

// Objective: Develop a contract ProductRegistry to register and transfer ownership of products.

// Use a struct named Product that includes properties for product ID and current owner address.
// Implement a mapping from product ID to Product.
// Write a function for product registration, assigning the caller as the initial owner.
// Create a function to transfer product ownership to another address, ensuring only the current owner can transfer the product.

contract ProductRegistry{
    
    struct Product{
        string name;
        string productId;
        address owner;
    }

    mapping(string=>Product) private products;

    function proReg(string memory pID,string memory naam) public{        
        products[pID]=Product({name: naam,productId: pID,owner: msg.sender});
    }

    function transOS(string memory pID,address add) public{
        require(products[pID].owner==msg.sender,"Tu owner nahi hai");
        products[pID].owner=add;
    }

    function getOwner(string memory pID) public view returns(address){
        return products[pID].owner;
    }

    function productInfo(string memory pID) public view returns(string memory naam,string memory prID, address ownerKaAddress){
        return (products[pID].name,products[pID].productId,products[pID].owner);
    }


}