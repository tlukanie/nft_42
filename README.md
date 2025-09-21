# ParrOdessa42 NFT Project

## Project Overview

**ParrOdessa42** is a complete ERC-721 NFT collection featuring the number 42, created by artist **tlukanie**. This project demonstrates a full NFT development workflow from smart contract creation to web interface deployment.

## 📁 Project Structure

```
nft_42/
├── code/                    # Smart contract source code
│   ├── ParrOdessa42.sol    # ERC-721 NFT contract
│   └── README.md           # Contract documentation
├── deployment/              # Hardhat deployment environment
│   ├── scripts/
│   │   └── deploy.js       # Contract deployment script
│   ├── hardhat.config.js   # Hardhat configuration
│   ├── package.json        # Dependencies
│   ├── env_example.txt     # Environment variables template
│   └── README.md           # Deployment documentation
├── documentation/           # Project documentation
│   └── README.md           # Main project documentation
├── mint/                   # Minting interfaces and scripts
│   ├── direct_mint.html    # Web interface for minting
│   ├── mint_nft.js         # Command-line minting script
│   └── README.md           # Minting documentation
└── README.md               # This file
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
- **Contract Address**: `0x3eFe95995C9a05D750A8e60371c5e426EA28637A`

## 🔗 Links

- **Contract**: [Etherscan](https://sepolia.etherscan.io/address/0x3eFe95995C9a05D750A8e60371c5e426EA28637A)
- **Metadata**: [IPFS](https://ipfs.io/ipfs/bafkreieg4lxxqed34oda2kixk4estsx5cspeuhezjr64kswxt6p3xnoqyy)
- **Image**: [IPFS](https://ipfs.io/ipfs/bafybeiglvaqgqwhojustotdalr6v4jxkli4agdtxr5nlsa2u45dikxfxqi)

## 📊 Features

- ✅ ERC-721 compliant smart contract
- ✅ IPFS metadata and image storage
- ✅ Owner-only minting controls
- ✅ Supply limit enforcement (42 NFTs)
- ✅ Reentrancy attack protection
- ✅ Complete web interface
- ✅ Real-time supply tracking
- ✅ Owner address display
- ✅ Metadata visualization
- ✅ Automatic network switching

## 🛠️ Technical Stack

- **Smart Contract**: Solidity ^0.8.19
- **Framework**: Hardhat
- **Libraries**: OpenZeppelin
- **Storage**: IPFS
- **Frontend**: HTML/CSS/JavaScript
- **Web3**: ethers.js
- **Network**: Ethereum Sepolia

## 📝 License

MIT License

## 👨‍🎨 Artist

**tlukanie** - Creator of ParrOdessa42 NFT collection
