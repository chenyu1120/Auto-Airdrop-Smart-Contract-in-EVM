// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";
import "./Token.sol";

contract Airdrop is Ownable {
    using SafeMath for uint;

    address public tokenAddr;

    event DropTokens(address indexed beneficiary, uint256 amount);
    event DropEther(address indexed beneficiary, uint256 amount);
    event Withdraw(address indexed owner, uint256 amount);

    constructor(address _tokenAddr) {
        tokenAddr = _tokenAddr;
    }

    function dropTokens(
        address[] memory _recipients,
        uint256[] memory _amount
    ) public onlyOwner returns (bool) {
        require(_recipients.length > 0, "Recipients required");
        require(
            _recipients.length == _amount.length,
            "Recipients and Amounts length mismatch"
        );

        for (uint i = 0; i < _recipients.length; i++) {
            require(_recipients[i] != address(0));

            Token(tokenAddr).transfer(_recipients[i], _amount[i]);

            emit DropTokens(_recipients[i], _amount[i]);
        }

        return true;
    }

    function dropEther(
        address[] memory _recipients,
        uint256[] memory _amount
    ) public payable onlyOwner returns (bool) {
        uint total = 0;

        for (uint j = 0; j < _amount.length; j++) {
            total = total.add(_amount[j]);
        }

        require(total <= msg.value, "Balance is not enough.");
        require(_recipients.length > 0, "Recipients required");
        require(
            _recipients.length == _amount.length,
            "Recipients and Amounts length mismatch"
        );

        for (uint i = 0; i < _recipients.length; i++) {
            require(_recipients[i] != address(0));

            payable(_recipients[i]).transfer(_amount[i]);

            emit DropEther(_recipients[i], _amount[i]);
        }

        return true;
    }

    function updateTokenAddress(address newTokenAddr) public onlyOwner {
        tokenAddr = newTokenAddr;
    }

    function withdrawTokens() public onlyOwner {
        uint256 balance = Token(tokenAddr).balanceOf(address(this));
        require(balance > 0, "Contract balance is 0");
        Token(tokenAddr).transfer(msg.sender, balance);

        emit Withdraw(msg.sender, balance);
    }

    function withdraw() public onlyOwner {
        uint256 balance = address(this).balance;
        require(balance > 0, "Contract balance is 0");
        (bool success, ) = msg.sender.call{value: balance}("");
        require(success, "Withdraw failed");

        emit Withdraw(msg.sender, balance);
    }
}
