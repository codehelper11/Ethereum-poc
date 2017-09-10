pragma solidity ^0.4.4;

contract IdentityConfirmation {
    address createdBy;   
    address who;          
    bool confirmed;      
    
  
    event IdentityConfirmed(address who1);
    
    function IdentityConfirmation(address _who) {
        who = _who;
        createdBy = msg.sender;
        confirmed = false;
    }
    
    
    function confirm() {
        if (who == msg.sender) {
            confirmed = true;
            IdentityConfirmed(msg.sender);    
            selfdestruct(createdBy);
        }
    }
    
    function() {
        revert();
    }
}