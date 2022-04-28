require("@nomiclabs/hardhat-waffle")
require("@nomiclabs/hardhat-etherscan")

const ALCHEMY_API_KEY = "qDt9cjvPgL-PpphIWQUi2AEIsIbFDtls";
const ROPSTEN_PRIVATE_KEY ="0d76b22bd5147c72d61d96ef9cf76009de497186372fa41ef77782543f21bd95";

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
 module.exports = {
  solidity: "0.8.4",
  networks: {
    ropsten: {
      url: `https://eth-ropsten.alchemyapi.io/v2/${ALCHEMY_API_KEY}`,
      accounts: [`0x${ROPSTEN_PRIVATE_KEY}`],
    },
  },
  etherscan: {
    apiKey: '4X9GWFUZN2KUPA5DHCBJB67HDSIR16GB2C',
  },
};  
