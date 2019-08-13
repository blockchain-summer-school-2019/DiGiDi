pragma solidity ^0.5.8;

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/*
    The smart contract should fulfill all requirements of the ERC20 standard as required by the Drizzle Framework
*/

contract DiGiDiMarketPlace is ERC20 {
    using SafeMath for uint256;

    uint256 numOfMedia;

    constructor() DiGiDiMarketPlace() public {
        numOfMedia = 0;
    }

    /*
        Returns the current number of media files orchestrated by the smart contract.
    */
    function getNumOfMedia() public view returns(uint256) {
        return numOfMedia;
    }


    /*
        Add a new media file to the smart contract
    */
    function registerMedia() public returns(bool) {

        numOfMedia = numOfMedia.add(1);

        return true;
    }


    /*
        Remove an already registered media file from the smart contract registry
    */
    function unregisterMedia() public returns(bool) {

        numOfMedia = numOfMedia.sub(1);

        return true;
    }


    /*
        Request an retrieve a registered media file
    */
    function retrieveMediaFile() public pure returns(bool) {

        return true;
    }
}
