const ALCHEMY_API_KEY = "j97oMUHK697fuSs9ebZQOsnRfgks-Xez";
const OrsAccount = '0xa5b344cF49665816D0cD10ca16bae00E8aAAD046'
const CONTRACT_ADRESS = '0x08bca0Daae3F6B134FF6080741124Fee0a8340b3'
const PRIVATE_KEY = '0d76b22bd5147c72d61d96ef9cf76009de497186372fa41ef77782543f21bd95'
const {ethers} = require('hardhat')

const contract = require('../artifacts/contracts/XpToken.sol/XpToken.json') 

//provider - alchemy
const alchemyProvider = new ethers.providers.AlchemyProvider("ropsten" ,ALCHEMY_API_KEY)

// signer - me
const signer = new ethers.Wallet(PRIVATE_KEY ,alchemyProvider)

//contract instance
const xpTokenContract = new ethers.Contract(CONTRACT_ADRESS , contract.abi ,signer)

async function main(){
const orsBalance = await xpTokenContract.transfer(OrsAccount , 10000000000)
console.log(orsBalance)
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });