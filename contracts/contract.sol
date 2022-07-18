// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
// import "@openzeppelin/contracts/access/AccessControl.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";


contract DeviceManager is ERC721, ERC721Burnable, AccessControl {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIdCounter;

    bytes32 public constant MINTER_ROLE = sha256("MINTER_ROLE");

    constructor() ERC721("DeviceManager", "DCM") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function safeMint(address to) public onlyRole(MINTER_ROLE) {
        uint256 tokenId = _tokenIdCounter.current();
        _tokenIdCounter.increment();
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.
    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, AccessControl)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }

    enum Devices {
        COMPUTER,
        NOTEBOOK,
        MONITOR,
        WEBCAM,
        MOUSE,
        KEYBOARD,
        HEADFONE
    }

    enum ReturnType {
        DETERMINATE,
        INDETERMINATE
    }

   struct Device { 
      uint deviceId;          // Serial Number?
      string dateStart;       // Date of start
      string dateEnd;         // Date of end
      string owner;           // Devices's owner
      string currentWith;     // Current employee
      Devices typeDevice;     // Computer / Mouse / Keyboard...
      ReturnType typeLoan;    // If it has a date of return or not
   }

   Device device;

   function setDevice() public {
      device = Device(1, '01/01/2022', '', 'Hash_owner', 'Hash_employee', Devices.COMPUTER, ReturnType.INDETERMINATE);
    }
   function getDeviceId() public view returns (uint) {
      return device.deviceId;
   }
}

