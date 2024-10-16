// SPDX-License-Identifier: GPL-2.0-or-later
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

/**
@title WolfyA ERC20 Token
@notice This ERC20 token includes basic minting, burning, and transfer functionalities,
        along with security and access control using AccessControl and ReentrancyGuard.
 */
contract WolfyA is ERC20, ERC20Burnable, AccessControl, ReentrancyGuard {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    // Define an initial supply (optional for contract constructor)
    uint256 public constant INITIAL_SUPPLY = 1_000_000_000 * 10**18; // 1 million tokens

    constructor(address admin) ERC20("Dark Wolf", "DARKWOLF") {
        // Mint the initial supply to the deployer (admin)
        _mint(admin, INITIAL_SUPPLY);

        // Grant the admin role and the minter role to the specified admin
        _grantRole(DEFAULT_ADMIN_ROLE, admin);
        _grantRole(MINTER_ROLE, admin);
    }

    /**
@dev Mint additional tokens. Only addresses with the MINTER_ROLE can mint.
@param to The address that will receive the minted tokens.
@param amount The amount of tokens to mint.
     */
    function mint(address to, uint256 amount) external onlyRole(MINTER_ROLE) {
        _mint(to, amount);
    }

    /**
@dev Transfer tokens. Overridden to include nonReentrant for security.
@param recipient The address of the recipient.
@param amount The amount of tokens to transfer.
@return A boolean indicating whether the transfer was successful.
     */
    function transfer(address recipient, uint256 amount) public override nonReentrant returns (bool) {
        return super.transfer(recipient, amount);
    }

    /**
@dev Transfer tokens from one address to another. Overridden to include nonReentrant for security.
@param from The address of the sender.
@param to The address of the recipient.
@param amount The amount of tokens to transfer.
@return A boolean indicating whether the transfer was successful.
     */
    function transferFrom(address from, address to, uint256 amount) public override nonReentrant returns (bool) {
        return super.transferFrom(from, to, amount);
    }

    /**
@dev Allow burning of tokens by any holder (inherited from ERC20Burnable).
     The contract owner can burn tokens from any address.
@param from The address from which tokens will be burned.
@param amount The amount of tokens to burn.
     */
    function burnFrom(address from, uint256 amount) public override {
        super.burnFrom(from, amount);
    }

    /**
@dev This is a batch transfer function that allows the owner to transfer tokens
     to multiple recipients in one transaction.
@param recipients An array of addresses to receive tokens.
@param amounts An array of token amounts corresponding to each recipient.
     */
    function batchTransfer(address[] calldata recipients, uint256[] calldata amounts) external onlyRole(DEFAULT_ADMIN_ROLE) {
        require(recipients.length == amounts.length, "Recipients and amounts length mismatch");
        for (uint256 i = 0; i < recipients.length; i++) {
            _transfer(msg.sender, recipients[i], amounts[i]);
        }
    }
}
