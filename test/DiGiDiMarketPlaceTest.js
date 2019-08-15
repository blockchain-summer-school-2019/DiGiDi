const MediaLibrary = artifacts.require("MediaLibrary");
const DiGiDiMarketPlace = artifacts.require("DiGiDiMarketPlace");

const chai = require('chai');
const BN = require('bn.js');

chai.should();
chai.use(require('chai-bn')(BN));


const shareholder_1 = accounts[7];
const shareholder_2 = accounts[8];
const shareholder_3 = accounts[9];

const shares_list = [(shareholder_1, 0.3), ]


registerMediaFile(trackId, 2, "IPFS address");

contract("DiGiDiMarketPlace", accounts => {

    const accountOne = accounts[0];
    const accountTwo = accounts[1];
    const accountThree = accounts[2];

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

        await digidi.registerMediaFile(mediaId, 200, "IPFS address", [accountOne, accountTwo], [1, 1]);
        await digidi.requestMediaFileStream(mediaId, {value:web3.utils.toWei("2")});
//market4.pay("0x0", {value:web3.utils.toWei("50")})



        digidi.requestPayment();

        // use getBalance
        /*
        assert.equal(balanceAccountTwo, 100000000000000000000, "The balance was not updated for accountTwo");
        assert.equal(balanceAccountThree, 100000000000000000000, "The balance was not updated for accountThree");
        */
    });

});

