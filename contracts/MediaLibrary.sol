pragma solidity ^0.5.8;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/*
    The smart contract should fulfill all requirements of the ERC20 standard as required by the Drizzle Framework
*/

contract MediaLibrary is ERC20 {

    struct Date {
        uint8 day;
        uint month;
        uint year;
    }

    struct User {
        string firstname;
        string lastname;
        unint256 listenCounter;
    }

    struct Artist {
        address artist;
        string name;
        MediaFile[] mediaFiles;
    }

    struct MediaFile {
        byte32 id;
        Artist artist;
        string metaDataHash;
        Date date;
        uint share;
        bool approved;
    }


    uint256 numOfMedia;         // Number of media files
    address payable owner;      // Person, who deployed this smart contract

    mappging(address, );

    constructor() public {
        owner = msg.sender;
        numOfMediaFiles = 0;
    }

    /*
    Returns the current number of media files orchestrated by the smart contract.
    */
    function getNumOfMedia() public view returns(uint256) {
        return numOfMediaFiles;
    }


    /*
        Add a new media file to the smart contract
    */
    function registerMedia() public returns(bool) {

        numOfMediaFiles = numOfMediaFiles.add(1);

        return true;
    }


    /*
        Update a registered media file
    */
    function updateMediaFile() public returns(bool) {



        return true;
    }


    /*
        Remove an already registered media file from the smart contract registry
    */
    function unregisterMedia() public returns(bool) {




        numOfMediaFiles = numOfMediaFiles.sub(1);

        return true;
    }


    /*
        Request an retrieve a registered media file
    */
    function retrieveMediaFile() public pure returns(bool) {

        return true;
    }


    /*
        Approve a registered media file
    */
    function approveMediaFile(

    ) public returns(bool) {

        return true;
    }

}