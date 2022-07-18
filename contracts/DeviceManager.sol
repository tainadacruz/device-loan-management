// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import "@openzeppelin/contracts/access/AccessControl.sol";


contract DeviceManager is ERC20, AccessControl {

    constructor() ERC20("DeviceManager", "DVM") {}
    
    enum DeviceType {
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

    enum UserType {
        ADMIN,
        STANDARD
    }

   struct Devices { 
      uint deviceId;          // Serial Number?
      uint dateStart;       // Date of start
      uint dateEnd;         // Date of end
      string owner;           // Devices's owner
      string currentWith;     // Current employee
      Devices typeDevice;     // Computer / Mouse / Keyboard...
      ReturnType typeLoan;    // If it has a date of return or not
   }

   struct User {
      uint userId;
      string name;
      UserType userType;
    
   }

   Devices device;

    //SETTER GETTERS
   function setDevice() public {
      device = Device(1, '01/01/2022', '', 'Hash_owner', 'Hash_employee', DeviceType.COMPUTER, ReturnType.INDETERMINATE);
    }
   function getDeviceId() public view returns (uint) {
      return device.deviceId;
   }


   //REQUEST DEVICE

   //RETURN DEVICE

}

