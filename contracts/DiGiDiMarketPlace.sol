pragma solidity ^0.5.8;

import "./Payments.sol";

/*
    The market place
*/
contract DiGiDiMarketPlace is Payments {

    event _IPFSAddress(string);

    // Manages that a user is able to retrieve a media file
    function requestMediaFileStream(string memory id) public payable returns(bool) {
        //require(checkAccessToMediaFile(mediaId) == true, "You are not permitted to access this file");

        bytes32 mediaId = stringToBytes32(id);

        //Check if the file exists
        //ToDo: Check for null pointer
        MediaFile memory file = mediaLibrary[mediaId];

        //Check if the user has enough balance to pay the media file
        getUserBalance(msg.sender);

        //Get all stakeholders and their shares
        //Shareholder[] sh = ..

        //Update the balance of all stakeholders
        updateOwed(mediaId);

        //ToDo: Connect to IPFS
        string memory ipfsAddress = "asdadas";

        emit _IPFSAddress(ipfsAddress);

        return true;
    }

    // A user wants to stream a song
    function requestMediaFileDownload() public pure returns(bool) {

        return true;
    }

    // Request payment
    function requestPayment() public returns(bool) {
        return requestPayment(msg.sender);
    }

}