pragma solidity ^0.8.7;

contract Token {
    string public name = 'Hardhat Token';
    string public symbol = 'MHT';

    //Number of tokens available 
    uint public totalSupply = 100; 
    //Stores ethereum user addresses
    address public owner; 
    // Key/Value mapping for account balances 
    mapping(address => uint256) balance; 

    //Contract initializer (constructor)
    constructor() {
        balance[msg.sender] = totalSupply; 
        owner = msg.sender;
    }

    //Function to transfer token between users 
    function transfer(address to, uint256 amount) external { 
        //Check if the sender has enough tokens 
        require(balance[msg.sender] >= amount, "Not enough tokens!");
        balance[msg.sender] -= amount; 
        balance[to] += amount; 
    }

    //Function to get the current token balances of an account 
    function balanceOf(address account) external view returns (uint256) {
        return balance[account];
    }
}
