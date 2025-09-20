# ParrOdessa42 NFT Project

## 🎨 Project Overview

**ParrOdessa42** is an ERC-721 NFT collection featuring the number 42, created by artist **tlukanie**. This project demonstrates a complete NFT development workflow from smart contract creation to web interface deployment.

## 📁 Project Structure

```
nft_42/
├── code/                    # Smart contract source code
│   └── ParrOdessa42.sol    # ERC-721 NFT contract
├── deployment/              # Hardhat deployment environment
│   ├── scripts/
│   │   └── deploy.js       # Contract deployment script
│   ├── hardhat.config.js   # Hardhat configuration
│   ├── package.json        # Dependencies
│   └── env_example.txt     # Environment variables template
├── documentation/           # Project documentation
│   └── README.md           # This file
└── mint/                   # Minting interfaces and scripts
    ├── direct_mint.html    # Web interface for minting
    └── mint_nft.js         # Command-line minting script
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
npm run deploy
```

### 4. Mint NFTs
**Option A: Web Interface**
```bash
cd mint
python3 -m http.server 8000
# Open http://localhost:8000/direct_mint.html
```

**Option B: Command Line**
```bash
cd mint
node mint_nft.js
```

## 📋 Contract Details

- **Name**: ParrOdessa42
- **Symbol**: PARR42
- **Standard**: ERC-721
- **Network**: Ethereum Sepolia
- **Max Supply**: 42 NFTs
- **Artist**: tlukanie

## 🔗 Contract Address

**Sepolia**: `0x3eFe95995C9a05D750A8e60371c5e426EA28637A`

## 📊 Features

- ✅ ERC-721 compliant
- ✅ IPFS metadata storage
- ✅ Owner-only minting
- ✅ Supply limit (42 NFTs)
- ✅ Reentrancy protection
- ✅ Web interface
- ✅ Real-time supply tracking
- ✅ Owner address display

## 🛠️ Technical Stack

- **Smart Contract**: Solidity ^0.8.19
- **Framework**: Hardhat
- **Libraries**: OpenZeppelin
- **Storage**: IPFS
- **Frontend**: HTML/CSS/JavaScript
- **Web3**: ethers.js

## 📝 License

MIT License