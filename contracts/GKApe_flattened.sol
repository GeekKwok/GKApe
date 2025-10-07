
// File: contracts/IERC165.sol


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
// File: contracts/IERC721.sol


pragma solidity ^0.8.0;


/**
 * @title IERC721
 * @author Geek Kwok
 * @notice Interface for the ERC721 standard, see details at https://eips.ethereum.org/EIPS/eip-721[EIP-721].
 * 
 * 721标准定义了NFT的接口，包括所有权、转移、批准等操作。
 */
interface IERC721 is IERC165 {
    event Transfer(address indexed from, address indexed to, uint256 indexed tokenId);
    event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId);
    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function balanceOf(address owner) external view returns (uint256 balance);

    function ownerOf(uint256 tokenId) external view returns (address owner);

    /**
     * @dev Safely transfers `tokenId` token from `from` to `to`, checking first that contract recipients
     * are aware of the ERC721 protocol to prevent tokens from being forever locked.
     *
     * `data` is additional data, it has no specified format and it is sent in call to `to`.
     *
     * This internal function is equivalent to {safeTransferFrom}, and can be used to e.g.
     * implement alternative mecanisms of the ERC721 protocol.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes calldata data) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * Emits a {Transfer} event.
     */
    function safeTransferFrom(address from, address to, uint256 tokenId) external;

    /**
     * @dev Transfers `tokenId` token from `from` to `to`.
     *
     * Emits a {Transfer} event.
     */
    function transferFrom(address from, address to, uint256 tokenId) external;

    function approve(address to, uint256 tokenId) external;

    function setApprovalForAll(address operator, bool approved) external;

    function getApproved(uint256 tokenId) external view returns (address operator);

    function isApprovedForAll(address owner, address operator) external view returns (bool);
}
// File: contracts/IERC721Metadata.sol


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
// File: contracts/IERC721Receiver.sol


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
// File: contracts/Strings.sol


// OpenZeppelin Contracts (last updated v4.7.0) (utils/Strings.sol)
pragma solidity ^0.8.0;

/**
 * @dev String operations.
 */
library Strings {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";
    uint8 private constant _ADDRESS_LENGTH = 20;

    /**
     * @dev Converts a `uint256` to its ASCII `string` decimal representation.
     */
    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT license
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol
        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation.
     */
    function toHexString(uint256 value) internal pure returns (string memory) {
        if (value == 0) {
            return "0x00";
        }
        uint256 temp = value;
        uint256 length = 0;
        while (temp != 0) {
            length++;
            temp >>= 8;
        }
        return toHexString(value, length);
    }

    /**
     * @dev Converts a `uint256` to its ASCII `string` hexadecimal representation with fixed length.
     */
    function toHexString(uint256 value, uint256 length) internal pure returns (string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i) {
            buffer[i] = _HEX_SYMBOLS[value & 0xf];
            value >>= 4;
        }
        require(value == 0, "Strings: hex length insufficient");
        return string(buffer);
    }

    /**
     * @dev Converts an `address` with fixed length of 20 bytes to its not checksummed ASCII `string` hexadecimal representation.
     */
    function toHexString(address addr) internal pure returns (string memory) {
        return toHexString(uint256(uint160(addr)), _ADDRESS_LENGTH);
    }
}
// File: contracts/ERC721.sol


pragma solidity ^0.8.0;






