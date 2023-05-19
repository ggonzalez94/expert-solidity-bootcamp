# Homework 1

1. Why is client diversity important for Ethereum?  
   Client diversity is extremely important for the health of Ethereum because it helps avoid that bugs present
   on one client implementation have a significant impact on the network. Imagine if for example GETH has an unexpected bug, but Nethermind and Erigon don't the network can keep operating if GETH doesn't have a majority share of the network.
   Clients are developed by independent teams, often using different programming languages.The ideal goal is to achieve diversity without any client dominating the network, thereby eliminating a potential single point of failure.
   In the case of consensus clients, if there's a bug on a client with more than 33% of the network it can stop the chain from finalizing, and even worst if it has more than 66% it can cause the chain to incorrectly split and finalize.
   You can check client distribution [here](https://clientdiversity.org/) and read more why client diversity is important for the health of Ethereum [here](https://ethereum.org/en/developers/docs/nodes-and-clients/client-diversity/).
2. Where is the full Ethereum state held?
   The full state is stored on nodes that run client software. Each node maintains a copy of the state and updates it with new transactions and blocks as they are added to the chain. Nodes don't submit the entire state on-chain as that would be incredibly expensive and unnecesary, only root nodes of certain Merkle Patricia Trees are submit on-chain.
3. What is a replay attack ? , which 2 pieces of information can prevent it ?
   A replay attack is when an attacker tries to reuse a valid transaction and send it to the network again. The 2 pieces that prevent agains this are:
    - Nonce: Is a sequencial identifier part of every transaction. The network will reject a transaction with a nonce it has seen before. This prevents agains replay attacks in the same network.
    - ChainId: The nonce is not enough when a chain has a hard fork, as transactions from one chain could be copied to another and they will be valid. That's why EIP-155 introduced chainId as part of transactions for EVM networks.
4. In a contract, how do we know who called a view function?
   You cannot determine who called a view function, since they don't involve transaction execution and are not committed on-chain. Calls to view functions are served directly by the node you are connected to
