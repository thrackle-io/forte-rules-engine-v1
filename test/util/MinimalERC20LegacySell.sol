// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "src/client/token/IProtocolTokenHandler.sol";
import "src/client/token/IProtocolToken.sol";
import "src/client/token/handler/diamond/ERC20HandlerMainFacet.sol";

/**
 * @title Minimal ERC20 Protocol Contract
 * @author @ShaneDuncan602, @oscarsernarosero, @TJ-Everett
 */
contract MinimalERC20LegacySell is ERC20, ERC20Burnable {

    address private handlerAddress;

    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
    }

        /**
     * @dev Function called before any token transfers to confirm transfer is within rules of the protocol
     * @param from sender address
     * @param to recipient address
     * @param amount number of tokens to be transferred
     */
     // slither-disable-next-line calls-loop
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal override {
        /// Rule Processor Module Check
        if (handlerAddress != address(0)) require(IProtocolERC20HandlerSell(handlerAddress).checkAllRules(balanceOf(from), balanceOf(to), from, to, _msgSender(), amount, ActionTypesLegacy.SELL));
        super._beforeTokenTransfer(from, to, amount);
    }

    /**
     * @dev Function to connect Token to previously deployed Handler contract
     * @param _deployedHandlerAddress address of the currently deployed Handler Address
     */
    // slither-disable-next-line missing-zero-check
    function connectHandlerToToken(address _deployedHandlerAddress) external {
        handlerAddress = _deployedHandlerAddress;
    }

    /**
     * @dev This function returns the handler address
     * @return handlerAddress
     */
    function getHandlerAddress() external view returns (address) {
        return address(handlerAddress);
    }

        /**
     * @dev Function mints new tokens.
     * @param to recipient address
     * @param amount number of tokens to mint
     */
    function mint(address to, uint256 amount) public virtual {
        _mint(to, amount);
    }
}

/**
 * @title Asset Handler Interface
 * @author @ShaneDuncan602 @oscarsernarosero @TJ-Everett
 * @dev This interface provides the ABI for assets to access their handlers in an efficient way
 */

interface IProtocolERC20HandlerSell {
    /**
     * @dev This function is the one called from the contract that implements this handler. It's the entry point to protocol.
     * @param _balanceFrom token balance of sender address
     * @param _balanceTo token balance of recipient address
     * @param _from sender address
     * @param _to recipient address
     * @param _sender message sender
     * @param _amount number of tokens transferred
     * @param _action Action Type defined by ApplicationHandlerLib (Purchase, Sell, Trade, Inquire)
     * @return Success equals true if all checks pass
     */
    function checkAllRules(uint256 _balanceFrom, uint256 _balanceTo, address _from, address _to, address _sender, uint256 _amount, ActionTypesLegacy _action) external returns (bool);
}

/**
 * @title Action Enum
 * @author @ShaneDuncan602 @oscarsernarosero @TJ-Everett
 * @dev stores the possible actions for the protocol
 */
enum ActionTypesLegacy {
    PURCHASE,
    SELL,
    TRADE,
    INQUIRE
}