## Goal

Our goal is to give back the power to the artists around the world by using the Blockchain technology to deobfuscate and reduce transaction costs and fees going from the user to the streaming services and from the streaming services to the artists.


### Use case

More specifically, there are areas in the world where the leading music distributers (Spotify, YouTube etc. _source_ - as of 2019) isn't being used. As an example, Greenlandic artists struggle to earn a proper income through the mentioned companies  as they pay their artists a low payment rate per song played (source), instead, they rather sell physical CD's to their userbase where profit is higher (source).
By creating a music streaming platform relying on the blockchain technology we can give back the power to the artists. All transactions going from the listener to the artist will be transparent and furthermore, the payment rate per song played will also be transparent and rely on the blockchain transaction cost and not obfuscated by big cooperates.  

## Getting started
### Prerequisites

(What things you need to install the software and how to install them)

### Installing

(something here on how to get a development env running)

### Testing
Start ganache and execute the following command in the root directory of your project

    truffle migrate
    
Start the truffle console:

    truffle console
    
Interact with your contract using:

    let digidi = await DiGiDiMarketPlace.deployed()
    let oldNumOfMediaFiles = digidi.getNumOfMediaFiles()
    digidi.registerMediaFile(web3.utils.sha3("my-file-as-a-string"), web3.utils.toWei("2"), "IPFS address", [accounts[1], accounts[2]], [3, 3]);
    digidi.getNumOfMediaFiles()
    digidi.requestMediaFileStream(web3.utils.sha3("my-file-as-a-string"), {value:web3.utils.toWei("3")});
    
    digidi.requestPayment({from:accounts[1]});
    web3.eth.getBalance(accounts[1]);
        
    digidi.requestPayment({from:accounts[2]});
    web3.eth.getBalance(accounts[2]);
    
    
## Built With

(...)

## Contributing

Want to contribute? Read the (CONTRIBUTE.md) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

(...)

## Authors

(...)

## License

This project is licensed under the MIT License - see the (LICENSE.md) file for details
