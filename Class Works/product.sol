// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Create a contract with a function getProductInfo that takes a productId as 

// input and returns the associated productName 

// and price using the products mapping.

contract product{

    struct Product{
        string productNaam;
        uint256 keemat;
    }

    mapping(uint256=>Product) public products;

    function addProduct(uint256 pID,string memory naam,uint256 kkeemat) public{
        Product memory newProduct=Product({productNaam: naam,keemat: kkeemat});
        products[pID]=newProduct;//Mapping kiya idar
    }

    function getProductInfo(uint256 pID) public view returns(string memory,uint256){
        return (products[pID].productNaam,products[pID].keemat);//Mapping se nikal liya
    }
}