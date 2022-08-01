const { ethers, network } = require("hardhat");

async function deploy() {
  console.log("Now deploying on ", network.name);

  const TokenFactory = await ethers.getContractFactory("Token");
  let token = await TokenFactory.deploy("Eternalus Exchange Token", "EET", ethers.utils.parseEther("1000000000"));
  token = await token.deployed();

  console.log("Token deployed to address ", token.address);
}

(async () => {
  await deploy();
})();
