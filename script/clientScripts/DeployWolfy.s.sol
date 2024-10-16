// SPDX-License-Identifier : MIT
pragma solidity ^0.8.18;

import "forge-std/Script.sol";
import {WolfyA} from "src/example/ERC20/WolfyAERC20.sol";
import {WolfyB} from "src/example/ERC20/WolfyBERC20.sol";

contract DeployWolfy is Script {
    address public admin = 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266;

    function run() external {
        vm.startBroadcast();
        new WolfyA(admin);
        new WolfyB(admin);
        vm.stopBroadcast();
    }
}
