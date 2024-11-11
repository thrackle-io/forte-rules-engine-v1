// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

import "forge-std/Script.sol";
import "forge-std/console2.sol";
import {IDiamondLoupe} from "diamond-std/core/DiamondLoupe/IDiamondLoupe.sol";
import {IDiamondCut} from "diamond-std/core/DiamondCut/IDiamondCut.sol";
import {FacetCut, FacetCutAction} from "diamond-std/core/DiamondCut/DiamondCutLib.sol";
import {DiamondScriptUtil} from "../DiamondScriptUtil.sol";


struct JsonBatchFile {
    string version;
    string chainId;
    uint256 createdAt;
    Meta meta;
    Transaction[] transactions;
}

struct Meta {
    string name;
    string description;
    string txBuilderVersion;
    string createdFromSafeAddress;
    string createdFromOwnerAddress;
}

struct Transaction {
    address to;
    uint256 value;
    string data;
}

contract UpgradeFacetsJSONBuilder is Script, DiamondScriptUtil {

    string constant version = "1.0";
    string chainId;
    string constant description = "for upgrading diamonds";
    string constant name = "DiamondSafeUpgrades";
    string constant txBuilderVersion = "1.17.1";


    address diamondAddress;
    address safeAddress;
    string facetToUpgrade;
    address newFacetAddress;


    function run() public {
        diamondAddress = vm.envAddress("DIAMOND_ADDRESS_TO_UPGRADE");
        facetToUpgrade = vm.envString("FACET_TO_UPGRADE");
        newFacetAddress = vm.envAddress("FACET_ADDRESS_TO_UPGRADE");
        chainId = vm.envString("CHAIN_ID");
        safeAddress = vm.envAddress("SAFE_ADDRESS");

        // add or replace

        JsonBatchFile memory batchFile;
        Meta memory meta = Meta({
            createdFromSafeAddress: vm.toString(safeAddress),
            createdFromOwnerAddress: "",
            description: description,
            name: name,
            txBuilderVersion: txBuilderVersion
        });

        batchFile.version = version;
        batchFile.chainId = chainId;
        batchFile.createdAt = vm.unixTime();
        batchFile.meta = meta;
        
        batchFile.transactions = new Transaction[](1);
        string memory diamondAction = vm.envString("DIAMOND_ACTION");
        
        bytes4[] memory selectors = getSelectors();

        if (keccak256(abi.encode(diamondAction)) == keccak256(abi.encode("ADD"))) {
            FacetCut memory facetCut = FacetCut({
                facetAddress: newFacetAddress,
                action: FacetCutAction.Add,
                functionSelectors: selectors
            });

            bytes memory diamondCut = abi.encodeWithSelector(IDiamondCut.diamondCut.selector, facetCut, address(0), "");
            
            batchFile.transactions[0] = Transaction({
                data: vm.toString(diamondCut),
                to: diamondAddress,
                value: 0
            });


        } else if (keccak256(abi.encode(diamondAction)) == keccak256(abi.encode("REPLACE"))) {
            FacetCut memory facetCut = FacetCut({
                facetAddress: newFacetAddress,
                action: FacetCutAction.Replace,
                functionSelectors: selectors
            });
            
            bytes memory diamondCut = abi.encodeWithSelector(IDiamondCut.diamondCut.selector, facetCut, address(0), "");

            batchFile.transactions[0] = Transaction({
                data: vm.toString(diamondCut),
                to: diamondAddress,
                value: 0
            });


        } else {
            revert("Invalid diamond action");
        }
   
        _serializeJSON(batchFile);
        _runPythonScript();
    }

    function getSelectors() internal returns(bytes4[] memory selectors){
        string[] memory getFacetAddressInput = new string[](3);
        getFacetAddressInput[0] = "python3";
        getFacetAddressInput[1] = "script/python/get_selectors.py";
        getFacetAddressInput[2] = facetToUpgrade;
        bytes memory res = vm.ffi(getFacetAddressInput);
        selectors = abi.decode(res, (bytes4[]));
    }

    function _serializeJSON(JsonBatchFile memory jsonBatchFile) internal {
        string memory mainObj = "mainObject";

        vm.serializeString(mainObj, "version", jsonBatchFile.version);
        vm.serializeString(mainObj, "chainId", jsonBatchFile.chainId);
        vm.serializeUint(mainObj, "createdAt", jsonBatchFile.createdAt);

        string memory fullMetaObj = "{";
        fullMetaObj = string(abi.encodePacked(fullMetaObj, "\"name\":\"", jsonBatchFile.meta.name, "\","));
        fullMetaObj = string(abi.encodePacked(fullMetaObj, "\"description\":\"", jsonBatchFile.meta.description, "\","));
        fullMetaObj = string(abi.encodePacked(fullMetaObj, "\"createdFromSafeAddress\":\"", jsonBatchFile.meta.createdFromSafeAddress, "\","));
        fullMetaObj = string(abi.encodePacked(fullMetaObj, "\"createdFromOwnerAddress\":\"", "", "\",")); // TODO: add owner address possibly? 
        fullMetaObj = string(abi.encodePacked(fullMetaObj, "\"txBuilderVersion\":\"", jsonBatchFile.meta.txBuilderVersion, "\","));
        fullMetaObj = string(abi.encodePacked(fullMetaObj, "\"checksum\":\"", vm.toString(keccak256(abi.encode(jsonBatchFile))), "\""));
        fullMetaObj = string(abi.encodePacked(fullMetaObj, "}"));



        vm.serializeString(mainObj, "meta", fullMetaObj);

        string[] memory transactionsJson = new string[](jsonBatchFile.transactions.length);
        for (uint256 i = 0; i < jsonBatchFile.transactions.length; i++) {
            string memory transactionObj = "{";
            transactionObj = string(abi.encodePacked(transactionObj, "\"data\":\"", jsonBatchFile.transactions[i].data, "\","));
            transactionObj = string(abi.encodePacked(transactionObj, "\"to\":\"", vm.toString(jsonBatchFile.transactions[i].to), "\","));
            transactionObj = string(abi.encodePacked(transactionObj, "\"value\":\"", vm.toString(jsonBatchFile.transactions[i].value), "\""));
            transactionObj = string(abi.encodePacked(transactionObj, "}"));
            transactionsJson[i] = transactionObj;
        }

        string memory finalJson = vm.serializeString(mainObj, "transactions", transactionsJson);

        
        vm.writeJson(finalJson, string.concat("./", jsonBatchFile.meta.name, ".json"));
    }

    function _runPythonScript() internal {
        string[] memory commandInput = new string[](3);
        commandInput[0] = "python3";
        commandInput[1] = "script/python/reorder_json.py";
        commandInput[2] = string.concat(name, ".json");
        vm.ffi(commandInput);
    }
}