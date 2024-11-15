// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

import "./DiamondCutFacetAppAdmin.sol";
import {DiamondLoupeFacet} from "diamond-std/core/DiamondLoupe/DiamondLoupeFacet.sol";

/**
 * @title ClientNativeFacet
 * @author @ShaneDuncan602 @oscarsernarosero @TJ-Everett
 * @dev The code for this comes from Nick Mudge's sample contracts. 
 * This contract uses a custom DiamondCutFacet lib that uses the appAdminOrOnlyOwnerModifier for upgrades to facets. 
 * This contract is also for the deploy scripts can still use Foundry's vm.getCode operation to pull the function selectors for the facets.
 */
contract ClientNativeFacet is DiamondCutFacetAppAdmin, DiamondLoupeFacet {

} 
