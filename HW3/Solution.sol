// SPDX-License-Identifier: None

pragma solidity 0.8.17;

contract BootcampContract {

    uint256 number;

    // Adding variable owner to store deployer of the contract as per request 1.
    address owner;

    address BURN_ADDRESS = 0x000000000000000000000000000000000000dEaD;

    // Updating variable when contract is deployed as per 2.
    constructor () {
        owner = msg.sender;
    }


    function store(uint256 num) public {
        number = num;
    }


    function retrieve() public view returns (uint256){
        return number;
    }

    function retrieveAddress() public view returns (address) {
        if (msg.sender == owner) {
            return BURN_ADDRESS;
        } else {
            return owner;
        }
    }
}