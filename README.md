## Testing
Start ganache and execute the following command in the root directory of your project

    truffle migrate
    
Start the truffle console:

    truffle develop
    
Interact with your contract using:

    let digidi = await DiGiDiMarketPlace.deployed()
    let oldNumOfMediaFiles = digidi.getNumOfMediaFiles()
    
    let mediaId = web3.utils.sha3("my-file-as-a-string")
    digidi.registerMediaFile(mediaId, web3.utils.toWei("2"), "IPFS address", [accounts[1], accounts[2]], [3, 3])
    
    digidi.updateApprover(accounts[1], true)
    
    digidi.approveMediaFile(mediaId, true)
    digidi.requestMediaFileStream(mediaId, {value:web3.utils.toWei("3")});
    
    digidi.getNumOfMediaFiles()
    digidi.requestMediaFileStream(web3.utils.sha3("my-file-as-a-string"), {value:web3.utils.toWei("3")});
    
    digidi.requestPayment({from:accounts[1]});
    web3.eth.getBalance(accounts[1]);
        
    digidi.requestPayment({from:accounts[2]});
    web3.eth.getBalance(accounts[2]);