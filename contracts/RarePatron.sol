pragma solidity 0.4.25;

import "openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol";
import "openzeppelin-solidity/contracts/token/ERC721/ERC721MetadataMintable.sol";


contract RarePatron is ERC721Full, ERC721MetadataMintable {
    constructor (string name, string symbol) public ERC721Full(name, symbol) {}
}