// We require the Hardhat Runtime Environment explicitly here. This is optional 
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
import type { TVKPrestige } from '../typechain/TVKPrestige'
import type { TVKTest } from '../typechain/TVKTest'
import hre from 'hardhat'

async function main() {

    // We get the contract to deploy
    // deploy TVKPrestige
    const tvktestFactory = await hre.ethers.getContractFactory(
        'TVKTest'
    );

    const tvkTest = await tvktestFactory.deploy() as TVKTest
    let deployedTvkTest = await tvkTest.deployed()
    console.log('TVKTest token deployed to ' + deployedTvkTest.address)

}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });