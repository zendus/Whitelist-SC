//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

contract Whitelist {

    uint8 public maxWhitelistedAddresses;
    uint8 public numAddressesWhitelisted;

    mapping(address => bool) public whitelistedAddresses;

    constructor (uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses = _maxWhitelistedAddresses;
    }

    function addAddressToWhitelist() public {
        require(!whitelistedAddresses[msg.sender], "Sender has already been white listed");
        require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses can't be added, limit reached");
        whitelistedAddresses[msg.sender] = true;
        numAddressesWhitelisted += 1;
    }
}