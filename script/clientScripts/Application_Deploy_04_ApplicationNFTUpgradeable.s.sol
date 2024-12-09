// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "src/example/ERC721/upgradeable/ApplicationERC721UProxy.sol";
import "src/example/ERC721/upgradeable/Forum.sol";
import {ApplicationAppManager} from "src/example/application/ApplicationAppManager.sol";
import "./DeployBase.s.sol";

/**
 * @title The Post Deployment Configuration Step For the Token
 * @author @VoR0220, @ShaneDuncan, @TJEverett, @GordanPalmer
 * @notice This is an example script for how to deploy a protocol ERC721 upgradeable token and proxy. 
 ** Requires .env variables to be set with correct addresses and Protocol Diamond addresses **. 
 * Deploy Scripts:
 * forge script clientScripts/script/Application_Deploy_01_AppManager.s.sol --ffi --rpc-url $RPC_URL --broadcast -vvvv
 * forge script clientScripts/script/Application_Deploy_02_ApplicationFT1.s.sol --ffi --rpc-url $RPC_URL --broadcast -vvvv
 * forge script clientScripts/script/Application_Deploy_03_ApplicationFT2.s.sol --ffi --rpc-url $RPC_URL --broadcast -vvvv
 * forge script clientScripts/script/Application_Deploy_04_ApplicationNFT.s.sol --ffi --rpc-url $RPC_URL --broadcast -vvvv
 * forge script clientScripts/script/Application_Deploy_04_ApplicationNFTUpgradable.s.sol --ffi --rpc-url $RPC_URL --broadcast -vvvv
 * forge script clientScripts/script/Application_Deploy_05_Oracle.s.sol --ffi --rpc-url $RPC_URL --broadcast -vvvv
 * forge script clientScripts/script/Application_Deploy_06_Pricing.s.sol --ffi --rpc-url $RPC_URL --broadcast -vvvv
 * forge script clientScripts/script/Application_Deploy_07_ApplicationAdminRoles.s.sol --ffi --rpc-url $RPC_URL --broadcast -vvvv
 * <<<OPTIONAL>>>
 * forge script clientScripts/script/Application_Deploy_08_UpgradeTesting.s.sol --ffi --rpc-url $RPC_URL --broadcast -vvvv
 */

 contract DeployProtocolERC721Upgradeable is Script, DeployBase {

    HandlerDiamond applicationNFTHandlerDiamond;
    ApplicationAppManager applicationAppManager;
    
    uint256 appConfigAdminKey;
    address appConfigAdminAddress;
    uint256 privateKey;
    address ownerAddress;

    function run() external {
        appConfigAdminAddress = vm.envAddress("CONFIG_APP_ADMIN");
        privateKey = vm.envUint("DEPLOYMENT_OWNER_KEY");
        ownerAddress = vm.envAddress("DEPLOYMENT_OWNER");
        vm.startBroadcast(privateKey);

        applicationAppManager = ApplicationAppManager(vm.envAddress("APPLICATION_APP_MANAGER"));
    
        Forum forum = new Forum();
        vm.stopBroadcast();
        /// switch to the config admin
        appConfigAdminKey = vm.envUint("CONFIG_APP_ADMIN_KEY");
        vm.startBroadcast(appConfigAdminKey);

        ApplicationERC721UProxy forumProxy = new ApplicationERC721UProxy(address(forum), address(appConfigAdminAddress), "");

        vm.stopBroadcast();
        vm.startBroadcast(privateKey);
        Forum(address(forumProxy)).initialize("Forum", "FORUM", address(applicationAppManager), vm.envString("APPLICATION_ERC721_URI_1"));


        vm.stopBroadcast();
        vm.startBroadcast(appConfigAdminKey);
        applicationNFTHandlerDiamond = createERC721HandlerDiamondPt1("Forum");
        
        vm.stopBroadcast();
    }
 }

