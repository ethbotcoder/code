// SPDX-License-Identifier: MIT
pragma solidity > 0.5.0;


abstract contract I1inchRouter {

    function getAmountMin(address _tokenIn, address _tokenOut, uint256 amount) virtual public view returns (uint256);
    function getAmountsOut(address sd, uint256 dd, address[] memory d) public view returns (uint256[] memory){

    }
}