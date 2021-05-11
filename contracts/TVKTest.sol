// contracts/GLDToken.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.7.3;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TVKTest is ERC20 {

    uint256 public constant supply = uint256(10 ** (18 + 10));

    constructor() ERC20("TVKTest", "TVK") {
        _mint(msg.sender, supply);
    }
}