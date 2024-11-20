# ClientNativeFacet
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/82c852aae835019a12c3223cb7eabe7f59f19e1a/src/client/token/handler/common/ClientNativeFacet.sol)

**Inherits:**
[DiamondCutFacetAppAdmin](/src/client/token/handler/common/DiamondCutFacetAppAdmin.sol/contract.DiamondCutFacetAppAdmin.md), DiamondLoupeFacet

**Author:**
@ShaneDuncan602 @oscarsernarosero @TJ-Everett

*The code for this comes from Nick Mudge's sample contracts.
This contract uses a custom DiamondCutFacet lib that uses the appAdminOrOnlyOwnerModifier for upgrades to facets.
This contract is also for the deploy scripts can still use Foundry's vm.getCode operation to pull the function selectors for the facets.*


