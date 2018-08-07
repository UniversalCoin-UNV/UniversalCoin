pragma solidity 0.4.24;

contract ERC223ReceivingContract {
    function tokenFallback(address from, uint value, bytes data) public;
}
