// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

//EVM Etherium virtual machine
// Avalance, Fantom, Polygon ->For deploying
contract SimpleStorage{
    uint storeData;
    
    mapping(string=>uint) public nameToMyNum;

    People public people = People({myNum: 2,name: "Bhanu"});

    struct People{
        uint myNum;
        string name;
    }

    People[] public pArr;
    function set(uint x) public{
        storeData=x;
    }

    function get() public view returns (uint){
        return storeData;
    } 

    function add() public pure returns (uint){
        return (1+1);
    }

    //[calldata-temp(don'nt modify), memeory-temp(modify) , storage-permanemt(modify)] , code , stack ,logs -> used for storage purpose
    //memory or calldata allocated to array, mapping and struct 

    function addPerson(string memory _name,uint _myNum) public{
        // pArr.push(People(_myNum,_name));

        People memory newperson=People({myNum: _myNum,name: _name});//People({ _myNum, _name})
        pArr.push(newperson);

        nameToMyNum[_name]=_myNum;
    }

    
    

}