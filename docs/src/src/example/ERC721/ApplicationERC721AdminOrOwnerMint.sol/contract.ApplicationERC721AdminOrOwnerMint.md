# ApplicationERC721AdminOrOwnerMint
[Git Source](https://github.com/thrackle-io/forte-rules-engine/blob/82c852aae835019a12c3223cb7eabe7f59f19e1a/src/example/ERC721/ApplicationERC721AdminOrOwnerMint.sol)

**Inherits:**
[ApplicationERC721](/src/example/ERC721/ApplicationERC721.sol/contract.ApplicationERC721.md)

**Author:**
@ShaneDuncan602, @oscarsernarosero, @TJ-Everett

This is an example implementation of the protocol ERC721 where minting is only available for app administrators or contract owners.


## Functions
### constructor

*Constructor sets the name, symbol and base URI of NFT along with the App Manager and Handler Address*


```solidity
constructor(string memory _name, string memory _symbol, address _tokenAdmin, string memory _baseUri)
    ApplicationERC721(_name, _symbol, _tokenAdmin, _baseUri);
```
**Parameters**

|Name|Type|Description|
|----|----|-----------|
|`_name`|`string`|Name of NFT|
|`_symbol`|`string`|Symbol for the NFT|
|`_tokenAdmin`|`address`|Token Admin address|
|`_baseUri`|`string`|URI for the base token|


