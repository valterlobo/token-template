// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TokenTemplate is ERC20Capped, Ownable {
    constructor(string memory nm, string memory sbl, uint256 totalSupply, address initialOwner)
        ERC20(nm, sbl)
        ERC20Capped(totalSupply)
        Ownable(initialOwner)
    {}

    //lembre-se : mint 18 decimals
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
