// SPDX-License-Identifier: MIT

pragma solidity ^0.6.12;

import { IERC20 } from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import { ERC1155 } from "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import { ERC20BalancePrestige } from "../ERC20BalancePrestige.sol";
import { PrestigeByConstructionClaim } from "../PrestigeByConstructionClaim.sol";

contract ClaimERC1155Test is ERC20BalancePrestige, PrestigeByConstructionClaim, ERC1155 {
    uint256 public constant ART = 0;
    uint256 public constant GOOD_ART = 1;

    constructor(IERC20 _redeemableToken, uint256[9] memory _levels)
        public
        ERC1155("https://example.com/{id}.json")
        PrestigeByConstructionClaim(this)
        ERC20BalancePrestige(_redeemableToken, _levels) { } // solhint-disable-line no-empty-blocks

    function processClaim(
        address account,
        uint256,
        bytes memory
    ) internal {
        // Anyone with gold status since construction gets some art.
        _mint(account, ART, 1, "");

        // Anyone with platinum status since construction gets another art, and some good art.
        if (isStatus(account, Status.PLATINUM)) {
            _mint(account, ART, 1, "");
            _mint(account, GOOD_ART, 1, "");
        }
    }
}