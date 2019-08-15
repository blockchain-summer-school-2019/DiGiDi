pragma solidity ^0.5.8;

import "./Payments.sol";

/*
    The market place
*/
contract DiGiDiMarketPlace is Payments {
    using SafeMath for uint256;

    event IPFSAddressEvent(string, bytes32);
    event GetMediaFilePriceEvent(uint256);

    //ToDo: Connect to IPFS
    string constant TEMPORARY_IPFS_ADDRESS = "asdadas";

    // Manages that a user is able to retrieve a media file
    function requestMediaFileStream(bytes32 mediaId) public payable returns(bool) {

        // The price of the song
        uint256 price = getPrice(mediaId);

        require(price > 0, "Media has no price");

        // Make sure the msg had enough ether
        require(price <= msg.value, "Not enough funds sent");


        //require(checkAccessToMediaFile(mediaId) == true, "You are not permitted to access this file");

        //Update the balance of all stakeholders
        updateOwed(mediaId);

        // Pay back change
        uint256 change = msg.value.sub(price);

        emit IPFSAddressEvent(TEMPORARY_IPFS_ADDRESS, mediaId);
        msg.sender.transfer(change);

        return true;
    }

    function getPrice(bytes32 mediaId) public returns (uint256) {
        emit GetMediaFilePriceEvent(mediaLibrary[mediaId].price);
        return mediaLibrary[mediaId].price;
    }

//    function pay(bytes32 mediaId) payable public returns(bool){
//
//
//        // The price of the song
//        uint256 price = getPrice(mediaId);
//
//        require(price > 0, "Media has no price");
//
//        // Make sure the msg had enough ether
//        require(price <= msg.value, "Not enough funds sent");
//
//        // Make sure shareholders are paid
//        updateOwed(mediaId);
//
//        // Pay back change
//        uint256 change = msg.value.sub(price);
//
//        msg.sender.transfer(remittance);
//        return true;
//    }

}