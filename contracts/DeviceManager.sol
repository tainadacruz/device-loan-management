// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

 import "./ERC721.sol";
 import "@openzeppelin/contracts/access/Ownable.sol";
 import "@openzeppelin/contracts/utils/Counters.sol";

contract DeviceManager is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdsCounter;

    enum DeviceType {
        COMPUTER,
        NOTEBOOK,
        MONITOR,
        WEBCAM,
        MOUSE,
        KEYBOARD,
        HEADFONE
    }

    enum UserType {
        ADMIN,
        STANDARD
    }

    struct Devices { 
      uint deviceId;        
      string description;
      address owner;         
      address currentWith;     
      DeviceType typeDevice;    
    }

    struct User {
      address addrs;
      UserType userType;
   }

    function setCurrentWith(uint tokenId, address newCurrentWith) internal {
        Devices memory deviceobj;
        deviceobj.currentWith = newCurrentWith;
        myDevices[tokenId].push(deviceobj);
    }

    mapping(uint256 => DeviceType) internal types;
    mapping(uint256 => Devices[]) internal myDevices;

    Devices device;
    
    constructor() ERC721("DeviceManager", "DVM") {}

    // insert new device
    function insertDevice(uint256 typesNum, string memory description)
        public onlyOwner
        returns (uint256)
    {
        _tokenIdsCounter.increment();
        uint256 newItemId = _tokenIdsCounter.current();

        device = Devices(newItemId, description, address(this), address(this), types[typesNum]);
        myDevices[newItemId].push(device);

        _safeMint(msg.sender, newItemId);
        return device.deviceId;
    }

    // burn device
    function burnDevice(uint256 tokenId) public onlyOwner {
        delete myDevices[tokenId];
        _burn(tokenId);
    }

    // return or require the device
    function transferDevice(
        address from,
        address to,
        uint256 tokenId
    ) external payable {
        // require(to != address(this));
        // require(from == address(this));
        require(to != address(0), "ERC721: transfer to the zero address");

        _beforeTokenTransfer(from, to, tokenId);

        setCurrentWith(tokenId, address(to));

        if (to == _owners[tokenId]) {
            _owners[tokenId] = to;
        } else {
            _owners[tokenId] = from;
        }

        _balances[from] -= 1;
        _balances[to] += 1;

        emit Transfer(from, to, tokenId);

        _afterTokenTransfer(from, to, tokenId);

    }

}