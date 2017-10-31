ICO Playground
=============

Scripts and example smart contracts for testing the waters with solidity/ethereum.

Quickstart for populus here: http://populus.readthedocs.io/en/latest/quickstart.html

## Installation on Mac OSX

```
./setup.sh
```

To point to correct populus, run:

```
$(eval ./env.sh)
```

Alternivaly, add python3 bin path to bashrc:

```
./env.sh >> ~/.bashrc
```

## Geth Node

In order to deploy contracts, a geth node needs to be running. A docker-compose.yml for Geth is in the geth-node/ directory.

This node is configured to use the dev network, and internal network with no need for peers.

```
cd geth-node/ && docker-compose up
```

# Using the Greeter contract

1. Ensure the geth node is running
2. Deploy contract: `populus deploy`
3. Run greeter: `python3 greeter.py`
