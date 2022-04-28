async function main() {
  const { ethers } = require("hardhat");
  const [deployer] = await ethers.getSigners();

  console.log("Deploying contracts with this account:", deployer.address);
  console.log("Account ballance:", (await deployer.getBalance()).toString());

  const Token = await ethers.getContractFactory("DEX");
  const token = await Token.deploy();   

  await token.deployed();

  console.log("Token address:", token.address);
}
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
