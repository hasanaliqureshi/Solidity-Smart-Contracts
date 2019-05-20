const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const {interface, bytecode} = require('./compile');

const provider = new HDWalletProvider(
    'believe champion purchase drive swim rather kid transfer notice sketch example limb',
    'https://rinkeby.infura.io/v3/f419cd93253446cdb48321bcc960e227'
);

const web3 = new Web3(provider);

const deploy = async () => {
    const accounts = await web3.eth.getAccounts();
    console.log("deploy from ", accounts[0]);

    const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({ data : bytecode})
    .send({ gas : '1000000', from : accounts[0]});

    console.log('Contract deployed to', result.options.address);
};
deploy();

// deploy from  0xea903f4B8Cd4aa11897A164E046DfcadfE72dE00
// Contract deployed to 0x148f9af7E497ABF582c550A043Fa71a308A6D0Bf
