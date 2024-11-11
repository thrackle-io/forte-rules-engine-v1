// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Test.sol";
import "test/util/gasReport/GasHelpers.sol";
import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";

contract ERC20Mock is ERC20 {
    constructor(string memory name, string memory symbol) ERC20(name, symbol) {}
    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
    function burn(address from, uint256 amount) public {
        _burn(from, amount);
    }
}

contract ERC721Mock is ERC721 {
    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}
    function mint(address to, uint256 tokenId) public {
        _mint(to, tokenId);
    }
    function burn(uint256 tokenId) public {
        _burn(tokenId);
    }
}

contract GasReportRegularTokens is GasHelpers, Test {

    ERC20Mock public erc20Mock;
    ERC721Mock public erc721Mock;

    function setUp() public {
        erc20Mock = new ERC20Mock("ERC20Mock", "ERC20M");
        erc721Mock = new ERC721Mock("ERC721Mock", "ERC721M");
    }

    function test_ERC20_Mint() public {
        erc20Mock.mint(address(this), 1);
        startMeasuringGas("ERC20_Mint");
        erc20Mock.mint(address(this), 1000);
        uint256 gasDelta = stopMeasuringGas();
        console.log("Gas Delta: %s", gasDelta);
    }

    function test_ERC20_Burn() public {
        erc20Mock.mint(address(this), 1000);
        startMeasuringGas("ERC20_Burn");
        erc20Mock.burn(address(this), 1000);
        uint256 gasDelta = stopMeasuringGas();
        console.log("Gas Delta: %s", gasDelta);
    }

    function test_ERC20_Transfer() public {
        erc20Mock.mint(address(this), 1000);
        startMeasuringGas("ERC20_Transfer");
        erc20Mock.transfer(address(1), 1000);
        uint256 gasDelta = stopMeasuringGas();
        console.log("Gas Delta: %s", gasDelta);
    }

    function test_ERC721_Mint() public {
        erc721Mock.mint(address(this), 1);
        startMeasuringGas("ERC721_Mint");
        erc721Mock.mint(address(this), 2);
        uint256 gasDelta = stopMeasuringGas();
        console.log("Gas Delta: %s", gasDelta);
    }

    function test_ERC721_Burn() public {
        erc721Mock.mint(address(this), 1);
        startMeasuringGas("ERC721_Burn");
        erc721Mock.burn(1);
        uint256 gasDelta = stopMeasuringGas();
        console.log("Gas Delta: %s", gasDelta);
    }

    function test_ERC721_Transfer() public {
        erc721Mock.mint(address(this), 1);
        startMeasuringGas("ERC721_Transfer");
        erc721Mock.transferFrom(address(this), address(1), 1);
        uint256 gasDelta = stopMeasuringGas();
        console.log("Gas Delta: %s", gasDelta);
    }
}