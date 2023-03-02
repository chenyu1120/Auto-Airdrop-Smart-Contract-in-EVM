const Token = artifacts.require("Token");
const Airdrop = artifacts.require("Airdrop");

module.exports = async function(deployer) {
  // Begin Token Smart Contract Deployment
  await deployer.deploy(Token);
  const TOKEN_CONTRACT = await Token.deployed();
  // End Token Smart Contract Deployment

  // Begin Airdrop Smart Contract Deployment
  await deployer.deploy(Airdrop, TOKEN_CONTRACT.address);
  const AIRDROP_CONTRACT = await Airdrop.deployed();
  // End Airdrop Smart Contract Deployment
};
