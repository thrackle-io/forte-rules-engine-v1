// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/access/Ownable.sol";
import "src/common/IProtocolERC721Pricing.sol";
import "src/common/IProtocolERC20Pricing.sol";
import "src/client/application/IAppManager.sol";
import {IZeroAddressError, IAppHandlerErrors} from "src/common/IErrors.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/IERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "src/client/token/ITokenInterface.sol";
import {IApplicationHandlerEvents, ICommonApplicationHandlerEvents} from "src/common/IEvents.sol";


/**
 * @title Application Pricing 
 * @notice Application Pricing contract to assist pricing of app level assets
 * @dev This contract accesses pricers to aggegrate them for app level assets
 * @author @ShaneDuncan602, @oscarsernarosero, @TJ-Everett
 */
contract ApplicationPricing is Ownable, IAppHandlerErrors, IZeroAddressError, IApplicationHandlerEvents{
    /// Pricing Module interfaces
    IProtocolERC20Pricing erc20Pricer;
    IProtocolERC721Pricing nftPricer;
    address public erc20PricingAddress;
    address public nftPricingAddress;
    IAppManager appManager;

    /**
     * @dev Constructor that sets the app manager address used for permissions. This is required for upgrades.
     * @param _dataModuleAppManagerAddress address of the owning app manager
     */
    constructor(address _dataModuleAppManagerAddress) {
        appManager = IAppManager(_dataModuleAppManagerAddress);
        _transferOwnership(msg.sender);
    }

    /// -------------- Pricing Module Configurations ---------------
    /**
     * @dev Sets the address of the nft pricing contract and loads the contract.
     * @param _address Nft Pricing Contract address.
     */
    function setNFTPricingAddress(address _address) external onlyOwner {
        if (_address == address(0)) revert ZeroAddress();
        nftPricingAddress = _address;
        nftPricer = IProtocolERC721Pricing(_address);
        emit AD1467_ERC721PricingAddressSet(_address);
    }

    /**
     * @dev Sets the address of the erc20 pricing contract and loads the contract.
     * @param _address ERC20 Pricing Contract address.
     */
    function setERC20PricingAddress(address _address) external onlyOwner {
        if (_address == address(0)) revert ZeroAddress();
        erc20PricingAddress = _address;
        erc20Pricer = IProtocolERC20Pricing(_address);
        emit AD1467_ERC20PricingAddressSet(_address);
    }

    /**
     * @dev Get the account's balance in dollars. It uses the registered tokens in the app manager.
     * @notice This gets the account's balance in dollars.
     * @param _account address to get the balance for
     * @return totalValuation of the account in dollars
     */
    // slither-disable-next-line calls-loop
    function getAccTotalValuation(address _account, uint256 _nftValuationLimit) external view returns (uint256 totalValuation) {
        address[] memory tokenList = appManager.getTokenList();
        uint256 tokenAmount;
        /// check if _account is zero address. If zero address we return a valuation of zero to allow for burning tokens when rules that need valuations are active.
        if (_account == address(0)) {
            return totalValuation;
        } else {
            /// Loop through all Nfts and ERC20s and add values to balance for account valuation
            for (uint256 i; i < tokenList.length; ++i) {
                /// Check to see if user owns the asset
                tokenAmount = (IToken(tokenList[i]).balanceOf(_account));
                if (tokenAmount > 0) {
                    try IERC165(tokenList[i]).supportsInterface(0x80ac58cd) returns (bool isERC721) {
                        if (isERC721 && tokenAmount >= _nftValuationLimit) totalValuation += _getNFTCollectionValue(tokenList[i], tokenAmount);
                        else if (isERC721 && tokenAmount < _nftValuationLimit) totalValuation += _getNFTValuePerCollection(tokenList[i], _account, tokenAmount);
                        else {
                            uint8 decimals = ERC20(tokenList[i]).decimals();
                            totalValuation += (_getERC20Price(tokenList[i]) * (tokenAmount)) / (10 ** decimals);
                        }
                    } catch {
                        uint8 decimals = ERC20(tokenList[i]).decimals();
                        totalValuation += (_getERC20Price(tokenList[i]) * (tokenAmount)) / (10 ** decimals);
                    }
                }
            }
        }
    }

    /**
     * @dev Get the value for a specific ERC20. This is done by interacting with the pricing module
     * @notice This gets the token's value in dollars.
     * @param _tokenAddress the address of the token
     * @return price the price of 1 in dollars
     */
    function _getERC20Price(address _tokenAddress) public view returns (uint256) {
        if (erc20PricingAddress != address(0)) {
            // Disabling this finding, it is a false positive. The if statement for the zero address check
            // is being treated as a loop.
            // slither-disable-next-line calls-loop
            return erc20Pricer.getTokenPrice(_tokenAddress);
        } else {
            revert PricingModuleNotConfigured(erc20PricingAddress, nftPricingAddress);
        }
    }

    /**
     * @dev Get the value for a specific ERC721. This is done by interacting with the pricing module
     * @notice This gets the token's value in dollars.
     * @param _tokenAddress the address of the token
     * @param _account of the token holder
     * @param _tokenAmount amount of NFTs from _tokenAddress contract
     * @return totalValueInThisContract in whole USD
     */
    // slither-disable-next-line calls-loop
    function _getNFTValuePerCollection(address _tokenAddress, address _account, uint256 _tokenAmount) public view returns (uint256 totalValueInThisContract) {
        if (nftPricingAddress != address(0)) {
            for (uint i; i < _tokenAmount; ++i) {
                totalValueInThisContract += getNFTPrice(_tokenAddress, IERC721Enumerable(_tokenAddress).tokenOfOwnerByIndex(_account, i));
            }
        } else {
            revert PricingModuleNotConfigured(erc20PricingAddress, nftPricingAddress);
        }
    }

    function getNFTPrice(address _tokenAddress, uint256 _tokenId) public view returns(uint256){
        return nftPricer.getNFTPrice(_tokenAddress, _tokenId);
    }


    /**
     * @dev Get the total value for all tokens held by a wallet for a specific collection. This is done by interacting with the pricing module
     * @notice This function gets the total token value in dollars of all tokens owned in each collection by address.
     * @param _tokenAddress the address of the token
     * @param _tokenAmount amount of NFTs from _tokenAddress contract
     * @return totalValueInThisContract total valuation of tokens by collection in whole USD
     */
    function _getNFTCollectionValue(address _tokenAddress, uint256 _tokenAmount) public view returns (uint256 totalValueInThisContract) {
        if (nftPricingAddress != address(0)) {
            // Disabling this finding, it is a false positive. The if statement for the zero address check
            // is being treated as a loop.
            // slither-disable-next-line calls-loop
            totalValueInThisContract = _tokenAmount * uint256(nftPricer.getNFTCollectionPrice(_tokenAddress));
        } else {
            revert PricingModuleNotConfigured(erc20PricingAddress, nftPricingAddress);
        }
    }


}
