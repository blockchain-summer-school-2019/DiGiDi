pragma solidity ^0.5.8;

import "./Payments.sol";

/*
    The market place
*/
contract DiGiDiMarketPlace is Payments {

    event IPFSAddressEvent(string, bytes32);

    //ToDo: Connect to IPFS
    string constant TEMPORARY_IPFS_ADDRESS = "asdadas";

    // Manages that a user is able to retrieve a media file
    function requestMediaFileStream(bytes32 mediaId) public payable returns(bool) {
        //require(checkAccessToMediaFile(mediaId) == true, "You are not permitted to access this file");

        //Update the balance of all stakeholders
        updateOwed(mediaId);

        emit IPFSAddressEvent(TEMPORARY_IPFS_ADDRESS, mediaId);

        return true;
    }
}