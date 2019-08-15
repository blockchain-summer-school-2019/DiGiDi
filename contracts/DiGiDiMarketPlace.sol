pragma solidity ^0.5.8;

import "./MediaLibrary.sol";

/*
    The market place
*/
contract DiGiDiMarketPlace {

    // The end user streaming music
    struct User {
        address user;
        uint256 listenCounter;
    }

    MediaLibrary mL;

    constructor() public {

    }

    function setMediaLibrary(address mLAddress) public {
        mL = MediaLibrary(mLAddress);
    }

    // A user wants to stream a song
    function requestMediaFileStream(string memory mediaId) public view returns(bool) {
        mL.retrieveMediaFile(mediaId);

        return true;
    }

    // A user wants to stream a song
    function requestMediaFileDownload() public pure returns(bool) {

        return true;
    }
}