contract ERC721 is IERC721, IERC721Metadata {
    // 使用 Strings 库
    using Strings for uint256;

    // Token name
    string public override name;
    // Token symbol
    string public override symbol;
    // tokenID 到 owner address 的持有人映射
    mapping (uint256 => address) private _owners;
    // address 到 持仓数量 的持仓量映射
    mapping (address => uint256) private _balances;
    // tokenID 到 授权地址 的授权映射
    mapping (uint256 => address) private _tokenApprovals;
    // owner address 到 operator address 的批量授权映射
    mapping (address => mapping (address => bool)) private _operatorApprovals;

    // 错误：无效的接收者
    error ERC721InvalidReceiver(address receiver);

    // 构造函数：初始化`name`和`symbol`
    constructor(string memory name_, string memory symbol_) {
        name = name_;
        symbol = symbol_;
    }

    // 实现IERC165接口supportsInterface
    function supportsInterface(bytes4 interfaceId) external pure override returns (bool) {
        return interfaceId == type(IERC721).interfaceId || interfaceId == type(IERC721Metadata).interfaceId || interfaceId == type(IERC165).interfaceId;
    }

    // 实现IERC721的balanceOf，利用_balances变量查询owner地址的balance
    function balanceOf(address owner) external view override returns (uint256) {
        require(owner != address(0), "owner = zero address");
        return _balances[owner];
    }

    // 实现IERC721的ownerOf，利用_owners变量查询tokenID的owner
    function ownerOf(uint256 tokenId) public view override returns (address owner) {
        owner = _owners[tokenId];
        require(owner != address(0), "token does not exist");
    }

    // 实现IERC721的isApprovedForAll，利用_operatorApprovals变量查询owner地址是否将所持NFT批量授权给了operator地址
    function isApprovedForAll(address owner, address operator) external view override returns (bool) {
        return _operatorApprovals[owner][operator];
    }

    // 实现IERC721的setApprovalForAll，将持有代币全部授权给operator地址
    function setApprovalForAll(address operator, bool approved) external override {
        _operatorApprovals[msg.sender][operator] = approved;
        emit ApprovalForAll(msg.sender, operator, approved);
    }

    // 实现IERC721的getApproved，利用_tokenApprovals变量查询tokenID的授权地址
    function getApproved(uint256 tokenId) external view override returns (address) {
        require(_owners[tokenId] != address(0), "token does not exist");
        return _tokenApprovals[tokenId];
    }

    // 授权函数：通过调整_tokenApprovals变量来授权to地址操作tokenId同时释放Approval事件
    function _approve(address owner, address to, uint256 tokenId) private {
        _tokenApprovals[tokenId] = to;
        emit Approval(owner, to, tokenId);
    }

    // 实现IERC721的approve，将tokenID授权给to地址，条件：to不是owner且msg.sender是owner或授权地址。调用_approve函数。
    function approve(address to, uint256 tokenId) external override {
        address owner = _owners[tokenId];
        require(msg.sender == owner || _operatorApprovals[owner][msg.sender], "not owner nor approved for all");
        _approve(owner, to, tokenId);
    }

    // 查询spender地址是否可以使用tokenId（需要时owner或被授权地址）
    function _isApprovedOrOwner(address owner, address spender, uint256 tokenId) private view returns (bool) {
        return (spender == owner || _tokenApprovals[tokenId] == spender || _operatorApprovals[owner][spender]);
    }

    /**
     * 转账函数：通过调整_balances和_owners变量将tokenID从from转账给to同时释放Transfer事件.
     * 
     * 条件：
     * - from不能是zero address
     * - to不能是zero address
     * - from必须有tokenID
     * - from必须有足够的余额
     * - spender必须是被授权地址或owner
     * - tokenID必须存在
     */
    function _transfer(address owner, address from, address to, uint256 tokenId) private {
        require(from == owner, "not owner");
        require(to != address(0), "transfer to the zero address");

        _approve(owner, address(0), tokenId);

        _balances[from] -= 1;
        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(from, to, tokenId);
    }

    // 实现IERC721的transferFrom，非安全转账，不建议使用。调用_transfer函数。
    function transferFrom(address from, address to, uint256 tokenId) external override {
        address owner = ownerOf(tokenId);
        require(_isApprovedOrOwner(owner, msg.sender, tokenId), "not owner nor approved");
        _transfer(owner, from, to, tokenId);
    }

    // _checkOnERC721Received函数：用于在to为合约的时候调用IERC721Receiver.onERC721Received以防止tokenId被不小心转入黑洞
    function _checkOnERC721Received(address from, address to, uint256 tokenId, bytes memory data) private {
        if (to.code.length > 0) {
            try IERC721Receiver(to).onERC721Received(msg.sender, from, tokenId, data) returns (bytes4 retval) {
                if (retval != IERC721Receiver.onERC721Received.selector) {
                    revert ERC721InvalidReceiver(to);
                }
            } catch (bytes memory reason) {
                if (reason.length == 0) {
                    revert ERC721InvalidReceiver(to);
                } else {
                    // @solidity memory-safe-assembly
                    assembly {
                        revert(add(32, reason), mload(reason))
                    }
                }
            }
        }
    }

    /**
     * 安全转账函数：安全地将tokenID从from转移到to，会检查合约接收者是否了解ERC721协议，以防止代币被永久锁定。调用_transfer函数和_checkOnERC721Received函数。
     * 
     * 条件：
     * - from不能是zero address
     * - to不能是zero address
     * - from必须有tokenID
     * - from必须有足够的余额
     * - spender必须是被授权地址或owner
     * - tokenID必须存在
     */
    function _safeTransfer(address owner, address from, address to, uint256 tokenId, bytes memory _data) private {
        _transfer(owner, from, to, tokenId);
        _checkOnERC721Received(from, to, tokenId, _data);
    }

    // 实现IERC721的safeTransferFrom，安全转账，调用了_safeTransfer函数
    function safeTransferFrom(address from, address to, uint256 tokenId, bytes memory _data) public override {
        address owner = ownerOf(tokenId);
        require(_isApprovedOrOwner(owner, msg.sender, tokenId), "not owner nor approved");
        _safeTransfer(owner, from, to, tokenId, _data);
    }

    // 重载函数：safeTransferFrom(address from, address to, uint256 tokenId)
    function safeTransferFrom(address from, address to, uint256 tokenId) external override {
        safeTransferFrom(from, to, tokenId, "");
    }

    /**
     * 铸造函数：通过调整_balances和_owners变量来铸造tokenID并转账给to同时释放Transfer事件。
     * 这个mint函数所有人都能调用，实际使用需要开发人员重写，加上一些条件。
     * 
     * 条件：
     * - to不能是zero address
     * - tokenID不能存在
     * - tokenID必须大于当前最大tokenID
     * - to必须有足够的余额
     * - to必须有足够的授权
     * - to必须有足够的授权
     */
    function _mint(address to, uint256 tokenId) internal virtual {
        require(to != address(0), "mint to the zero address");
        require(_owners[tokenId] == address(0), "token already minted");

        _balances[to] += 1;
        _owners[tokenId] = to;

        emit Transfer(address(0), to, tokenId);
    }

    /**
     * 销毁函数：通过调整_balances和_owners变量来销毁tokenID同时释放Transfer事件。
     * 
     * 条件：
     * - owner不能是zero address
     * - tokenID必须存在
     * - owner必须有tokenID
     * - owner必须有足够的余额
     * - owner必须有足够的授权
     * - owner必须有足够的授权
     */
    function _burn(uint256 tokenId) internal virtual {
        address owner = ownerOf(tokenId);
        require(msg.sender == owner, "not owner of token");

        _approve(owner, address(0), tokenId);

        _balances[owner] -= 1;
        delete _owners[tokenId];

        emit Transfer(owner, address(0), tokenId);
    }

    /**
     * 计算{tokenURI}的BaseURI，tokenURI就是把baseURI和tokenId拼接在一起，需要开发重写。
     * BAYC的baseURI为ipfs://QmeSjSinHpPnmXmspMjwiXyN6zS4E9zccariGR3jxcaWtq/ 
     */
    function _baseURI() internal view virtual returns (string memory) {
        return "";
    }

    // 实现IERC721Metadata的tokenURI函数，查询metadata。
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_owners[tokenId] != address(0), "token not exist");

        string memory baseURI = _baseURI();
        return bytes(baseURI).length > 0 ? string(abi.encodePacked(baseURI, tokenId.toString())) : "";
    }
}
// File: contracts/GKApe.sol


pragma solidity ^0.8.0;


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