// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "test/protocol/economic/invariant/rules/util/RuleStorageInvariantCommon.sol";
import {RuleStorageAccountMaxReceivedByAccessLevelActor} from "./RuleStorageAccountMaxReceivedByAccessLevelActor.sol";
import "./RuleStorageAccountMaxReceivedByAccessLevelActorManager.sol";

/**
 * @title RuleStorageAccountMaxReceivedByAccessLevelMultiTest
 * @author @ShaneDuncan602, @oscarsernarosero, @TJ-Everett, @mpetersoCode55
 * @dev This is the multi actor rule storage invariant test for multiple actors.
 */
contract RuleStorageAccountMaxReceivedByAccessLevelMultiTest is RuleStorageInvariantCommon {
    RuleStorageAccountMaxReceivedByAccessLevelActorManager actorManager;
    RuleStorageAccountMaxReceivedByAccessLevelActor[] actors;
    uint48[] ruleBefore = new uint48[](5);
    uint48[] assertion = new uint48[](5);
    address[] senderAddress = new address[](5);

    function setUp() public {
        prepRuleStorageInvariant();
        // Load 10 actors
        for (uint i; i < 10; i++) {
            ApplicationAppManager actorAppManager = _createAppManager();
            switchToSuperAdmin();
            actorAppManager.addAppAdministrator(appAdministrator);
            actors.push(new RuleStorageAccountMaxReceivedByAccessLevelActor(ruleProcessor, actorAppManager));
            if (i % 2 == 0) {
                vm.startPrank(appAdministrator);
                actorAppManager.addRuleAdministrator(address(actors[actors.length - 1]));
            }
        }
        actorManager = new RuleStorageAccountMaxReceivedByAccessLevelActorManager(actors);
        switchToRuleAdmin();
        index = AppRuleDataFacet(address(ruleProcessor)).addAccountMaxReceivedByAccessLevel(address(applicationAppManager), createUint48Array(666, 667, 668, 669, 670), address(0));
        (ruleBefore[0], senderAddress[0]) = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getAccountMaxReceivedByAccessLevel(index, 0);
        (ruleBefore[1], senderAddress[1]) = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getAccountMaxReceivedByAccessLevel(index, 1);
        (ruleBefore[2], senderAddress[2]) = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getAccountMaxReceivedByAccessLevel(index, 2);
        (ruleBefore[3], senderAddress[3]) = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getAccountMaxReceivedByAccessLevel(index, 3);
        (ruleBefore[4], senderAddress[4]) = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getAccountMaxReceivedByAccessLevel(index, 4);
        targetContract(address(actorManager));
    }

    // The total amount of rules will never decrease.
    function invariant_rulesTotalAccountMaxReceivedByAccessLevelNeverDecreases() public view {
        uint256 total;
        for (uint i; i < actors.length; i++) {
            total += actors[i].totalRules();
        }
        // index must be incremented by one to account for 0 based array
        assertLe(index + 1, ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getTotalAccountMaxReceivedByAccessLevel());
    }

    // The biggest ruleId in a rule type will always be the same as the total amount of rules registered in the protocol for that rule type - 1.
    function invariant_rulesTotalAccountMaxReceivedByAccessLevelEqualsAppBalances() public view {
        uint256 total;
        for (uint i; i < actors.length; i++) {
            total += actors[i].totalRules();
        }
        // adding 1 to total for the initial rule created in the setup function
        assertEq(total + 1, ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getTotalAccountMaxReceivedByAccessLevel());
    }

    // There can be only a total of 2**32 of each rule type.
    function invariant_rulesTotalAccountMaxReceivedByAccessLevelLessThanMax() public view {
        assertLe(ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getTotalAccountMaxReceivedByAccessLevel(), maxRuleCount);
    }

    /// The next ruleId created in a specific rule type will always be the same as the previous ruleId + 1.
    function invariant_rulesTotalAccountMaxReceivedByAccessLevelIncrementsByOne() public {
        uint256 previousTotal = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getTotalAccountMaxReceivedByAccessLevel();
        // not incrementing previousTotal by one due to zero based ruleId
        switchToRuleAdmin();
        assertEq(previousTotal, AppRuleDataFacet(address(ruleProcessor)).addAccountMaxReceivedByAccessLevel(address(applicationAppManager), createUint48Array(666, 667, 668, 669, 670),address(0)));
    }

    // Rules can never be modified.
    function invariant_AccountMaxReceivedByAccessLevelImmutable() public {
        (assertion[0], senderAddress[0]) = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getAccountMaxReceivedByAccessLevel(index, 0);
        (assertion[1], senderAddress[1]) = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getAccountMaxReceivedByAccessLevel(index, 1);
        (assertion[2], senderAddress[2]) = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getAccountMaxReceivedByAccessLevel(index, 2);
        (assertion[3], senderAddress[3]) = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getAccountMaxReceivedByAccessLevel(index, 3);
        (assertion[4], senderAddress[4]) = ApplicationAccessLevelProcessorFacet(address(ruleProcessor)).getAccountMaxReceivedByAccessLevel(index, 4);

        assertEq(ruleBefore[0], assertion[0]);
        assertEq(ruleBefore[1], assertion[1]);
        assertEq(ruleBefore[2], assertion[2]);
        assertEq(ruleBefore[3], assertion[3]);
        assertEq(ruleBefore[4], assertion[4]);
    }
}
