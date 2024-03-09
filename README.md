## Token Template [ ERC 20 foundry]

**TOKEN ERC 20 with max supply**



## Test net explorer
https://sepolia-optimism.etherscan.io/

## Faucet
https://app.optimism.io/faucet


## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>

### Deploy  Cmd 
forge create --rpc-url $SEPOLIA_RPC_URL \\ 
    --constructor-args "NAME TOKEN" "SYMBOL" <SUPPLY>  <ACCOUNT> \\
    --private-key 0x src/TokenTemplate.sol:TokenTemplate \\
    --etherscan-api-key key \\
    --verify


### Deploy Script 

- To load the variables in the .env file

source .env

- To deploy and verify our contract
forge script script/DeployToken.s.sol:TokenDeployScript --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv

```

### Mint  
```
forge script script/MintToken.s.sol:TokenMintScript --rpc-url $SEPOLIA_RPC_URL --broadcast  -vvvv


## localhost 

forge script script/MintToken.s.sol:TokenMintScript --rpc-url http://localhost:8545  --broadcast  -vvvv
https://sepolia-optimism.etherscan.io/

```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

## Foundry

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

