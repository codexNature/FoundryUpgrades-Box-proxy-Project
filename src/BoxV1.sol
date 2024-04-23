//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {UUPSUpgradeable} from "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import {Initializable} from "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";


//storage is stored in the proxy not the Implementation.
//proxy (borrowing functions) -> implementation
//Proxy do not have constructor they use te initializer instead. 

contract BoxV1 is Initializable, UUPSUpgradeable, OwnableUpgradeable{
    uint256 internal number;

    constructor() {
      _disableInitializers();
    }

    function initialize() public initializer{
      __Ownable_init(msg.sender); //sets owner to: Owner = msg.sender
      __UUPSUpgradeable_init();
    } //the initializer function is more or less a constructor for the proxy. 

    function getNumber() external view returns (uint256) {
        return number;
    }

    function version() external pure returns (uint256) {
        return 1;
    }

    function _authorizeUpgrade(address newImplementation) internal override {}
}

