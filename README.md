# Static aToken with liquidity mining deployment branch

## About

This branch is a fork of the BGD-Labs Static aToken repository for Aave V3 that will incorporate deployment scripts for various token wrappers. These scripts can be found within the scripts folder of the root directory.

## Notice

This project is build using the Foundry smart contract development toolchain. Please make sure Foundry is installed before continuing.

## Repository Setup

```
// Step 1. Install all submodule dependencies within the project
forge install

// Step 2. Compile all solidity contracts
forge build

// Step 3. Add your Etherscan api key, RPC endpoints within the .env file


// Step 4. Run all unit/fork tests
forge test
```

## Deploying Static aToken token wrappers

1. Within the .env set up the details for your token wrapper deployment

```
# Values for token deployments
aTokenName="<Wrapped Token Name>"
aTokenSymbol="<Wrapped Token Symbol>"
poolAddress=<Aave Lending Pool Address>
adminAddress=<Proxy Admin Address>
aTokenAddress=<aToken Implementation Address>
```

2. Run the following command to deploy your token wrapper

```
forge script script/AaveV3Wrapper.s.sol:AaveV3Wrapper --rpc-url $<.env Network RPC Variable> --broadcast --verify -vvvv
```

Below is an example of a deployment for aDAI on the Goerli Testnet

.env values:

```
# Values for token deployments
aTokenName="Wrapped aEthDAI"
aTokenSymbol="waEthDAI"
poolAddress=0x7b5C526B7F8dfdff278b4a3e045083FBA4028790
adminAddress=0x263c0a1ff85604f0ee3f4160cAa445d0bad28dF7
aTokenAddress=0xADD98B0342e4094Ec32f3b67Ccfd3242C876ff7a
```

Deployment command:

```
forge script script/AaveV3Wrapper.s.sol:AaveV3Wrapper --rpc-url $RPC_GOERLI --broadcast --verify
```
