// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
import "./IERC20.sol";

contract ERC20 is IERC20{
    uint256 public override totalSupply;
    
    //my mappings
    mapping(address => uint256) public override balanceOf;
    mapping(address => mapping(address => uint256)) public override allowance;

    //token configs.
    string public name = "Kizilkaya Token"; //my token name
    string public symbol = "BKToken"; //token symbol 
    uint8 public decimals = 18; //token decimal value. 

    //basic transfer method 
    function transfer(address recipient, uint256 amount) external override returns (bool) {
        balanceOf[msg.sender] -= amount; //decrease sender balance
        balanceOf[recipient] += amount; //increase recipient balance
        emit Transfer(msg.sender, recipient, amount); //broadcasting the Transfer event
        return true; 
    }

    function approve(address spender, uint256 amount) external override returns (bool) {
        allowance[msg.sender][spender] = amount;  //allowance sender
        emit Approval(msg.sender, spender, amount); //broadcasting Approval event
        return true;
    }

    function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external override returns (bool) {
        //decrease sender balance
        allowance[sender][msg.sender] -= amount; 
        balanceOf[sender] -= amount;   
        balanceOf[recipient] += amount; //increase recipient balance
        emit Transfer(sender, recipient, amount); //broadcasting Transfer event
        return true;
    }

    function mint(uint256 amount) external {
        balanceOf[msg.sender] += amount; //increase sender balance
        totalSupply += amount; //increase the totalSupply
        emit Transfer(address(0), msg.sender, amount); //broadcasting Transfer event
    }

    function burn(uint256 amount) external {
        balanceOf[msg.sender] -= amount; //decrease sender balance
        totalSupply -= amount; //decrease the totalSupply
        emit Transfer(msg.sender, address(0), amount); //broadcasting Transfer event
    }
    
 
}