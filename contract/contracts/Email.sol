// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract Web3Email {
    struct Email {
        address from;
        address to;
        string subject;
        string body;
    }

    mapping (uint256 => Email) private emails;

    uint256 public totalEmails = 0;

    event EmailSendSuccessfully(uint256 emailId);

    function addEmail(address to, string calldata subject, string calldata body) public {
        totalEmails++;
        emails[totalEmails] =  Email(
            msg.sender, to, subject, body
        );

        emit EmailSendSuccessfully(totalEmails);
    }

    function getInbox() public view returns (Email[] memory) {
        Email[] memory emailByAddress = new Email[](totalEmails);
        
        uint256 count = 0;
        
        for(uint256 emailId = 1; emailId <= totalEmails; emailId++){
            if(emails[emailId].to == msg.sender){
                emailByAddress[count] = emails[emailId];
                count++;
            }
        }

        return emailByAddress;
    }

    function getOutbox() public view returns (Email[] memory) {
        Email[] memory emailByAddress = new Email[](totalEmails);
        
        uint256 count = 0;
        
        for(uint256 emailId = 1; emailId <= totalEmails; emailId++){
            if(emails[emailId].from == msg.sender){
                emailByAddress[count] = emails[emailId];
                count++;
            }
        }

        return emailByAddress;
    }
}