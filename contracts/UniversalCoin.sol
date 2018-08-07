pragma solidity ^0.4.18;

import "./BaseToken.sol";
import "./ERC223Interface.sol";
import "./ERC223ReceivingContract.sol";

contract UniversalCoin is ERC223Interface, BaseToken {
  // Publicly listed name
    string public name = "UNIVERSAL COIN";
  // Symbol under which token will be trading
    string public symbol = "UNV";
  // 1 ETH consists of 10^18 Wei, which is the smallest ETH unit
  //   uint8 public decimals = 18;
  // Defining the value of a million for easy calculations - order of declaration matters (hoisting)
  //   uint256 million = 1000000 * (10 ** uint256(decimals));
  // We are offering a total of 100 Million Ulcoin Tokens to distribute
    uint256 public totalSupply = 40000 * 1000000 * 10**18;
  // Address where all the tokens are held, as tokens aren't held within the Smart Contract
    address public masterWallet;

  // constructor function
    constructor(string _symbol, string _name) public {
    // The wallet from which the contract is deployed, also the owner of the contract
        owner = msg.sender;
        masterWallet = owner;


    // Assign total supply to master wallet
    // https://github.com/OpenZeppelin/zeppelin-solidity/issues/494
    // A token contract which creates new tokens SHOULD trigger a Transfer event with the _from address set to 0x0 when tokens are created.
        balances[masterWallet] = totalSupply;
        emit Transfer(0x0, masterWallet, totalSupply);
    }
}
