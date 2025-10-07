// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/**
 * @title IERC165
 * @author Geek Kwok
 * @notice Interface for the ERC165 standard, see details at https://eips.ethereum.org/EIPS/eip-165[EIP-165].
 * 
 * 合约可以声明支持的接口，供其他合约检查。
 */
interface IERC165 {
    /**
     * @dev Returns true if this contract implements the interface defined by `interfaceId`. See the corresponding
     * https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section]
     * to learn more about how these ids are created.
     *
     * This function call must use less than 30 000 gas.
     * 
     * @param interfaceId The interface identifier, as specified in ERC-165.
     * @return bool True if the interface is supported, false otherwise.
     */
    function supportsInterface(bytes4 interfaceId) external view returns (bool);
}