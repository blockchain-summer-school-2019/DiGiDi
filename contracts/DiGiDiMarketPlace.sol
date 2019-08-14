import "./MediaLibrary.sol";

/*
    Here
*/
contract DiGiDiMarketPlace is MediaLibrary {

    constructor() DiGiDiMarketPlace() public {

    }

    /*
        A user wants to stream a song
    */
    function requestMediaFileStream() public returns(bool) {

        return true;
    }

    /*
        A user wants to stream a song
    */
    function requestMediaFileDownload() public returns(bool) {

        return true;
    }
}
