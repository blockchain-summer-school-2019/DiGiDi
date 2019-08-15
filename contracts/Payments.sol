pragma solidity ^0.5.8;
// The current version does not use micropayments, uRaiden, nor state-channels.
// These are all technologies which could be used, but given the constraints of a 2 day hack a ton

// The purpose of this contract is to check that user has access to the song.
// If the user does not have access, the user should pay
// and then split then funds among the shares

import "@openzeppelin/contracts/math/SafeMath.sol";
import "@openzeppelin/contracts/payment/PullPayment.sol";
import "./MediaLibrary.sol";

contract Payments{

    using SafeMath for uint256;
    uint safeIndex;
    address payable owner;

    // The map of tokens/money owed.
    // The address is the address of the shareholders, and the money owed to them
    mapping (address => uint8) owed;

    // We currently request payments upfront, so the user/listener of music has a balance
    mapping (address => uint8) userBalances;

    constructor() public {
        owner = msg.sender;
    }

    // Payout to the msg.sender if they are owe some ether
    function requestPayment() public {
        require(owed[msg.sender] > 0, "You are not owed anything");
        msg.sender.send(owed[msg.sender]);
        owed[msg.sender] = 0;
    }

    // Lets the msg.sender know their balance
    function getBalance() external returns (uint8) {
        // require(owed[msg.sender] > 0, "You are not owed anything");
        return owed[msg.sender];
    }


    // Whenever a MediaFile is purchased, we update the amount owed
    function updateOwed(MediaLibrary.MediaFile mediaFile) external {
        shareholders = mediaFile.shareholders;

        for (uint i=safeIndex; i<shareholders.length; i++) {

            address currentShareholder = shareholders[i].shareholder;

            // There might be some problems with the rounding and stuff
            uint256 amountToShareholder_i = shareRatios[i] * price;

            owed[currentShareholder] += amountToShareholder_i;
            safeIndex = i;
        }

        safeIndex = 0;
    }

    // Receives user payment and update user balances
    function () payable {
        userBalances[msg.sender] += msg.value;
    }

    // Check if the user has sufficient funds
    function enoughFunds(address user, MediaLibrary.MediaFile mediaF) {
        //todo
    }
}
