## Testing
Start ganache and execute the following command in the root directory of your project

    truffle migrate
    
Start the truffle console:

    truffle console
    
Interact with your contract using:

    let instance = await DiGiDiMarketPlace.deployed()
    let oldNumOfMediaFiles = instance.getNumOfMediaFiles()
    instance.getNumOfMediaFiles()
    instance.registerMediaFile("Hello Joe", "Jimi Hendrix", "asdadas", 14, 8, 2019, 100)