pragma solidity ^0.4.0;

import "./mortal.sol";

contract SimpleWallet is mortal{
    
    
    mapping (address => Permission ) permittedAddresses;
    
    struct Permission {
        bool isAllowed;
        uint maxTransferAmount;
    }
    
    function addAddressToSenderList(address permitted, uint maxTransferAmount) onlyowner{
        permittedAddresses[permitted] = Permission(true , maxTransferAmount);
    }
    
    function removeAddressToSenderList (address adressToDelete) onlyowner{
        
        //in this way we are disabling it
        //permittedAddresses[adressToDelete] = Permission(false , permittedAddresses[adressToDelete].maxTransferAmount);
        
        delete permittedAddresses[adressToDelete];
    }
    
    function sendFund( address receiver, uint   amountInWeei){
        if(permittedAddresses[msg.sender].isAllowed){
            if ( permittedAddresses[msg.sender].maxTransferAmount >= amountInWeei){
                bool isTheAmountReallySent = receiver.send(amountInWeei);
                if (!isTheAmountReallySent){
                    throw;
                }else{
                    throw;
                }
            }
        }else{
            throw;
        }
    }
    
    
    
    function () payable{
        
    }
}