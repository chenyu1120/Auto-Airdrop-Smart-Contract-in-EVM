# Auto Airdrop Smart Contract for EVM

This will show you how to build airdrop app with Node.js, Web3 and Solidity.

## Available Scripts

### How to install Packages

```
npm install
```

### How to deploy Smart Contracts

1. Testnet

```
truffle migrate --network testnet
```

2. Mainnet

```
truffle migrate --network mainnet
```

### How to verify Smart Contracts

1. Testnet

```
truffle run verify Token --network testnet
truffle run verify Airdrop [token contract address] --network testnet
```

2. Mainnet

```
truffle run verify Token --network mainnet
truffle run verify Airdrop [token contract address] --network mainnet
```

### Deployed Contracts

| Name               | Address                                           | Explorer                                                                        |
|--------------------|---------------------------------------------------|---------------------------------------------------------------------------------|
| Token         | 0xd8B76474e00AAac540D4d9EB0b828e303320E6E5        | https://testnet.bscscan.com/address/0xd8B76474e00AAac540D4d9EB0b828e303320E6E5 |
| Airdrop         | 0x21e52f9C3B97A2B87b7427F5E44909D02B59F462        | https://testnet.bscscan.com/address/0x21e52f9C3B97A2B87b7427F5E44909D02B59F462 |

### How to airdrop tokens

```
npm start
```

After you run this command, you will see the output like this;

```
From Airdrop 0x4CAB4b443192373D19ef95E8b52a44183b227B07
Airdrop started
Allocation + transfer was successful. 1862418 gas used. Spent: 18624180000000000 wei
Airdrop done.
```