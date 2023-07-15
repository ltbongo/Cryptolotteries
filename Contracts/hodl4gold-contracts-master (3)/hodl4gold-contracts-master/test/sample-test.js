const { expect } = require("chai");
const { ethers } = require("hardhat");
const {
  isCallTrace,
} = require("hardhat/internal/hardhat-network/stack-traces/message-trace");

// describe("Greeter", function () {
//   it("Should return the new greeting once it's changed", async function () {
//     const Greeter = await ethers.getContractFactory("Greeter");
//     const greeter = await Greeter.deploy("Hello, world!");
//     await greeter.deployed();

//     expect(await greeter.greet()).to.equal("Hello, world!");

//     const setGreetingTx = await greeter.setGreeting("Hola, mundo!");

//     // wait until the transaction is mined
//     await setGreetingTx.wait();

//     expect(await greeter.greet()).to.equal("Hola, mundo!");
//   });
// });

// describe("Deploy test", function () {
//   it("should return the deployed staking contract address", async function () {
//     const Factory = await ethers.getContractFactory("QuantumFactory");

//     const factory = await Factory.deploy();
//     await factory.deployed();

//     //calling create contract function
//     const tx = await factory.createStakingContract();

//     const add = await tx.wait();

//     console.log(add);
//   });
// });

describe("second time contract creation", function () {
  it("should create two contracts with one signer", async function () {
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
  });
});
