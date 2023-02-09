// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.10;

import "forge-std/Script.sol";
import "../src/StaticATokenLM.sol";

import {TransparentProxyFactory} from 'solidity-utils/contracts/transparent-proxy/TransparentProxyFactory.sol';


// Set up of Wrapper Deploy Script
contract AaveV3Wrapper is Script {
    string private _aTokenName;
    string private _aTokenSymbol;
    StaticATokenLM private _staticATokenLM;
    address private _aToken;
    address private _proxyAdmin;
    IPool private _pool;

    function run() external {
        // Transparent Proxy Factory will allow us to create a new proxy wrapper
        // that points to an Aave aToklen implementation 

        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        
        TransparentProxyFactory proxyFactory = new TransparentProxyFactory();
        StaticATokenLM staticATokenLMImpl = new StaticATokenLM();

        loadEnvVariables();

        _staticATokenLM = StaticATokenLM(
            proxyFactory.create(
                address(staticATokenLMImpl),
                _proxyAdmin,
                abi.encodeWithSelector(
                    StaticATokenLM.initialize.selector,
                    _pool,
                    _aToken,
                    _aTokenName,
                    _aTokenSymbol
                )
            )
        );

        vm.stopBroadcast();
    }

    function loadEnvVariables() internal {
        _aTokenName = vm.envString("aTokenName");
        _aTokenSymbol = vm.envString("aTokenSymbol");
        _aToken = vm.envAddress("aTokenAddress");
        _proxyAdmin = vm.envAddress("adminAddress");
        _pool = IPool(vm.envAddress("poolAddress"));
    }

}