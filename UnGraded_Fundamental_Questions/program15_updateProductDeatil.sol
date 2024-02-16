// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;


// Construct a contract with a function updateProductPrice that takes productId and newPrice as inputs. 
// Utilize the products mapping to update the price of a specific product.

//kitni baar likhna padega wohi code
contract updateProductDeatil {
    struct Product {
        string naam;
        uint256 kitna;
    }
    
    mapping(uint256 => Product) public products;
    
    function addProductDetails(uint256 productId, string memory naam, uint256 kitna) public {
        Product memory product = Product(naam, kitna);
        products[productId] = product;
    }
    
    function updateProductPrice(uint256 productId, uint256 newKeemat) public {
        products[productId].kitna = newKeemat;
    }
}