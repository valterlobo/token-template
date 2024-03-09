// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import "forge-std/console.sol";
import {TokenTemplate} from "../src/TokenTemplate.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Capped.sol";

contract TokenTemplateTest is Test {
    TokenTemplate public token;
    address alice = vm.addr(0x1);
    address bob = vm.addr(0x2);
    address maria = vm.addr(0x3);
    address joao = vm.addr(0x4);
    //uint totalSupply =
    uint256 maxSupply = 1000e18;

    function setUp() public {
        token = new TokenTemplate("HappyToken", "Happy", maxSupply, alice);
    }

    function testName() external {
        assertEq("HappyToken", token.name());
    }

    function testMint() external {
        uint256 total = 100e18;
        vm.prank(alice);
        token.mint(bob, total);
        console.log("Supply:%d  | CAP %d", token.totalSupply(), token.cap());
        assertEq(total, token.balanceOf(bob));

        //vm.expectRevert();
    }

    function testLimitSupply() external {
        uint256 bobAmount = 100e18;
        vm.prank(alice);
        token.mint(bob, bobAmount);
        console.log("Supply:%d  | CAP %d", token.totalSupply(), token.cap());
        assertEq(bobAmount, token.balanceOf(bob));

        uint256 mariaAmount = 400e18;
        vm.prank(alice);
        token.mint(maria, mariaAmount);
        assertEq(mariaAmount, token.balanceOf(maria));
        console.log("Supply:%d  | CAP %d", token.totalSupply(), token.cap());

        vm.startPrank(alice);
        token.mint(bob, bobAmount);
        token.mint(maria, mariaAmount);
        vm.stopPrank();
        console.log("Supply:%d  | CAP %d", token.totalSupply(), token.cap());

        //error ERC20ExceededCap(uint256 increasedSupply, uint256 cap);
        vm.expectRevert(
            abi.encodeWithSelector(
                ERC20Capped.ERC20ExceededCap.selector,
                maxSupply + bobAmount,
                maxSupply
            )
        );
        vm.startPrank(alice);
        token.mint(bob, bobAmount);
    }


    function invariant_supply() external {


  
        assertGe(maxSupply, token.totalSupply());        
    }


    /*function testFuzzMint(address to , uint256 amount) external {

        vm.assume(to!=address(0));
        vm.assume(token.cap()  >  token.totalSupply());
        console.log("Supply  %d to %d",  token.totalSupply() , token.cap() );
        //vm.expectRevert(ERC20ExceededCap.selector);
        vm.startPrank(alice);
        token.mint(to , amount);
        vm.stopPrank();   
        //assertEq(totalSupply*(10 ** 18), token.totalSupply());
    }*/
}
