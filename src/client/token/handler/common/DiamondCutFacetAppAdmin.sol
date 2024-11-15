// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import {ERC173} from "diamond-std/implementations/ERC173/ERC173.sol";
import {IDiamondCut} from "diamond-std/core/DiamondCut/IDiamondCut.sol";
import {DiamondCutLib, FacetCut} from "diamond-std/core/DiamondCut/DiamondCutLib.sol";
import "src/client/token/handler/common/AppAdministratorOrOwnerOnlyDiamondVersion.sol";
import "src/client/token/handler/ruleContracts/HandlerRuleContractsCommonImports.sol";

// Remember to add the loupe functions from DiamondLoupeFacet to the diamond.
// The loupe functions are required by the EIP2535 Diamonds standard

contract DiamondCutFacetAppAdmin is IDiamondCut, ERC173, AppAdministratorOrOwnerOnlyDiamondVersion {
    /// @notice Add/replace/remove any number of functions and optionally execute
    ///         a function with delegatecall
    /// @param _diamondCut Contains the facet addresses and function selectors
    /// @param init The address of the contract or facet to execute "data"
    /// @param data A function call, including function selector and arguments
    ///             calldata is executed with delegatecall on "init"
    function diamondCut(FacetCut[] calldata _diamondCut, address init, bytes calldata data) external override appAdministratorOrOwnerOnly(lib.handlerBaseStorage().appManager) {
        DiamondCutLib.diamondCut(_diamondCut, init, data);
    }
}
