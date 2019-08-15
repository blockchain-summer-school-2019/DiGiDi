pragma solidity ^0.5.8;
// The current version does not use micropayments, uRaiden, nor state-channels.
// These are all technologies which could be used, but given the constraints of a 2 day hack a ton

// The purpose of this contract is to check that user has access to the song.
// If the user does not have access, the user should pay
// and then split then funds among the shares

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/payment/PullPayment.sol";
import "./MediaLibrary.sol";

contract Payments {
    using SafeMath for uint256;

    uint safeIndexOwed = 0;
    address payable owner;

    /**
        The map of tokens/money owed.
        The address is the address of the shareholders, and the money owed to them
        All values are calculated in Finney because of the insufficient decimal calculation of Solidity
    */
    mapping (address => uint128) owed;

    constructor() public {
        owner = msg.sender;
    }

    // Payout to the msg.sender if they are owe some ether
    function requestPayment(address usr) public returns(bool) {
        require(owed[usr] > 0, "You are not owed anything");

        owed[usr] = 0;
        msg.sender.transfer(owed[usr]);

        return true;
    }

    // Lets the msg.sender know their balance
    function getBalance(address usr) external returns (uint128) {
        // require(owed[msg.sender] > 0, "You are not owed anything");
        return owed[usr];
    }


    // Whenever a MediaFile is purchased, we update the amount owed
    function updateOwed(address shareholder, uint8 amount) external returns(bool) {
        owed[shareholder] += amount;
        return true;
    }

    // Check if the user has sufficient funds
    function enoughFunds(address usr, uint8 price) public returns(bool) {
        //todo

        return true;
    }
}
