// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "test/util/TestCommonFoundry.sol";
import "test/client/token/TestTokenCommon.sol";
import "test/client/token/ERC721/util/ERC721Util.sol";
import "test/client/token/ERC721/integration/ERC721CommonTests.t.sol";

/**
 * NOTE: This test contract will test the RulesProcessor by creating fresh tokens, applying rules, and testing them. It does not require tokens be deployed ahead of time nor does it test deployed tokens. 
 */

contract DeploymentProcessorERC721 is ERC721CommonTests {
    address targetAccount;
    address targetAccount2;
    uint256 minBalance;
    uint256 maxBalance;

    function setUp() public endWithStopPrank {
        if (vm.envAddress("DEPLOYMENT_OWNER") != address(0x0)) {
            // Verify App Manager has been deployed
            superAdmin = vm.envAddress("DEPLOYMENT_OWNER");
            appAdministrator = superAdmin;
            ruleProcessor = RuleProcessorDiamond(payable(vm.envAddress("DEPLOYMENT_RULE_PROCESSOR_DIAMOND")));
            ruleAdmin = superAdmin;
            feeSink = 0x15d34AAf54267DB7D7c367839AAf71A00a2C6A65; // anvil default address 4
            if (address(applicationAppManager) == address(0x0) || 
                address(applicationNFT) == address(0x0) || 
                address(applicationCoin) == address(0x0)) {
                    // First reset the addresses back to anvil addresses
                    user1 = address(11);
                    user2 = address(22);
                    // Second deploy new application and tokens 
                    setUpAppManagerAndCreateTokensAndHandlers();
            }
          
            testCaseNFT = applicationNFT;

            Blocktime = uint64(block.timestamp); 
            switchToAppAdministrator();    
            HandlerVersionFacet(address(applicationCoinHandler)).updateVersion("2.3.0");    
        }  else {
            vm.warp(Blocktime);
            setUpProcotolAndCreateERC20AndDiamondHandler();
            testCaseNFT = applicationNFT;
        }
    }
}