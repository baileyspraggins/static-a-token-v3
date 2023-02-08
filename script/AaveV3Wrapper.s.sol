// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "../src/StaticATokenLM.sol";

// Set up of Wrapper Deploy Script
contract AaveV3Wrapper is Script {
    function run() external {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        vm.startBroadcast(deployerPrivateKey);

        StaticATokenLM aaveWrapper = new StaticATokenLM()
    }
}