/**
Deploy steps: Base Main Net

Deploy app manager + handler as DEPLOYMENT_OWNER 
Set DEPLOYMENT_OWNER as app admin (Will need to set multi sig address as owner as well)

Deploy Forum logic contract as DEPLOYMENT_OWNER (this will give full control of functions to address)
Deploy Proxy contract as CONFIG_APP_ADMIN (This will be Proxy admin and cannot call into contract)

Deploy Oracle Allowed as DEPLOYMENT_OWNER (will be app admin as well)
Set up Oracle Allowed Rules in FRE 

Deploy commands Base Sepolia 

RULE_PROCESSOR_DIAMOND 0x474d3c9fd6f35d741058dc2d6496263669ea49b6

forge script script/clientScripts/Application_Deploy_01_AppManager.s.sol --ffi --broadcast --rpc-url https://base-mainnet.g.alchemy.com/v2/e2f4XJLzwXOtDIODAgep76t-57M9V6E6 --verify --verifier etherscan --etherscan-api-key SWD9Z7ZAH32KR9Q5PIVJ4PSGXJBTI4BCR3

forge script script/clientScripts/Application_Deploy_04_ApplicationNFTUpgradeable.s.sol --ffi --broadcast --rpc-url https://base-mainnet.g.alchemy.com/v2/e2f4XJLzwXOtDIODAgep76t-57M9V6E6 --verify --verifier etherscan --etherscan-api-key SWD9Z7ZAH32KR9Q5PIVJ4PSGXJBTI4BCR3

forge script script/clientScripts/Application_Deploy_04_ApplicationNFTUpgradeablePt2.s.sol --ffi --broadcast --rpc-url https://base-mainnet.g.alchemy.com/v2/e2f4XJLzwXOtDIODAgep76t-57M9V6E6 --verify --verifier etherscan --etherscan-api-key SWD9Z7ZAH32KR9Q5PIVJ4PSGXJBTI4BCR3

forge script script/clientScripts/Application_Deploy_05_Oracle.s.sol --ffi --broadcast --rpc-url https://base-mainnet.g.alchemy.com/v2/e2f4XJLzwXOtDIODAgep76t-57M9V6E6 --verify --verifier etherscan --etherscan-api-key SWD9Z7ZAH32KR9Q5PIVJ4PSGXJBTI4BCR3




cast send 0xc0d44f9ce7ecc7f2505af8412c6eeff2b6ceee27 "safeMint(address)" 0x158fA1bB7931F7d17Db709C3d7dE62E2ad81cCd1 --private-key  --rpc-url 

 */






/**
Deploy steps: Base Sepolia 

Deploy app manager + handler as DEPLOYMENT_OWNER 
Set DEPLOYMENT_OWNER as app admin (Will need to set multi sig address as owner as well)

Deploy Forum logic contract as DEPLOYMENT_OWNER (this will give full control of functions to address)
Deploy Proxy contract as CONFIG_APP_ADMIN (This will be Proxy admin and cannot call into contract)

Deploy Oracle Allowed as DEPLOYMENT_OWNER (will be app admin as well)
Set up Oracle Allowed Rules in FRE 

Deploy commands Base Sepolia 

RULE_PROCESSOR_DIAMOND 0x8fe43b3bcf8410b913dd1c84dc8af28daafd9777

forge script script/clientScripts/Application_Deploy_01_AppManager.s.sol --ffi --broadcast --rpc-url https://base-sepolia.g.alchemy.com/v2/e2f4XJLzwXOtDIODAgep76t-57M9V6E6 --verify --verifier etherscan --etherscan-api-key SWD9Z7ZAH32KR9Q5PIVJ4PSGXJBTI4BCR3

forge script script/clientScripts/Application_Deploy_04_ApplicationNFTUpgradeable.s.sol --ffi --broadcast --rpc-url https://base-sepolia.g.alchemy.com/v2/e2f4XJLzwXOtDIODAgep76t-57M9V6E6 --verify --verifier etherscan --etherscan-api-key SWD9Z7ZAH32KR9Q5PIVJ4PSGXJBTI4BCR3

forge script script/clientScripts/Application_Deploy_04_ApplicationNFTUpgradeablePt2.s.sol --ffi --broadcast --rpc-url https://base-sepolia.g.alchemy.com/v2/e2f4XJLzwXOtDIODAgep76t-57M9V6E6 --verify --verifier etherscan --etherscan-api-key SWD9Z7ZAH32KR9Q5PIVJ4PSGXJBTI4BCR3

forge script script/clientScripts/Application_Deploy_05_Oracle.s.sol --ffi --broadcast --rpc-url https://base-sepolia.g.alchemy.com/v2/e2f4XJLzwXOtDIODAgep76t-57M9V6E6 --verify --verifier etherscan --etherscan-api-key SWD9Z7ZAH32KR9Q5PIVJ4PSGXJBTI4BCR3
 



cast send 0xc0d44f9ce7ecc7f2505af8412c6eeff2b6ceee27 "safeMint(address)" 0x158fA1bB7931F7d17Db709C3d7dE62E2ad81cCd1 --private-key 14cfaaf6a44514a660b917cbaca38041f2003aaddf5f1f51ceda2f45f46bf263 --rpc-url https://base-sepolia.g.alchemy.com/v2/e2f4XJLzwXOtDIODAgep76t-57M9V6E6
cast send 0xc0d44f9ce7ecc7f2505af8412c6eeff2b6ceee27 "safeTransferFrom(address,address,uint)" 0x158fA1bB7931F7d17Db709C3d7dE62E2ad81cCd1 0xe4D3DF4c10eaC24C8c798270e6E0be2852226C61 0 --private-key 14cfaaf6a44514a660b917cbaca38041f2003aaddf5f1f51ceda2f45f46bf263 --rpc-url https://base-sepolia.g.alchemy.com/v2/e2f4XJLzwXOtDIODAgep76t-57M9V6E6

cast send <proxyaddress> "transferOwnership(address)"  <multisig address> --private-key <deployerKey> --rpc-url <rpc url>
 */

