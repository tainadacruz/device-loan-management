// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

 import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
 import "@openzeppelin/contracts/access/Ownable.sol";
 import "@openzeppelin/contracts/utils/Counters.sol";

contract DeviceManager is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdsCounter;

     // Mapping from token ID to owner address
    mapping(uint256 => address) private _owners;

    mapping(uint256 => address) private _currentWith;

    // Mapping owner address to token count
    mapping(address => uint256) private _balances;

    // Mapping from token ID to approved address
    mapping(uint256 => address) private _tokenApprovals;

    function _transfer(
        address from,
        address to,
        uint256 tokenId
    ) internal virtual override (ERC721) {
        require(to != address(0), "ERC721: transfer to the zero address");

        _beforeTokenTransfer(from, to, tokenId);

        // Clear approvals from the previous owner
        delete _tokenApprovals[tokenId];

        _balances[from] -= 1;
        _balances[to] += 1;
        _currentWith[tokenId] = to;

        emit Transfer(from, to, tokenId);

        _afterTokenTransfer(from, to, tokenId);
    }


    constructor() ERC721("DeviceManager", "DVM") {}


    // insert new device
    function insertDevice(string memory tokenURI)
        public onlyOwner
        returns (uint256)
    {
        _tokenIdsCounter.increment();
        uint256 newItemId = _tokenIdsCounter.current();

        _safeMint(msg.sender, newItemId);
        _setTokenURI(newItemId, tokenURI);
        return newItemId;
    }

    // burn device
    function burnDevice(uint256 tokenId) public onlyOwner {
        _burn(tokenId);
    }

    function requireDevice(
        address from,
        address to,
        uint256 tokenId
    ) public virtual {
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721: caller is not token owner nor approved");
        _transfer(from, to, tokenId);

    }
    
}