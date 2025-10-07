// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IERC721Receiver
 * @author Geek Kwok
 * @notice Interface for the ERC721Receiver standard, see details at https://eips.ethereum.org/EIPS/eip-721[EIP-721].
 * 
 * 721标准定义了NFT的接收者接口，用于接收NFT，合约必须实现这个接口来通过安全转账接收ERC721。
 */
interface IERC721Receiver {
    /**
     * @dev Whenever an {IERC721} `tokenId` token is transferred to this contract via {IERC721-safeTransferFrom}
     * by `operator` from `from`, this function is called.
     *
     * It must return a value indicating whether the operation succeeded or not.
     *
     * IMPORTANT: The `operator` cannot be the zero address.
     */
    function onERC721Received(address operator, address from, uint256 tokenId, bytes calldata data) external returns (bytes4);
}