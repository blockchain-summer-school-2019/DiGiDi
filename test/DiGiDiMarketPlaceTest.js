const DiGiDiMarketPlace = artifacts.require("DiGiDiMarketPlace");

contract("DiGiDiMarketPlace", accounts => {

    it("get the number of registered media files", () => {

        const account_one = accounts[0];
        const account_two = accounts[1];

        return DiGiDiMarketPlace.deployed()
            .then(instance => {

                // Test data
                let trackId = "my file as a string";

                instance.registerMediaFile.call(trackId);
                return instance.getNumOfMediaFiles.call();
            })
            .then(numOfMediaFiles => {

                // ToDo: Cast to same BigInt
                /*
                let expectedVal = BigInt(1);
                let actualVal = numOfMediaFiles;

                assert.equals(
                    expectedVal,
                    actualVal,
                    "something went wrong during the registration."
                );
                */
            });
    });
});