pragma solidity ^0.4.18;

import "./Storage.sol";
import "./SafeMath.sol";

contract Interface {
    using SafeMath for uint256;
    
    Storage store = new Storage();
    
    function transferTo(address _to) payable public returns(uint256) {
        store.transferTo(msg.sender, _to, msg.value);
        return msg.value;
    }
    
    function offer() public returns (uint256) {
        uint256 _amount = store.offer(0, msg.sender, false);
        msg.sender.transfer(_amount);
        return _amount;
    }
    
    function takeAway(address _to) public returns(uint256){
        uint256 _amount = store.offer(msg.sender, _to, true);
        return _amount;
    }
    
}
