// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import "../src/TokenTemplate.sol";

contract TokenMintScript is Script {
    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        uint256 totalMint = 100e18;
        address to = vm.envAddress("TO_MINT");
        address tkContract = vm.envAddress("TK_CONTRACT");
        TokenTemplate token = TokenTemplate(tkContract);
        token.mint(to, totalMint);

        vm.stopBroadcast();
    }
}
