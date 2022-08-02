// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
 // most current version is 0.8.12 today

// visibility of variables/functions 
// public, private, external, internal 
//public adds getter function to be able to retrieve data in that variable 
// in no visibility is determined it will be set as internal 

contract SimpleStorage { 
    // boolean, uint, int, address, bytes are the data types in solidity 
    bool  hasFavoriteNumber = false;

    uint favoriteNumber; // if there is no set value the null value for uint is 0 
    // we can add bit size after uint like 'uint256' to add memory size limit to the variable we are trying to add 
    uint256 favoriteNumber256 = 5; 
    string favoriteNumberInText = 'Five'; 
    int256 favoriteInt = -5;
    address myAddress = 0x0609b6D94F72666Dd02c7264B4Aa1327f0566ae7;
    bytes32 favoriteBytes = 'cat'; 
    // cannot do bytes64 with the string or it will give us an error
// 


    //mapping 
    mapping(string => uint256) public nameToFavoriteNumber;

    //object will hold their name and favorite number in an object format
    struct People {
        uint256 favoriteNumber; 
        string name; 
    }

    //uint256[] public favoriteNumbersList;
    People[] public people; 
   // People[4] public people; // will only have max of 4 people in the array


    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber; // we prefix with _ is because we want to differentiate local variables and global variables 
        // if we put more functions then we add more gas 
        favoriteNumber = favoriteNumber + 1;
        retrieve();// if we add retrieve here then it will cost gas to call retrieve 
    }
//address of the contract we deployed on remix 
//0xd9145CCE52D386f254917e481eB44e9943F39138
    // view, pure we are only reading state in contract, wiht view we can't modify states also with pure. but pure cant read from blockchain
    function retrieve() public view returns(uint256) {
        return favoriteNumber; 
    }

    function add() public pure returns(uint256) {
        return(1 + 1); // will only return whats inside cant be mutated
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public  { // string needs memory because it is an array of bytes, favorite number is just a couple of bytes. memory is used on struct, bytes or arrays 
       // people.push(People(_favoriteNumber, _name)); // will add a person to the people array. we could also do this with a mapping 
    // can also do this by 
    People memory newPerson = People ({favoriteNumber: _favoriteNumber, name: _name});
    people.push(newPerson); 
    // we us memory keyword because... 

    // can also do 
    //People memory newPerson = People(_favoriteNumber, _name);
    //people.push(newPerson);
    // or 
    //people.push(Poeple(_favoriteNumber, _name));
    nameToFavoriteNumber[_name] = _favoriteNumber; // this will add favorite numbers to a mapping of the people
    }


}


// memory is needed or else we get an error 

// 6 places we can store memory 
// stack 
// mamory 
// storage 
// call data 
// code
//logs
//3 most important and the ones we cover here is memory, storage, call data

//call data and memory are variables that only exist temporarily in the function or transaction that is being called 

// storage data exist outside the function that is executed, variables that are declared globally are storage variables

// clal data is temporarily variable that cant be modified, memory can be modified but both are only avaialble in transactions or functions
