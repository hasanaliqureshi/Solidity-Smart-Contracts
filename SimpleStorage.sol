pragma solidity ^0.4.0; 

// Simple Storage Contract

contract SimpleStorage {
    uint storedInteger; /*Integer Storage Variable*/
    
    /*function to set integer*/
    function set(uint x) public {
        storedInteger = x;
    }

    /*function to return stored integer*/
    function get() constant public returns (uint)  {
        return storedInteger;
    }
    
    /*function to increment(add) intenger to the stored integer*/
    function increment (uint n) public {
        storedInteger = storedInteger + n;
        return;
    }
    
    /*function to decrement(minus) integer from the stored integer*/
    function decrement (uint n) public {
        storedInteger = storedInteger - n;
        return;
    }
    
}
