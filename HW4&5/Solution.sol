//SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract VolcanoCoin is Ownable {

    uint256 totalSupply = 10000;
    //address owner;
    mapping (address => uint256) public balances;

    struct Payment {
        address receiver;
        uint256 numTokens;
    }

    mapping (address => Payment[]) sentPayments;

    constructor () {
        //owner = msg.sender;
        balances[msg.sender] = balances[msg.sender] + totalSupply;
    }

    function getTotalSupply() public view returns (uint256) {
        return totalSupply;
    }

    function increaseTotalSupply() public onlyOwner {
        totalSupply = totalSupply + 1000;
        emit supplyChange(totalSupply);
    }

    event Transfer(address, uint256);

    function transferTokens(address receiver, uint256 numTokens) public {
        require(numTokens <= balances[msg.sender]);
	    balances[msg.sender] = balances[msg.sender]-numTokens;
	    balances[receiver] = balances[receiver]+numTokens;
        emit Transfer(receiver, numTokens);
  }

    function getBalances(address _wallet) public view returns (uint256) {
        return balances[_wallet];
    }

    event supplyChange (uint256);

    // modifier restricted {
    //     require(msg.sender == owner);
    //     _;
    // }
}
