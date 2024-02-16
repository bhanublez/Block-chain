// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;

// Develop a contract with a function addProductDetails that allows adding 
// product details (productId, productName, price). 
// Utilize a struct to organize and store this information in a mapping.

contract addProductDetailsContract {
    struct Product {
        string naam;
        uint256 kitna;
    }
    
    mapping(uint256 => Product) public products;
    
    function addProductDetails(uint256 productId, string memory naam, uint256 kitna) public {
        Product memory product = Product(naam, kitna);
        products[productId] = product;
    }
}
