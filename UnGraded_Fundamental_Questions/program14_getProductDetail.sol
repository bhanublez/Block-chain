// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;


// Create a contract with a function getProductInfo that takes a productId as input and 
// returns the associated productName and price using the products mapping.

//Kitna boring lagta waspse ek hi code ko wapse likna and what but you reader
contract getProductDetail {
    struct Product {
        string naam;
        uint256 kitna;
    }
    
    mapping(uint256 => Product) public products;
    
    function addProductDetails(uint256 productId, string memory naam, uint256 kitna) public {
        Product memory product = Product(naam, kitna);
        products[productId] = product;
    }
    
    function getProductInfo(uint256 productId) public view returns(string memory, uint256) {
        return (products[productId].naam, products[productId].kitna);
    }
}