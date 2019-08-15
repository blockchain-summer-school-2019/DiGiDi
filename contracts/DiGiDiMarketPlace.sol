pragma solidity ^0.5.8;

import "./MediaLibrary.sol";
import "./Payments.sol";

/*
    The market place
*/
contract DiGiDiMarketPlace is MediaLibrary {

    Payments payments;

    // Manages that a user is able to retrieve a media file
    function requestMediaFileStream(string memory mediaId) public view returns(bytes32, bytes32) {

        /**
        require(checkAccessToMediaFile(mediaId), "You are not permitted to access this file");

        //Check if the file exists
        MediaFile memory file = mediaLibrary[stringToBytes32(trackId)];

        //Check if the user has enough balance to pay the media file
        payments.getBalance(tx.sender);

        //Get all stakeholders and their shares
        //Shareholder[] sh = ..

        //Update the balance of all stakeholders
        payments.updateOwed();
        */
        bytes32 ipfsAddress1 = "asdadas";
        bytes32 ipfsAddress2 = "asdadas";


        return (ipfsAddress1, ipfsAddress2);
    }

    // A user wants to stream a song
    function requestMediaFileDownload() public pure returns(bool) {

        return true;
    }

    //Get balance
    function getBalance() public returns(uint128) {
        return payments.getBalance(msg.sender);
    }

    // Request payment
    function requestPayment() public returns(bool) {
        return payments.requestPayment(msg.sender);
    }



    // Set the address of the payment contract
    function setPaymentsAddress(address t) public returns(bool) {
        require(msg.sender == owner, "You are not the owner");
        payments = Payments(t);
        return true;
    }
}