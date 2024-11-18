// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "src/example/ERC20/ApplicationERC20.sol";
import "./DeployBase.s.sol";

// This deploys an un-registered ERC20 and mints 1000 tokens of it
// so that we can test/demo the process of creating liquidity pools via
// the UI that have an xToken which is totally outside of the rules engine
// and not registered with any particular game at all. 
contract ApplicationDeployUnregisteredFTScript is Script, DeployBase {
    uint256 privateKey;
    address ownerAddress;

    function setUp() public {}

    function run() public {
        privateKey = vm.envUint("DEPLOYMENT_OWNER_KEY");
        ownerAddress = vm.envAddress("DEPLOYMENT_OWNER");
        vm.startBroadcast(privateKey);

        ApplicationERC20 newCoin = new ApplicationERC20("Wolfy Coin", "WOLFY", ownerAddress);
        newCoin.mint(ownerAddress, 1000000000000000000000);

        vm.stopBroadcast();
    }
}
