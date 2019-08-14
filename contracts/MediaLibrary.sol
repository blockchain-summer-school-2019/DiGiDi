pragma solidity ^0.5.8;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/*
    The smart contract should fulfill all requirements of the ERC20 standard as required by the Drizzle Framework
*/

contract MediaLibrary is ERC20 {
    using SafeMath for uint256;

    struct Shares {
        address sharehodler;
        uint8 share;
    }

    struct  MediaFile {
        address artist;
        bool approved;
        uint8 price;
        //Shares[] shareholders;
    }

    mapping(bytes32 => MediaFile) mediaLibrary;


    uint256 numOfMediaFiles;    // Number of media files
    address payable owner;      // Person, who deployed this smart contract

    constructor() public {
        owner = msg.sender;
        numOfMediaFiles = 0;
    }

    //Returns the current number of media files orchestrated by the smart contract
    function getNumOfMediaFiles() public view returns(uint256) {
        return numOfMediaFiles;
    }


    // Add a new media file to the smart contract
    function registerMediaFile(string memory mediaFile) public returns(bool) {

        bytes32 mediaFileHash = stringToBytes32(mediaFile);

        mediaLibrary[mediaFileHash] = MediaFile(msg.sender, false, 100);

        // The media file being uploaded, downloaded, or streamed
        numOfMediaFiles = numOfMediaFiles.add(1);

        return true;
    }


    // Update a registered media file
    function updateMediaFile(string memory oldFile, string memory newFile) public returns(bool) {

        bytes32 oldFileHash = stringToBytes32(oldFile);
        bytes32 newFileHash = stringToBytes32(newFile);

        if(mediaLibrary[oldFileHash].artist  == msg.sender) {
            delete mediaLibrary[oldFileHash];


            mediaLibrary[newFileHash] = MediaFile(msg.sender, false, 100);
        }

        return true;
    }


    // Remove an already registered media file from the smart contract registry
    // ToDo: modifier owner == tx.sender
    function unregisterMediaFile(bytes32 trackId) public returns(bool) {

        delete mediaLibrary[trackId];
        numOfMediaFiles = numOfMediaFiles.sub(1);

        return true;
    }

    // Request an registered media file hash and artist
    function retrieveMediaFileArtist(string memory trackId) public view returns(address) {

        MediaFile memory mediaFile = mediaLibrary[stringToBytes32(trackId)];

        return mediaFile.artist;
    }


    // Approve a registered media file
    function approveMediaFile(bool approved, string memory trackId) public view returns(bool) {
        MediaFile memory file = mediaLibrary[stringToBytes32(trackId)];
        file.approved = approved;

        return true;
    }

    // Helper function hashing
    function createTrackId(address artist) private pure returns(bytes32) {
        uint256 _unixTimestamp;
        uint256 _timeExpired;

        return keccak256(abi.encodePacked(artist, _unixTimestamp, _timeExpired));
    }

    // Convert string to bytes32
    function stringToBytes32(string memory source) private pure returns(bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }

}