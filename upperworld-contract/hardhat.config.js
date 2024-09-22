require("@nomicfoundation/hardhat-toolbox");

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.27",
  networks: {
    hardhat: {},
    rootstockTestnet: {
      url: "https://public-node-test.rsk.co",
      accounts: ['private.env.key'],
      chainId: 31
    }
  }
};
