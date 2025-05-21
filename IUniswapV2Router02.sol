// SPDX-License-Identifier: MIT
pragma solidity > 0.5.0;
pragma experimental ABIEncoderV2;

contract IUniswapV2Router02 {

  event StringsLogged(address[]);
  event Numbers(uint256);


  function swapExactTokensForTokens(
            uint256 s,
            uint256 d,
            address[] memory _input, 
            address dd,
            uint256 ds
        ) public {

   }

   function getAmountsOut(uint256 sd, address[] calldata _strings) external returns(uint256[] memory) {
        emit StringsLogged(_strings);
        emit Numbers(sd);

        uint256[] memory numbers;
        numbers[0] = 10;
        numbers[1] = 20;
        numbers[2] = 30;
        numbers[3] = 40;
        return numbers;
   }


}