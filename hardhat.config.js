require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");

require("dotenv").config();

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.13",
  networks: {
    binance: {
      url: "https://bsc-dataseed1.binance.org",
      accounts: [process.env.PRIVATE_KEY]
    }
  },
  etherscan: {
    apiKey: {
      binance: process.env.BSCSCAN_API_KEY
    }
  }
};
