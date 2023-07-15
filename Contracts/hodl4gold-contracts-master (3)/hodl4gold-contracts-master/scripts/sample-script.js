// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `npx hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
const hre = require("hardhat");

async function main() {
  const Factory = await ethers.getContractFactory("QuantumFactory");
  const factory = await Factory.deploy();
  await factory.deployed();

  const input = {
    _stakingToken: "0xCbAA1b9BFfF56d05185c8907A0a18374DC81273C",
    _earnedToken: "0x3eFA66aB2b1690e9BE8e82784EDfF2cF2dc150e0",
    _dividendToken: "0x0000000000000000000000000000000000000000",
    _rewardPerBlock: 1,
    _depositFee: 3,
    _withdrawFee: 4,
    _uniRouter: "0xD99D1c33F9fC3444f8101754aBC46c52416550D1",
    _earnedToStakedPath: [
      "0x3eFA66aB2b1690e9BE8e82784EDfF2cF2dc150e0",
      "0xcbaa1b9bfff56d05185c8907a0a18374dc81273c",
    ],
    _reflectionToStakedPath: [
      "0x0000000000000000000000000000000000000000",
      "0x0000000000000000000000000000000000000000",
    ],
    _hasDividend: false,
    _cardURL: "",
  };

  const fee = await factory.fee();

  try {
    const tx = await factory
      .createStakingContract(
        input._stakingToken,
        input._earnedToken,
        input._dividendToken,
        input._rewardPerBlock,
        input._depositFee,
        input._withdrawFee,
        input._uniRouter,
        input._earnedToStakedPath,
        input._reflectionToStakedPath,
        input._hasDividend,
        input._cardURL,
        {
          value: fee,
        }
      )
      .then((res, err) => {
        if (err) {
          console.log(err);
        }
      });

    await tx.wait().then(() => console.log("transaction 1 passed"));
  } catch (err) {
    console.log("transaction 1 failed");
    console.log(err);
  }

  try {
    const tx2 = await factory.createStakingContract(
      input._stakingToken,
      input._earnedToken,
      input._dividendToken,
      input._rewardPerBlock,
      input._depositFee,
      input._withdrawFee,
      input._uniRouter,
      input._earnedToStakedPath,
      input._reflectionToStakedPath,
      input._hasDividend,
      input._cardURL
    );

    await tx2.wait().then(() => console.log("transaction 2 passed"));
  } catch (err) {
    console.log("transaction 2 failed");
  }
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
