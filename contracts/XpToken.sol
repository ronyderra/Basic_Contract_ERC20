// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/draft-ERC20Permit.sol";

contract XpToken is ERC20, ERC20Permit {
    constructor() ERC20("XpToken", "XP") ERC20Permit("XpToken") {
        _mint(msg.sender, 10000000 * 10 ** decimals());
    }
}