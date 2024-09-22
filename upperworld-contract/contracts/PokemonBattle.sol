// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.20;

import "./Pokemon.sol";
import "./PikaCoin.sol";
import "@hyperlane-xyz/core/contracts/interfaces/IMailbox.sol";
import "@hyperlane-xyz/core/contracts/interfaces/IMessageRecipient.sol";

contract PokemonBattle is IMessageRecipient {
    Pokemon public pokemonContract;
    PikaCoin public pikaCoin;
    IMailbox public immutable mailbox;

    event BattleResult(uint256 winner, uint256 loser, uint256 reward);

    constructor(
        address _pokemonAddress, 
        address _pikaCoinAddress, 
        address _mailbox
    ) {
        pokemonContract = Pokemon(_pokemonAddress);
        pikaCoin = PikaCoin(_pikaCoinAddress);
        mailbox = IMailbox(_mailbox);
    }

    function battle(uint256 playerOnePokemonId, uint256 playerTwoPokemonId) public {
        require(pokemonContract.ownerOf(playerOnePokemonId) == msg.sender, "You must own the first Pokemon");
        require(pokemonContract.ownerOf(playerTwoPokemonId) != msg.sender, "You can't battle your own Pokemon");

        Pokemon.PokemonStats memory statsOne = pokemonContract.getPokemonStats(playerOnePokemonId);
        Pokemon.PokemonStats memory statsTwo = pokemonContract.getPokemonStats(playerTwoPokemonId);

        uint256 powerOne = statsOne.strength + statsOne.speed + statsOne.health;
        uint256 powerTwo = statsTwo.strength + statsTwo.speed + statsTwo.health;

        uint256 reward = 100 * 10**18; // 100 PIKA tokens

        if (powerOne > powerTwo) {
            pikaCoin.mint(msg.sender, reward);
            emit BattleResult(playerOnePokemonId, playerTwoPokemonId, reward);

            // Send battle result cross-chain
            bytes memory message = abi.encode(playerOnePokemonId, playerTwoPokemonId, reward);
            mailbox.dispatch(uint32(1), bytes32(uint256(uint160(address(this)))), message);
        } else if (powerTwo > powerOne) {
            pikaCoin.mint(pokemonContract.ownerOf(playerTwoPokemonId), reward);
            emit BattleResult(playerTwoPokemonId, playerOnePokemonId, reward);

            // Send battle result cross-chain
            bytes memory message = abi.encode(playerTwoPokemonId, playerOnePokemonId, reward);
            mailbox.dispatch(uint32(1), bytes32(uint256(uint160(address(this)))), message);
        } else {
            uint256 halfReward = reward / 2;
            pikaCoin.mint(msg.sender, halfReward);
            pikaCoin.mint(pokemonContract.ownerOf(playerTwoPokemonId), halfReward);
            emit BattleResult(0, 0, halfReward); // 0 indicates a tie
        }
    }

    function handle(
        uint32 _origin,
        bytes32 _sender,
        bytes calldata _message
    ) external override payable {
        require(msg.sender == address(mailbox), "PokemonBattle: only mailbox can call handle");
        // Handle incoming battle result message from other chain
        // You can implement the logic to process the incoming message here
    }
}