// SPDX license identifier: MIT

pragma solidity ^0.8.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {GatekeeperOne} from "../src/GateKeeperOne.sol";

contract Opener {
    function openGate(GatekeeperOne gatekeeperOne) public {
        bytes8 gateKey = bytes8(bytes2(0));
        gatekeeperOne.enter(gateKey);
    }
}

contract GatekeeperOneSolution is Script {
    GatekeeperOne public gatekeeperOne;
    Opener public opener;

    function run() external {
        vm.startBroadcast();
        gatekeeperOne = new GatekeeperOne();
        opener = new Opener();

        console.log("Solving GatekeeperOne...");

        opener.openGate(gatekeeperOne);

        vm.stopBroadcast();
        console.log("GatekeeperOne Solved!");
    }
}
