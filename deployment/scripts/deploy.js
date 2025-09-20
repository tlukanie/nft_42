const { ethers } = require("hardhat");

async function main() {
  console.log("🚀 Starting ParrOdessa42 deployment...");

  // Get the contract factory
  const ParrOdessa42 = await ethers.getContractFactory("ParrOdessa42");

  // Contract parameters
  const name = "ParrOdessa42";
  const symbol = "POD42";
  const baseURI = "https://ipfs.io/ipfs/";

  console.log("📋 Deploying contract with parameters:");
  console.log(`   Name: ${name}`);
  console.log(`   Symbol: ${symbol}`);
  console.log(`   Base URI: ${baseURI}`);

  // Deploy the contract
  console.log("⏳ Deploying contract...");
  const parrOdessa42 = await ParrOdessa42.deploy(name, symbol, baseURI);

  await parrOdessa42.waitForDeployment();

  const contractAddress = await parrOdessa42.getAddress();
  console.log(`✅ ParrOdessa42 deployed to: ${contractAddress}`);

  // Get deployment info
  const [deployer] = await ethers.getSigners();
  console.log(`👤 Deployed by: ${deployer.address}`);

  // Get network info
  const network = await ethers.provider.getNetwork();
  console.log(`🌐 Network: ${network.name} (Chain ID: ${network.chainId})`);

  // Check contract state
  console.log("\n📊 Contract State:");
  console.log(`   Max Supply: ${await parrOdessa42.MAX_SUPPLY()}`);
  console.log(`   Mint Price: ${ethers.formatEther(await parrOdessa42.mintPrice())} ETH`);
  console.log(`   Minting Enabled: ${await parrOdessa42.mintingEnabled()}`);
  console.log(`   Total Supply: ${await parrOdessa42.totalSupply()}`);

  // Save deployment info
  const deploymentInfo = {
    contractAddress: contractAddress,
    deployer: deployer.address,
    network: network.name,
    chainId: network.chainId.toString(),
    timestamp: new Date().toISOString(),
    transactionHash: parrOdessa42.deploymentTransaction().hash,
    contractName: name,
    contractSymbol: symbol,
    baseURI: baseURI,
    maxSupply: "42",
    mintPrice: "0.01",
  };

  console.log("\n📄 Deployment Summary:");
  console.log(JSON.stringify(deploymentInfo, null, 2));

  // Instructions for next steps
  console.log("\n🎯 Next Steps:");
  console.log("1. Copy the contract address above");
  console.log("2. Verify contract on Etherscan:");
  console.log(`   npx hardhat verify --network sepolia ${contractAddress} "${name}" "${symbol}" "${baseURI}"`);
  console.log("3. Mint your first NFT using the mint script");
  console.log("4. Test ownership verification");

  // Instructions for verification
  console.log("\n🔍 To verify the contract on Etherscan, run:");
  console.log(`npx hardhat verify --network sepolia ${contractAddress} "${name}" "${symbol}" "${baseURI}"`);

  return {
    contractAddress,
    deployer: deployer.address,
    network: network.name,
    chainId: network.chainId.toString(),
  };
}

main()
  .then((result) => {
    console.log("\n🎉 Deployment completed successfully!");
    console.log(`Contract Address: ${result.contractAddress}`);
    process.exit(0);
  })
  .catch((error) => {
    console.error("❌ Deployment failed:", error);
    process.exit(1);
  });


