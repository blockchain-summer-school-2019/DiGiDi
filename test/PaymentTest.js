const DiGiDiMarketPlace = artifacts.require("DiGiDiMarketPlace");
const Payments = artifacts.require("Payments");

const chai = require('chai');
const BN = require('bn.js');

chai.should();
chai.use(require('chai-bn')(BN));


contract("Payments", accounts => {

    const accountOne = accounts[1];
    const accountTwo = accounts[2];

    it("concise text", async () => {
        const digidi = await DiGiDiMarketPlace.new();
        const payment = await Payments.new();

        let actualVal = await payment.getBalance(accountOne);
        //assert.equal(actualVal, 0, "The account was already charged");
    });

});