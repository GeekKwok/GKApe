// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { ERC721 } from "./ERC721.sol";

contract GKApe is ERC721 {
    // 总量
    uint256 public MAX_GKAPES = 10000;
    // 构造函数
    constructor(string memory name_, string memory symbol_) ERC721(name_, symbol_) {

    }
    // BAYC的baseURI为ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/
    function _baseURI() internal pure override returns (string memory) {
        return "ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/";
    }
    // 铸造函数
    function mint(address to, uint256 tokenId) external {
        require(tokenId >= 0 && tokenId < MAX_GKAPES, "tokenId out of range");
        require(to != address(0), "mint to the zero address");
        
        _mint(to, tokenId);
    }
}