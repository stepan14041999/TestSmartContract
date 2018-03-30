pragma solidity ^0.4.18;

import "./SafeMath.sol";

contract Storage {
    using SafeMath for uint256;
    
    struct Transfer {
        address sender;
        address taker;
        uint256 amount;
    }
    
    Transfer[] public transfers;
    
    //DO NOT TOUCH PLEASE
    function transferTo(address _from, address _to, uint256 _amount) public {
        transfers.push(Transfer({
                sender: _from,
                taker: _to,
                amount: _amount
            }));
    }
    
    function offer(address _owner, address _to, bool _interrupted) public returns(uint256) {
        if(_interrupted){
            for(uint index = 0; index < transfers.length; index++){
                if(transfers[index].sender == _owner && transfers[index].taker == _to){
                    uint256 _amount = transfers[index].amount;
                    delete transfers[index];
                    return _amount;
                }
            }
        } else {
            for(index = 0; index < transfers.length; index++){
                if(transfers[index].taker == _to){
                    _amount = transfers[index].amount;
                    delete transfers[index];
                    return _amount;
                }
            }
        }
    }

}
