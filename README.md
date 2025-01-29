# Forge Ethernaut

Ce repository est un environnement Foundry (Forge) pour résoudre les challenges [Ethernaut](https://ethernaut.openzeppelin.com/).

## Installation

### Prérequis
- [Foundry](https://book.getfoundry.sh/getting-started/installation) installé
- Git

### Cloner le projet
```sh
git clone git@github.com:servalD/ethernaut.git
cd ethernaut
forge install
```

### Installer OpenZeppelin Contracts
```sh
forge install OpenZeppelin/openzeppelin-contracts
```

### Copier SafeMath.sol
OpenZeppelin ne fournit plus `SafeMath.sol` dans ses dernières versions. Pour assurer la compatibilité avec certains challenges Ethernaut, copie manuellement le fichier :

```sh
cp deps/SafeMath.sol lib/openzeppelin-contracts/contracts/utils/math/SafeMath.sol
```

## Utilisation

### Compiler les contrats
```sh
forge build
```

### Lancer les tests
```sh
forge test
```

### Déployer un contrat en local
```sh
forge script script/Deploy.s.sol --fork-url <RPC_URL> --broadcast
```

### Interagir avec Foundry Console
```sh
forge console --fork-url <RPC_URL>
```

## Ressources
- [Documentation Foundry](https://book.getfoundry.sh/)
- [Challenges Ethernaut](https://ethernaut.openzeppelin.com/)
- [OpenZeppelin Contracts](https://github.com/OpenZeppelin/openzeppelin-contracts)

## Licence
MIT

