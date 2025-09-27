# ParrOdessa42 NFT Project

## Project Overview

**ParrOdessa42** is a complete ERC-721 NFT collection featuring the number 42, created by artist **tlukanie**. This project demonstrates a full NFT development workflow from smart contract creation to web interface deployment.

## 🎯 Why Sepolia Testnet & Hardhat?

I chose to use **Ethereum Sepolia testnet** and **Hardhat** for this project for several reasons:

- **🆕 New Testnet Experience**: Sepolia is Ethereum's current recommended testnet, replacing Ropsten. I wanted to practice with the latest testnet infrastructure.
- **🔧 Hardhat Framework**: I wanted to try a new approach using Hardhat instead of Truffle or Remix, as it offers modern tooling, better TypeScript support, and excellent debugging capabilities.
- **🚀 Modern Development**: Hardhat provides a more streamlined development experience with built-in testing, deployment scripts, and network management.
- **💰 Cost-Effective**: Using testnet allows for unlimited experimentation without real ETH costs.

## 📁 Current Project Structure

```
nft_42/
├── deployment/              # Hardhat deployment environment
│   ├── contracts/
│   │   └── ParrOdessa42.sol # ERC-721 NFT contract
│   ├── scripts/
│   │   ├── deploy.js        # Contract deployment script
│   │   └── mint_nft.js      # Command-line minting script
│   ├── artifacts/           # Compiled contract artifacts
│   ├── cache/               # Hardhat cache files
│   ├── direct_mint.html     # Web interface for minting
│   ├── hardhat.config.js   # Hardhat configuration
│   ├── package.json         # Dependencies
│   ├── env_example.txt      # Environment variables template
│   └── README.md            # Deployment documentation
├── Metadata.json            # NFT metadata (IPFS)
├── nft.png                  # NFT image
├── NFT_42.pdf               # Project documentation
└── README.md                # This file
```

## 🚀 Quick Start

### 1. Setup Environment
```bash
cd deployment
cp env_example.txt .env
# Edit .env with your private key and RPC URL
```

### 2. Install Dependencies
```bash
cd deployment
npm install
```

### 3. Deploy Contract
```bash
cd deployment
npm run deploy
```

### 4. Run the Minting Website
```bash
cd deployment
python3 -m http.server 8080
# Open http://localhost:8080/direct_mint.html
```

### 5. Alternative: Command Line Minting
```bash
cd deployment
node scripts/mint_nft.js
```

## 📋 Contract Details

- **Name**: ParrOdessa42
- **Symbol**: POD42
- **Standard**: ERC-721
- **Network**: Ethereum Sepolia Testnet
- **Max Supply**: 42 NFTs
- **Artist**: tlukanie
- **Contract Address**: `0x3eFe95995C9a05D750A8e60371c5e426EA28637A`
- **Mint Price**: 0.01 ETH (for public minting)
- **Owner Minting**: Free (only contract owner)

## 🔗 Links

