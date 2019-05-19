pragma solidity ^0.4.0;

contract Greeting {
    
    /*string variable defined*/
    string public userName;
    
    /*function to set userName default value*/
    function Greater() public{
        userName = 'World';
    }
    
    /*function to set userName value*/
    function set(string name) public{
        userName = name;
    }
    
    /*function to return userName value*/
    function hello() constant public returns (string){
        return userName;
    }
    
}