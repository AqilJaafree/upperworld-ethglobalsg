// This setup uses Hardhat Ignition to manage smart contract deployments.
// Learn more about it at https://hardhat.org/ignition

const { buildModule } = require("@nomicfoundation/hardhat-ignition/modules");

module.exports = buildModule("BattleModule", (m) => {
    // Parameters for deployment
    const initialOwner = m.getParameter("initialOwner", 0x1AB67c4ac117F3c850D5A93784B7701Cc5816387); // Replace with your address
    const mailboxAddress = m.getParameter("mailboxAddress", 0x0841cc36F34Ce1E43FFd9ECe28318A9C9f5D7370); // Replace with Hyperlane Mailbox address

    // Deploy PikaCoin contract
    const pikaCoin = m.contract("PikaCoin", [initialOwner]);

    // Deploy Pokemon contract
    const pokemon = m.contract("Pokemon", [initialOwner, mailboxAddress]);

    // Deploy PokemonBattle contract
    const battle = m.contract("PokemonBattle", [pokemon, pikaCoin, mailboxAddress]);

    return { pikaCoin, pokemon, battle };
});

