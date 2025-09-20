const { ethers } = require("hardhat");

async function main() {
  console.log("🎨 Starting NFT minting process...");

  // Contract address (your deployed contract)
  const CONTRACT_ADDRESS = "0x3eFe95995C9a05D750A8e60371c5e426EA28637A";
  
  // You need to replace this with your actual metadata hash from Pinata
  const METADATA_URI = "bafkreieg4lxxqed34oda2kixk4estsx5cspeuhezjr64kswxt6p3xnoqyy"; // REPLACE THIS!

  console.log(`📋 Minting parameters:`);
  console.log(`   Contract: ${CONTRACT_ADDRESS}`);
  console.log(`   Metadata URI: ${METADATA_URI}`);


  // Get contract instance
  const ParrOdessa42 = await ethers.getContractFactory("ParrOdessa42");
  const contract = ParrOdessa42.attach(CONTRACT_ADDRESS);

  // Get signer info
  const [signer] = await ethers.getSigners();
  console.log(`👤 Minting to: ${signer.address}`);

  // Check contract state
  console.log("\n📊 Contract State:");
  console.log(`   Max Supply: ${await contract.MAX_SUPPLY()}`);
  console.log(`   Current Supply: ${await contract.totalSupply()}`);
  console.log(`   Mint Price: ${ethers.formatEther(await contract.mintPrice())} ETH`);
  console.log(`   Minting Enabled: ${await contract.mintingEnabled()}`);

  // Check if we can mint
  const currentSupply = await contract.totalSupply();
  const maxSupply = await contract.MAX_SUPPLY();
  
  if (currentSupply >= maxSupply) {
    console.error("❌ Maximum supply reached! Cannot mint more NFTs.");
    process.exit(1);
  }

  if (!(await contract.mintingEnabled())) {
    console.error("❌ Minting is disabled!");
    process.exit(1);
  }

  try {
    // Mint NFT (owner minting - free)
    console.log("\n⏳ Minting NFT...");
    const mintTx = await contract.mintNFT(signer.address, METADATA_URI);
    console.log(`📝 Transaction hash: ${mintTx.hash}`);
    
    console.log("⏳ Waiting for confirmation...");
    const receipt = await mintTx.wait();
    console.log(`✅ Transaction confirmed in block: ${receipt.blockNumber}`);

    // Get the token ID (should be current supply - 1)
    const tokenId = await contract.totalSupply() - 1n;
    console.log(`🎉 NFT minted successfully!`);
    console.log(`   Token ID: ${tokenId}`);
    console.log(`   Owner: ${signer.address}`);
    console.log(`   Metadata URI: ${METADATA_URI}`);

    // Verify ownership
    const owner = await contract.ownerOf(tokenId);
    console.log(`🔍 Ownership verification: ${owner === signer.address ? "✅ Verified" : "❌ Failed"}`);

    // Get token URI
    const tokenURI = await contract.tokenURI(tokenId);
    console.log(`📄 Token URI: ${tokenURI}`);

    // Get balance
    const balance = await contract.balanceOf(signer.address);
    console.log(`💰 Balance: ${balance} NFT(s)`);

    console.log("\n🎯 Next Steps:");
    console.log("1. View your NFT on Etherscan");
    console.log("2. Test the ownerOf function");
    console.log("3. Transfer NFT to another address (optional)");

  } catch (error) {
    console.error("❌ Minting failed:", error.message);
    
    if (error.message.includes("insufficient funds")) {
      console.log("💡 Make sure you have enough ETH for gas fees");
    } else if (error.message.includes("Maximum supply reached")) {
      console.log("💡 All 42 NFTs have been minted");
    } else if (error.message.includes("Minting is currently disabled")) {
      console.log("💡 Minting has been disabled by the contract owner");
    }
    
    process.exit(1);
  }
}

main()
  .then(() => {
    console.log("\n🎉 Minting process completed!");
    process.exit(0);
  })
  .catch((error) => {
    console.error("❌ Minting process failed:", error);
    process.exit(1);
  });
