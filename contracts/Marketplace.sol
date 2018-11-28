pragma solidity 0.4.25;


contract Marketplace {
    struct Asset {
        address owner;
        uint price;
    }

    mapping(bytes32 => Asset) public assets;

    // Returns the price of an asset
    function getPrice(bytes32 assetId) public view returns (uint) {
        Asset storage a = assets[assetId];
        return a.price;
    }

    // New asset creation and buy functions omitted for clarity
    // function addAsset(bytes32 assetId, uint price) public;
    // function buyAsset(bytes32 assetId) public payable;
}