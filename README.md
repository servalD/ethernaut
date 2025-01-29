# Forge Ethernaut

This repository is a Foundry (Forge) environment for solving the [Ethernaut](https://ethernaut.openzeppelin.com/) challenges.

## Installation

### Prerequisites
- [Foundry](https://book.getfoundry.sh/getting-started/installation) installed
- Git

### Clone the project
```sh
git clone git@github.com:servalD/ethernaut.git
cd ethernaut
forge install
```

### Install OpenZeppelin Contracts
```sh
forge install OpenZeppelin/openzeppelin-contracts
```

### Copy SafeMath.sol
OpenZeppelin no longer provides `SafeMath.sol` in its latest versions. To ensure compatibility with some Ethernaut challenges, manually copy the file:

```sh
cp deps/SafeMath.sol lib/openzeppelin-contracts/contracts/utils/math/SafeMath.sol
```

## Usage

### Compile the contracts
```sh
forge build
```

### Run tests
```sh
forge test
```

### Deploy a contract locally
```sh
forge script script/Deploy.s.sol --fork-url <RPC_URL> --broadcast
```

### Interact with Foundry Console
```sh
forge console --fork-url <RPC_URL>
```

## Resources
- [Foundry Documentation](https://book.getfoundry.sh/)
- [Ethernaut Challenges](https://ethernaut.openzeppelin.com/)
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)

## License
MIT
