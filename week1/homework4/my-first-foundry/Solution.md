# Homework 4 - Foundry

2. Make a fork of mainnet from the command line (you may need to setup an Infura or Alchemy account)

   The template repo already shows how to use a fork of mainnet in tests. To run a fork locally we need to use
   [anvil](https://book.getfoundry.sh/anvil/) and interact with it using [cast](https://book.getfoundry.sh/anvil/)

   ```
   $ anvil -f https://eth-mainnet.g.alchemy.com/v2/<yourKey>
   ```

   This will initialize a local blockchain on port 8545, that we can interact with. By default it will use the latest
   block from the RPC provider, but we can also specify a block number by passing the `--fork-block-number` flag.

3. Query the mainnet using the command line to retrieve a property such as latest block number.

   Using our forked version of mainnet that is running locally, we can interact with it using `cast`. To get the latest
   block info run:

   ```
   $ cast block
   ```

   The specified block can be a block number, or any of the tags: `earliest`, `finalized`, `safe`, `latest` or
   `pending`. Default to latest.
