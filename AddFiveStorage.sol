// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {SimpleStorage} from "./SimpleStorage.sol";
contract AddFiveStorage is SimpleStorage{
        //here we are trying to overide a fucntion in imported contract
        //for that we need 2 key words    VIRTUAL and OVERRIDE

        //we need to add ovveride here and also should virtualize the store fucntion in the simplestorgae contract
        function store(uint _newNumber) public override {
            myFavoriteNumber = _newNumber +5 ;
        }
        
}