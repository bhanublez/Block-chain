// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// Construct a contract with a function updateProductPrice that takes 

// productId and newPrice as inputs. 

// Utilize the products mapping to update the price of a specific product.

contract Products{

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

    function updateProductPrice(uint256 pID,uint256 newPrice) public{
        products[pID].keemat=newPrice;
    }
    
}
