// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

// Importing the SimpleStorage contract from another Solidity file (namded import)
import {SimpleStorage} from "./SimpleStorage.sol";

contract StorageFactory {
    mapping (string => address) public companytoAddr;
    //listOfsimpleStorage; actully stores isntance of the contract "SimpleStorage"
    SimpleStorage[] public listOfsimpleStorage;
    //here the SimpleStorage[] is actually a data type like struct so we created a array of this type like array of struct  
    // Function to create a new instance of SimpleStorage
    function CreateSimpleStorage(string memory _name) public {
        // Deploy a new SimpleStorage contract
        SimpleStorage newsimpleStorage = new SimpleStorage();

        // Store the deployed contract in the list
        listOfsimpleStorage.push(newsimpleStorage);

        // Map the company name to the deployed contract's address
        companytoAddr[_name] = address(newsimpleStorage);
    }

    //now lets interact with deployed contract from this contract 
    //here we are wrting a fucntion (sfStrore) that will interact with store function of a deployed contract
    function sfStrore(uint256 _simpleStorageIndex, uint256 _newSimpleStorageNumber) public{
        //here the _simpleStorageIndex is a index used to get the adress stored in  SimpleStorage[] public listOfsimpleStorage;

        //we need address and ABI to interact with contract 
        SimpleStorage mySimpleStorage =listOfsimpleStorage[_simpleStorageIndex];
        //^^ for now lets take  SimpleStorage  as a type 

        mySimpleStorage.store(_newSimpleStorageNumber);

    }

    function sfGet(uint256 _simpleStorageIndex) public view returns (uint256){

        //here inside listOfsimpleStorage[] its not address its instance that are being stored 
        //in In Solidity, the data type of a contract instance is the contract name itself.
        //that is why we write like "SimpleStorage myContract; " where myContract is variable that hold instance of SimpleStorage 
        SimpleStorage mySimpleStorage=listOfsimpleStorage[_simpleStorageIndex];

        //so here mySimpleStorage holds instance of the contract isteaf of that 
        //the is also works
        //  ##listOfsimpleStorage[_simpleStorageIndex].retrieve();
        
        return mySimpleStorage.retrieve();
        
    }
}
