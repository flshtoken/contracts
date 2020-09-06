pragma solidity ^0.6.12;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/math/SafeMath.sol";

contract Token is ERC20 {
  using SafeMath for uint;
  address public admin;
  uint public maxTotalSupply;

  constructor(
    string memory name, 
    string memory symbol,
    uint _maxTotalSupply
  ) public ERC20("Nacho Finance", "NACHOS") {
    admin = msg.sender;
    maxTotalSupply = _maxTotalSupply;
  }

  function updateAdmin(address newAdmin) public {
    require(msg.sender == admin, 'only admin');
    admin = newAdmin;
  }

  function mint(address account, uint256 amount) public {
    require(msg.sender == admin, 'only admin');
    uint totalSupply = totalSupply();
    require(
      totalSupply.add(amount) <= maxTotalSupply, 
      'above maxTotalSupply limit'
    );
    _mint(msg.sender,700000000);
    _setupDecimals(2);
  }
}
