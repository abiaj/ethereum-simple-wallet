pragma solidity ^0.4.0;

contract mortal {
    address owner;
    function mortal(){
        owner = msg.sender;
    }
    
    modifier onlyowner(){
        if(owner == msg.sender){
        _;
        }else{
            throw;
        }
        
    }
    
        function kill() onlyowner{
            suicide(owner);
    }
}