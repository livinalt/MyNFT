// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
// import '@openzeppelin/contracts/access/Ownable.sol';


contract MyNFT is ERC721 {
    uint256 mintPrice = 0.05 ether;
    uint256 totalSupply;
    uint256 maxSupply = 1000;
    bool isMintEnabled = true;

    mapping(address => uint256) mintedWallet;

    constructor() payable ERC721("Miva", "MVN") {}

    function mint() public payable {
        require(totalSupply < maxSupply, "Max supply reached");
        require(msg.value >= mintPrice, "Insufficient ether sent");

        mintedWallet[msg.sender]++;
        totalSupply++;
        uint256 tokenId = totalSupply;
        _safeMint(msg.sender, tokenId);
    }

    function setMintPrice(uint256 _price) external {
        mintPrice = _price;
    }

    function toggleMinting() external {
        isMintEnabled = !isMintEnabled;
    }

   
}
