// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "lib/forge-std/src/Script.sol";

interface IAlienCodex {
    function owner() external view returns (address);
    function codex(uint256) external view returns (bytes32);
    function retract() external;
    function makeContact() external;
    function revise(uint256 i, bytes32 _content) external;
}

contract AlienCodexSolution is Script {
    IAlienCodex public alienCodex;

    function run() external {
        vm.startBroadcast();
        alienCodex = IAlienCodex(0x4ee942cb5068a9FAb43EE54a4bC24c3DE644B1f5);
        console.log("Solving AlienCodex...");

        bytes32 ret = alienCodex.codex(0);

        console.log( ret);
        vm.stopBroadcast();
    }
}
