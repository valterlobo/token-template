// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import "../src/TokenTemplate.sol";

contract TokenDeployScript is Script {
    function setUp() public {}

    function run() public {

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        uint256 maxSupply = 1000000e18 ; 
        address owner = 0x3F9E5E96b26156541D369e57337881f6BA9Bc6A9;
        string memory nm = "HappyToken" ; 
        string memory sbl = "Happy"; 
        TokenTemplate token = new TokenTemplate( nm, sbl , maxSupply, owner);

        vm.stopBroadcast();

        
   
    }
}
