# ND1309 C2 Ethereum Smart Contracts, Tokens and Dapps - Project Starter 
**PROJECT: Decentralized Star Notary Service Project** - For this project, you will create a DApp by adding functionality with your smart contract and deploy it on the public testnet.

### ToDo

- ✅ Task 1
  - Added Contract Name and Symbol.
  - Added `lookUptokenIdToStarInfo` function to contract.
  - Added `exchangeStars` function to contract.
  - Added `transferStar` function to contract.
- ✅ Task 2
  - Added test to verify contract name and symbol.
  - Added test to verify `lookUptokenIdToStarInfo` function in contract.
  - Added test to verify `exchangeStars` function in contract.
  - Added test to verify `transferStar` function in contract.
- ✅ Task 3
  - Added goerli and sepolia configurations to access the testnet via Infura.
  - Deployed StarNotary contract to both local and testnet networks.
- ✅ Task 4
  - Modified the frontend to lookup a star using the contract function `lookUptokenIdToStarInfo` deployed on the network.


### Deployed Contract Address and Network, [StarNotary Contract](https://sepolia.etherscan.io/address/0x0718dCdFa9D6CE54F159a7fb5A9BD0D061F1CD9f)

```
Network:  Sepolia
EtherScan Address: https://sepolia.etherscan.io/address/0x0718dCdFa9D6CE54F159a7fb5A9BD0D061F1CD9f
Contract Address: 0x0718dCdFa9D6CE54F159a7fb5A9BD0D061F1CD9f
```


### Dependencies
For this project, you will need to have:
1. **Node and NPM** installed - NPM is distributed with [Node.js](https://www.npmjs.com/get-npm)
```bash
# Check Node version
node -v
# Check NPM version
npm -v
```


2. **Truffle v5.X.X** - A development framework for Ethereum. 
```bash
# Unsinstall any previous version
npm uninstall -g truffle
# Install
npm install -g truffle
# Specify a particular version
npm install -g truffle@5.7.6
# Verify the version
truffle version
```


2. **Metamask: 5.3.1** - If you need to update Metamask just delete your Metamask extension and install it again.


3. [Ganache](https://www.trufflesuite.com/ganache) - Make sure that your Ganache and Truffle configuration file have the same port.


4. **Other mandatory packages**:
```bash
# install packages
npm install --save  @openzeppelin/contract@4.8.2
npm install --save  @truffle/hdwallet-provider@2.1.8
npm install webpack-dev-server -g
npm install web3
```


### Run the application
1. Clean the frontend 
```bash
cd app
# Remove the node_modules  
# remove packages
rm -rf node_modules
# clean cache
npm cache clean
rm package-lock.json
# initialize npm (you can accept defaults)
npm init
# install all modules listed as dependencies in package.json
npm install
```


2. Start Truffle by running
```bash
# For starting the development console
truffle develop
# truffle console

# For compiling the contract, inside the development console, run:
compile

# For migrating the contract to the locally running Ethereum network, inside the development console
migrate --reset

# For running unit tests the contract, inside the development console, run:
test
```

3. Frontend - Once you are ready to start your frontend, run the following from the app folder:
```bash
cd app
npm run dev
```

---

### Important
When you will add a new Rinkeyby Test Network in your Metamask client, you will have to provide:

| Network Name | New RPC URL | Chain ID |
|---|---|---|
|Private Network 1|`http://127.0.0.1:9545/`|1337 |
|Ganache GUI Network|`http://127.0.0.1:7545/`|5777 |
|Sepolia |`https://sepolia.infura.io/v3/${PROJECT_ID}`|11155111 |

The chain ID above can be fetched by:
```bash
cd app
node index.js
```

## Troubleshoot
#### Error 1 
```
'webpack-dev-server' is not recognized as an internal or external command
```
**Solution:**
- Delete the node_modules folder, the one within the /app folder
- Execute `npm install` command from the /app folder

After a long install, everything will work just fine!


#### Error 2
```
ParserError: Source file requires different compiler version. 
Error: Truffle is currently using solc 0.5.16, but one or more of your contracts specify "pragma solidity >=0.X.X <0.X.X".
```
**Solution:** In such a case, ensure the following in `truffle-config.js`:
```js
// Configure your compilers  
compilers: {    
  solc: {      
    version: "0.5.16", // <- Use this        
    // docker: true,
    // ...
```

## Raise a PR or report an Issue
1. Feel free to raise a [Pull Request](https://github.com/udacity/nd1309-p2-Decentralized-Star-Notary-Service-Starter-Code/pulls) if you find a bug/scope of improvement in the current repository. 

2. If you have suggestions or facing issues, you can log in issue. 

---

Do not use the [Old depreacted zipped starter code](https://s3.amazonaws.com/video.udacity-data.com/topher/2019/January/5c51c4c0_project-5-starter-code/project-5-starter-code.zip)
