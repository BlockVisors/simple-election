
var HDWalletProvider = require("truffle-hdwallet-provider");

var infura_apikey = "ad09b34ad0d848aa9cedee653f16b88c";
var mnemonic = "poet busy dog crash confirm warm scene scout burden hurt put harvest";

module.exports = {
  networks: {
    development: {
      host: "localhost",
      port: 7545,
      network_id: "*" // Match any network id
    },
    ropsten: {
      provider: new HDWalletProvider(mnemonic, "https://ropsten.infura.io/"+infura_apikey),
      network_id: 3
    }
  }
};