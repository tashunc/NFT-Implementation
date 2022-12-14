// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.9;


import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "./BaseContract.sol";

contract ERC20Token is ERC20, BaseContract {
    constructor(string memory name, string memory symbol, uint256 initialSupply) ERC20(name, symbol) {
        _mint(address(this), initialSupply * 10 ** decimals());
    }

    function mintExtraTokens(uint256 addingSupply) external onlyRole(ADMIN_ROLE) {
        _mint(msg.sender, addingSupply * 10 ** decimals());
    }

    function transferUserNewlyCreatedTokens(address _address, uint256 amount) external onlyRole(ADMIN_ROLE) {
        _mint(msg.sender, amount * 10 ** decimals());
        _transfer(msg.sender, _address, amount * 10 ** decimals());
    }


}
