pragma solidity ^0.5.8;

import "./MediaLibrary.sol";

/*
    Here
*/
contract DiGiDiMarketPlace is MediaLibrary {

    // The end user streaming music
    struct User {
        string firstname;
        string lastname;
        uint256 listenCounter;
    }

    constructor() DiGiDiMarketPlace() public {

    }

    // A user wants to stream a song
    function requestMediaFileStream() public pure returns(bool) {

        return true;
    }

    // A user wants to stream a song
    function requestMediaFileDownload() public pure returns(bool) {

        return true;
    }
}
