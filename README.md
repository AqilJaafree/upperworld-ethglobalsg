This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Upperworld: Cross-Chain Pokémon-Style Adventure
Project Description:

Upperworld is an innovative, on-chain multiplayer game that brings the beloved Pokémon concept into the world of blockchain technology. Players can catch, battle, and earn across different networks, creating a truly decentralized gaming experience.

Rootstock Integration
We integrated Rootstock by deploying our core game contracts (Pokemon, PikaCoin, and PokemonBattle) on the Rootstock testnet. This allows us to leverage Bitcoin's robust security model while enabling complex game logic and NFT interactions. The main Pokemon contract is deployed at 0xA7D5FcEb3e860618336753c19b668b2fA76Be47E.

```
https://rootstock.blockscout.com/address/0xA7D5FcEb3e860618336753c19b668b2fA76Be47E
```

Key benefits of using Rootstock:

Bitcoin Network Security
Smart Contract Functionality
Low Transaction Costs
Growing Ecosystem


To test the Upperworld integration with Rootstock:

Connect to the Rootstock testnet in your Web3 wallet (e.g., MetaMask).
Interact with the Pokemon contract at 0xA7D5FcEb3e860618336753c19b668b2fA76Be47E:

Call the safeMint function to create a new Pokemon NFT.
Use getPokemonStats to view the randomly generated stats of your Pokemon.


(Once deployed) Interact with the PokemonBattle contract to initiate battles.
Check your wallet for PIKA tokens received as rewards after battles.


First, run the development server:

```bash
npm run dev
# or
yarn dev
# or
pnpm dev
# or
bun dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `pages/index.js`. The page auto-updates as you edit the file.

[API routes](https://nextjs.org/docs/api-routes/introduction) can be accessed on [http://localhost:3000/api/hello](http://localhost:3000/api/hello). This endpoint can be edited in `pages/api/hello.js`.

The `pages/api` directory is mapped to `/api/*`. Files in this directory are treated as [API routes](https://nextjs.org/docs/api-routes/introduction) instead of React pages.

This project uses [`next/font`](https://nextjs.org/docs/basic-features/font-optimization) to automatically optimize and load Inter, a custom Google Font.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.
