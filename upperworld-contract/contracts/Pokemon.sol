// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@hyperlane-xyz/core/contracts/interfaces/IMailbox.sol";
import "@hyperlane-xyz/core/contracts/interfaces/IMessageRecipient.sol";

contract Pokemon is ERC721, ERC721Burnable, IMessageRecipient {
    uint256 private _nextTokenId;
    address private _owner;
    IMailbox public immutable mailbox;

    struct PokemonStats {
        uint256 strength;
        uint256 speed;
        uint256 health;
    }

    mapping(uint256 => PokemonStats) public pokemonStats;

    event PokemonMinted(uint256 tokenId, address owner);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(owner() == _msgSender(), "Ownable: caller is not the owner");
        _;
    }

    constructor(address initialOwner, address _mailbox)
        ERC721("Pokemon", "POKE")
    {
        mailbox = IMailbox(_mailbox);
        _transferOwnership(initialOwner);
    }

    function owner() public view returns (address) {
        return _owner;
    }

    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "Ownable: new owner is the zero address");
        _transferOwnership(newOwner);
    }

    function _transferOwnership(address newOwner) internal {
        address oldOwner = _owner;
        _owner = newOwner;
        emit OwnershipTransferred(oldOwner, newOwner);
    }

    function safeMint(address to) public onlyOwner returns (uint256) {
        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        _setPokemonStats(tokenId);
        emit PokemonMinted(tokenId, to);
        return tokenId;
    }

    function _setPokemonStats(uint256 tokenId) internal {
        uint256 rand = uint256(keccak256(abi.encodePacked(
            block.timestamp, 
            block.number, 
            msg.sender, 
            tokenId
        )));
        pokemonStats[tokenId] = PokemonStats({
            strength: (rand % 50) + 50,
            speed: ((rand >> 50) % 50) + 50,
            health: ((rand >> 100) % 100) + 100
        });
    }

    function getPokemonStats(uint256 tokenId) public view returns (PokemonStats memory) {
        require(_exists(tokenId), "Pokemon does not exist");
        return pokemonStats[tokenId];
    }

    function handle(
        uint32 _origin,
        bytes32 _sender,
        bytes calldata _message
    ) external override payable {
        require(msg.sender == address(mailbox), "Pokemon: only mailbox can call handle");
        // Handle cross-chain battle result or stats update
    }

    function dispatch(
        uint32 _destination,
        bytes32 _recipient,
        bytes memory _message
    ) external onlyOwner returns (bytes32) {
        return mailbox.dispatch(_destination, _recipient, _message);
    }
}