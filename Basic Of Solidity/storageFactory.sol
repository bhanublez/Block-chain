// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./simpleStorage.sol";
contract storageFactory{
    SimpleStorage[] public simpelStorageArr;
    function createSimpleStorage() public{
        SimpleStorage  simpelStorage=new SimpleStorage();
        simpelStorageArr.push(simpelStorage);
    }

    function sfStore(uint _simpleStorageindex,uint _simpleStoragenumber) public{
        //Adress
        //ABI-Application Binary Interface
        SimpleStorage  simpelStorage=SimpleStorage(simpelStorageArr[_simpleStorageindex]);
        simpelStorage.set(_simpleStoragenumber);
    } 

    function sfGet(uint _simpleSotorageIndex) public view returns(uint){
        SimpleStorage simpleStorage=simpelStorageArr[_simpleSotorageIndex];
        return simpleStorage.get();
    }
}