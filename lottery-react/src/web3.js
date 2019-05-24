import Web3 from 'web3';
let web3;
async function activateMetamask() {
    web3 = new Web3(window.ethereum);

    await window.ethereum.enable();
}

activateMetamask();

export default web3;