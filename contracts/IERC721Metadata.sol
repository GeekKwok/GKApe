// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IERC721Metadata
 * @author Geek Kwok
 * @notice Interface for the ERC721Metadata standard, see details at https://eips.ethereum.org/EIPS/eip-721[EIP-721].
 * 
 * 721标准定义了NFT的元数据接口，包括名称、符号和tokenURI。
 */
interface IERC721Metadata {
    /**
     * @dev Returns the name of the token.
     */
    function name() external view returns (string memory);

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() external view returns (string memory);

    /**
     * @dev Returns the URI for a given token ID. May return an empty string.
     *
     * If `tokenId` token does not exist, return an empty string.
     *
     * If `tokenId` token exists and metadata is defined, return the metadata URI.
     */
    function tokenURI(uint256 tokenId) external view returns (string memory);
}