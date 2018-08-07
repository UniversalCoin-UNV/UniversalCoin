
pragma solidity ^0.4.18;

import './Ownable.sol';
import './UniversalCoin.sol';

contract UCDistributor is Ownable {

    UniversalCoin dc;

    function setContractAddress(address _t) onlyOwner public {
        dc = UniversalCoin(_t);
    }

    function distributeTokens (address[] dests, uint256 amount)
    onlyOwner
    public returns (uint256) {
        uint256 i = 0;
        while (i < dests.length) {
           dc.transferFrom(msg.sender, dests[i], amount);
           i += 1;
        }
        return(i);
    }
}