- **Contract**: [Etherscan Sepolia](https://sepolia.etherscan.io/address/0x3eFe95995C9a05D750A8e60371c5e426EA28637A)
- **Metadata**: [IPFS](https://ipfs.io/ipfs/bafkreieg4lxxqed34oda2kixk4estsx5cspeuhezjr64kswxt6p3xnoqyy)
- **Image**: [IPFS](https://ipfs.io/ipfs/bafybeiglvaqgqwhojustotdalr6v4jxkli4agdtxr5nlsa2u45dikxfxqi)

## 📊 Features

### Smart Contract Features
- ✅ ERC-721 compliant NFT contract
- ✅ Owner-only minting (`mintNFT`) - Free for contract owner
- ✅ Public minting with payment (`publicMint`) - 0.01 ETH per NFT
- ✅ Supply limit enforcement (42 NFTs)
- ✅ Reentrancy attack protection
- ✅ Price management and withdrawal functions
- ✅ Burn functionality for token owners
- ✅ Automatic ETH collection and owner withdrawal

### Web Interface Features
- ✅ Complete web-based minting interface
- ✅ MetaMask integration and wallet connection
- ✅ Real-time supply tracking and display
- ✅ Owner address tracking and display
- ✅ Metadata visualization with IPFS links
- ✅ Automatic network detection and switching
- ✅ Transaction status monitoring
- ✅ Responsive design and modern UI
- ✅ **Public minting with ETH payment**
- ✅ **Real-time mint price display**
- ✅ **Payment validation and error handling**
- ✅ **Automatic ETH payment processing**

### Development Features
- ✅ Hardhat development framework
- ✅ Command-line minting scripts
- ✅ Environment-based configuration
- ✅ Contract verification on Etherscan
- ✅ Comprehensive error handling

## 🛠️ Technical Stack

### Blockchain & Smart Contracts
- **Smart Contract**: Solidity ^0.8.19
- **Framework**: Hardhat ^2.17.1
- **Libraries**: OpenZeppelin Contracts ^4.9.3
- **Network**: Ethereum Sepolia Testnet
- **Standard**: ERC-721 (NFT)

### Frontend & Web3
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **Web3 Library**: ethers.js ^6.15.0
- **Wallet Integration**: MetaMask
- **Storage**: IPFS (InterPlanetary File System)

### Development Tools
- **Package Manager**: npm
- **Testing**: Hardhat testing framework
- **Deployment**: Hardhat deployment scripts
- **Verification**: Etherscan API integration
- **Version Control**: Git

## 💰 Payment & Withdrawal System

### How Public Minting Works
- **Mint Price**: 0.01 ETH per NFT (configurable by contract owner)
- **Payment Method**: ETH sent directly to smart contract
- **Automatic Processing**: Payment is validated and processed automatically
- **Supply Limit**: Maximum 42 NFTs can be minted

### Where ETH Goes
1. **Payment Collection**: ETH is sent to the smart contract address
2. **Contract Balance**: All payments accumulate in the contract
3. **Owner Withdrawal**: Only contract owner can withdraw using `withdraw()` function
4. **Withdrawal Process**: All accumulated ETH is sent to owner's wallet

### For Contract Owner
- **Check Balance**: View contract ETH balance on [Etherscan](https://sepolia.etherscan.io/address/0x3eFe95995C9a05D750A8e60371c5e426EA28637A)
- **Withdraw Funds**: Call `withdraw()` function to collect all payments
- **Price Management**: Use `setMintPrice()` to change minting price
- **Minting Control**: Use `setMintingEnabled()` to enable/disable public minting

## 🌐 Getting Started with Sepolia Testnet

### Prerequisites
1. **MetaMask Wallet**: Install [MetaMask](https://metamask.io/) browser extension
2. **Sepolia ETH**: Get test ETH from [Sepolia Faucet](https://sepoliafaucet.com/) (need at least 0.01 ETH for minting)
3. **Node.js**: Install Node.js (v16 or higher)

### Adding Sepolia Network to MetaMask
The website will automatically prompt you to add Sepolia network, or you can add it manually:
- **Network Name**: Sepolia
- **RPC URL**: `https://sepolia.drpc.org`
- **Chain ID**: `11155111`
- **Currency Symbol**: `ETH`
- **Block Explorer**: `https://sepolia.etherscan.io`

## 📖 Documentation

For detailed technical documentation, project structure explanation, and implementation details, see:
- **[Detailed Documentation](./deployment/README.md)** - Comprehensive technical guide
- **[Contract Documentation](./deployment/contracts/ParrOdessa42.sol)** - Smart contract source code
- **[Deployment Guide](./deployment/README.md)** - Step-by-step deployment instructions

## 👨‍🎨 Artist

**tlukanie** - Creator of ParrOdessa42 NFT collection

## 📝 License

MIT License
