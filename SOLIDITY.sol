// SPDX-License-Identifier: MIT
pragma solidity 0.8.18; // Specify the solidity version

/*
       REQUIREMENTS
    1. Your contract will have public variables that store the details about your coin (Token Name, Token Abbrv., Total Supply)
    2. Your contract will have a mapping of addresses to balances (address => uint)
    3. You will have a mint function that takes two parameters: an address and a value. 
       The function then increases the total supply by that number and increases the balance 
       of the “sender” address by that amount
    4. Your contract will have a burn function, which works the opposite of the mint function, as it will destroy tokens. 
       It will take an address and value just like the mint functions. It will then deduct the value from the total supply 
       and from the balance of the “sender”.
    5. Lastly, your burn function should have conditionals to make sure the balance of "sender" is greater than or equal 
       to the amount that is supposed to be burned.
*/
// Here we Define the Token contract
contract CustomToken {

    // public variables here
    string public tokenName = "CUSTO";
    string public tokenAbbrv = "CTO";
    uint public totalToken = 0 ;

    // mapping variable here
    // Mapping to store token balances
    mapping (address => uint) public wallets;

    // mint function
    // Function to mint new tokens
    // _address The address receiving the tokens
    // _val The amount of tokens to mint
    function mint ( address _address, uint _val) public {
       totalToken += _val;
       wallets[_address] += _val;
    }

    // burn function
    // Function to burn tokens
    // _address The address burning the tokens
    // _val The amount of tokens to burn
    function burn ( address _address, uint _val) public {
       if(wallets[_address] >= _val){
       totalToken -= _val;
       wallets[_address] -= _val;
       }else revert("User don't have enough token to burn");
    }

}
