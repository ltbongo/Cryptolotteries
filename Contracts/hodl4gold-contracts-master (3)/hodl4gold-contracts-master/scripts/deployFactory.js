const hre = require("hardhat");

async function main() {
  const Factory = await hre.ethers.getContractFactory("QuantumFactory");
  const factory = await Factory.deploy();

  await factory.deployed();

  console.log("factory deployed to:", factory.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
