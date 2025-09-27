// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

/**
 * @title ParrOdessa42
 * @dev ERC-721 compliant NFT contract for the number 42
 * @author tlukanie
 * @notice This contract creates NFTs representing the number 42
 */
 
contract ParrOdessa42 is ERC721, ERC721URIStorage, Ownable, ReentrancyGuard {
    using Counters for Counters.Counter;
    
    Counters.Counter private _tokenIdCounter;
    
    // Maximum supply of 42 NFTs (keeping it thematic)
    uint256 public constant MAX_SUPPLY = 42;
    
    // Base URI for metadata
    string private _baseTokenURI;
    
    // Minting price (in wei)
    uint256 public mintPrice = 0.01 ether;
    
    // Minting enabled flag
    bool public mintingEnabled = true;
    
    // Events
    event NFTMinted(address indexed to, uint256 indexed tokenId, string tokenURI);
    event BaseURIUpdated(string newBaseURI);
    event MintPriceUpdated(uint256 newPrice);
    event MintingToggled(bool enabled);
    
    /**
     * @dev Constructor
     * @param name Token name
     * @param symbol Token symbol
     * @param baseURI Base URI for metadata
     */
    constructor(
        string memory name,
        string memory symbol,
        string memory baseURI
    ) ERC721(name, symbol) {
        _baseTokenURI = baseURI;
    }
    
    /**
     * @dev Mint a new NFT (only owner can mint)
     * @param to Address to mint the NFT to
     * @param uri URI for the token metadata
     */
    function mintNFT(address to, string memory uri) 
        public 
        onlyOwner 
        nonReentrant 
    {
        require(mintingEnabled, "Minting is currently disabled");
        require(_tokenIdCounter.current() < MAX_SUPPLY, "Maximum supply reached");
        require(to != address(0), "Cannot mint to zero address");
        require(bytes(uri).length > 0, "Token URI cannot be empty");
        
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        
        _safeMint(to, tokenId);
        _setTokenURI(tokenId, uri);
        
        emit NFTMinted(to, tokenId, uri);
    }
    
    /**
     * @dev Public minting function (anyone can mint by paying the price)
     * @param uri URI for the token metadata
     */
    function publicMint(string memory uri) 
        public 
        payable 
        nonReentrant 
    {
        require(mintingEnabled, "Minting is currently disabled");
        require(_tokenIdCounter.current() < MAX_SUPPLY, "Maximum supply reached");
        require(msg.value >= mintPrice, "Insufficient payment");
        require(bytes(uri).length > 0, "Token URI cannot be empty");
        
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, uri);
        
        emit NFTMinted(msg.sender, tokenId, uri);
    }
    
    /**
     * @dev Get the owner of a specific token
     * @param tokenId The token ID to query
     * @return The address of the token owner
     */
    function ownerOf(uint256 tokenId) public view override(ERC721, IERC721) returns (address) {
        return super.ownerOf(tokenId);
    }
    
    /**
     * @dev Check if an address owns any NFT from this collection
     * @param owner Address to check
     * @return Number of NFTs owned by the address
     */
    function balanceOf(address owner) public view override(ERC721, IERC721) returns (uint256) {
        return super.balanceOf(owner);
    }
    
    /**
     * @dev Get all tokens owned by an address
     * @param owner Address to query
     * @return Array of token IDs owned by the address
     */
    function tokensOfOwner(address owner) public view returns (uint256[] memory) {
        uint256 tokenCount = balanceOf(owner);
        uint256[] memory tokens = new uint256[](tokenCount);
        
        uint256 index = 0;
        for (uint256 i = 0; i < _tokenIdCounter.current(); i++) {
            if (ownerOf(i) == owner) {
                tokens[index] = i;
                index++;
            }
        }
        
        return tokens;
    }
    
    /**
     * @dev Get the current token ID counter
     * @return Current token ID
     */
    function getCurrentTokenId() public view returns (uint256) {
        return _tokenIdCounter.current();
    }
    
    /**
     * @dev Get the total supply
     * @return Total number of minted tokens
     */
    function totalSupply() public view returns (uint256) {
        return _tokenIdCounter.current();
    }
    
    /**
     * @dev Update the base URI (only owner)
     * @param newBaseURI New base URI
     */
    function setBaseURI(string memory newBaseURI) public onlyOwner {
        _baseTokenURI = newBaseURI;
        emit BaseURIUpdated(newBaseURI);
    }
    
    /**
     * @dev Get the base URI
     * @return Base URI string
     */
    function _baseURI() internal view override returns (string memory) {
        return _baseTokenURI;
    }
    
    /**
     * @dev Override tokenURI to use custom URI storage
     * @param tokenId Token ID
     * @return Token URI
     */
    function tokenURI(uint256 tokenId) 
        public 
        view 
        override(ERC721, ERC721URIStorage) 
        returns (string memory) 
    {
        return super.tokenURI(tokenId);
    }
    
    /**
     * @dev Override _burn to handle URI storage
     * @param tokenId Token ID to burn
     */
    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    /**
     * @dev Override supportsInterface for multiple inheritance
     * @param interfaceId Interface ID to check
     * @return Whether the interface is supported
     */
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
    
    /**
     * @dev Set minting price (only owner)
     * @param newPrice New minting price in wei
     */
    function setMintPrice(uint256 newPrice) public onlyOwner {
        mintPrice = newPrice;
        emit MintPriceUpdated(newPrice);
    }
    
    /**
     * @dev Toggle minting enabled/disabled (only owner)
     * @param enabled Whether minting should be enabled
     */
    function setMintingEnabled(bool enabled) public onlyOwner {
        mintingEnabled = enabled;
        emit MintingToggled(enabled);
    }
    
    /**
     * @dev Burn a token (only token owner or approved)
     * @param tokenId Token ID to burn
     */
    function burn(uint256 tokenId) public {
        require(
            _isApprovedOrOwner(_msgSender(), tokenId),
            "ERC721: caller is not token owner or approved"
        );
        _burn(tokenId);
    }
    
    /**
     * @dev Withdraw contract balance (only owner)
     */
    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        
        (bool success, ) = payable(owner()).call{value: balance}("");
        require(success, "Withdrawal failed");
    }
    
    /**
     * @dev Receive function to accept ETH
     */
    receive() external payable {}
}
