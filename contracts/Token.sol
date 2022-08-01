pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "./helpers/TransferHelpers.sol";

contract Token is Ownable, ERC20, AccessControl {
  bytes32 public minterRole = keccak256(abi.encode("MINTER_ROLE"));
  bytes32 public retrieverRole = keccak256(abi.encode("RETRIEVER_ROLE"));
  constructor(string memory name_, string memory symbol_, uint256 amount) Ownable() ERC20(name_, symbol_) {
    _grantRole(retrieverRole, _msgSender());
    _mint(_msgSender(), amount);
  }

  function mint(address to, uint256 amount) external {
    require(hasRole(minterRole, _msgSender()), 'only_minter');
    _mint(to, amount);
  }

  function burn(address to, uint256 amount) external {
    require(hasRole(minterRole, _msgSender()), 'only_minter');
    _burn(to, amount);
  }

  function retrieveEther(address to) external {
    require(hasRole(retrieverRole, _msgSender()), 'only_retriever');
    TransferHelpers._safeTransferEther(to, address(this).balance);
  }

  function retrieveERC20(address token, address to, uint256 amount) external {
    require(hasRole(retrieverRole, _msgSender()), 'only_retriever');
    TransferHelpers._safeTransferERC20(token, to, amount);
  } 
}