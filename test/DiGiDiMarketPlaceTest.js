const DiGiDiMarketPlace = artifacts.require("DiGiDiMarketPlace");

contract("DiGiDiMarketPlace", accounts => {

    it("get the number of registered media files", () =>
        DiGiDiMarketPlace.deployed()
            .then(instance => instance.registerMedia.call())
            .then(numOfMediaFiles => {

                var expectedVal = 1;

                assert.equal(
                    expectedVal,
                    numOfMediaFiles,
                    "The media could not be registered."
                );
            }));
});