const MediaLibrary = artifacts.require("MediaLibrary");
const DiGiDiMarketPlace = artifacts.require("DiGiDiMarketPlace");

const chai = require('chai');
const BN = require('bn.js');

chai.should();
chai.use(require('chai-bn')(BN));


contract("DiGiDiMarketPlace", accounts => {

    const accountOne = accounts[1];
    const accountTwo = accounts[2];

    it("get the number of registered media files", async () => {
        const digidi = await MediaLibrary.new();

        let actualVal = await digidi.getNumOfMediaFiles();
        actualVal.should.be.a.bignumber.that.equals("0");

        let file = "my-file-as-a-string";
        let mediaId = web3.utils.sha3(file);

        await digidi.registerMediaFile(mediaId, 2, "IPFS address", [accountOne, accountTwo], [3, 3]);

        actualVal = await digidi.getNumOfMediaFiles();
        actualVal.should.be.a.bignumber.that.equals("1");
    });


    it("Request media file",  async () => {
        const digidi = await DiGiDiMarketPlace.new();

        let file = "my-file-as-a-string";
        let mediaId = web3.utils.sha3(file);

        await digidi.registerMediaFile(mediaId, 2, "IPFS address", [accountOne, accountTwo], [3, 3]);
        await digidi.requestMediaFileStream(mediaId);

        digidi.requestPayment();

        //assert.isTrue(actualVal, "You did not get payed");

    });

});