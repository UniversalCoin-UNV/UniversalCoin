
pragma solidity ^0.4.18;

import './Ownable.sol';
import './UniversalCoin.sol';

contract UCDistributor is Ownable {

    UniversalCoin dc;

    function setContractAddress(address _t) onlyOwner public {
        dc = UniversalCoin(_t);
    }

    function distributeTokens (address[] address, uint256[] amounts)
    onlyOwner
    public returns (uint256) {
        require(address.length == amounts.length);
        uint256 i = 0;
        while (i < dests.length) {
           dc.transferFrom(msg.sender, dests[i], amounts[i]);
           i += 1;
        }
        return(i);
    }
}
