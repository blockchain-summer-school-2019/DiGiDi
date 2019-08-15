const MediaLibrary = artifacts.require("MediaLibrary");
const DiGiDiMarketPlace = artifacts.require("DiGiDiMarketPlace");

const chai = require('chai');
const BN = require('bn.js');

chai.should();
chai.use(require('chai-bn')(BN));


contract("DiGiDiMarketPlace", accounts => {

    it("get the number of registered media files", async () => {
        const digidi = await MediaLibrary.new();

        let actualVal = await digidi.getNumOfMediaFiles();
        actualVal.should.be.a.bignumber.that.equals("0");


        let trackId = "my file as a string";
        await digidi.registerMediaFile(trackId, 2, "IPFS address");


        actualVal = await digidi.getNumOfMediaFiles();
        actualVal.should.be.a.bignumber.that.equals("1");
    });

    it("payment testing", () => {
        const account_one = accounts[1];
        const account_two = accounts[2];

    });

});