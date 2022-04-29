// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "./XpToken.sol";

contract Staking1 is  ERC20Burnable , Ownable  , XpToken {
 
    address[] internal stakeholders;

    function isStakeholder(address _address) public view returns (bool, uint256){
        for (uint256 i = 0; i < stakeholders.length; i++) {
            if (_address == stakeholders[i]) return (true, i);
        }
        return (false, 0);
    }

    function addStakeholder(address _stakeholder) public {
        (bool _isStakeholder, ) = isStakeholder(_stakeholder);
        if (!_isStakeholder) stakeholders.push(_stakeholder);
    }

    function removeStakeholder(address _stakeholder) public {
        (bool _isStakeholder, uint256 s) = isStakeholder(_stakeholder);
        if (_isStakeholder) {
            stakeholders[s] = stakeholders[stakeholders.length - 1];
            stakeholders.pop();
        }
    }

    mapping(address => uint256) internal stakes;

    function stakeOf(address _stakeholder) public view returns (uint256) {
        return stakes[_stakeholder];
    }

    function createStake(uint256 _stake) public {
        burn(_stake);
        if (stakes[msg.sender] == 0) addStakeholder(msg.sender);
        stakes[msg.sender] = stakes[msg.sender] + _stake;
    }

    function removeStake(uint256 _stake) public {
        stakes[msg.sender] = stakes[msg.sender] - _stake;
        if (stakes[msg.sender] == 0) removeStakeholder(msg.sender);
        transfer(msg.sender, _stake);
    }

    mapping(address => uint256) internal rewards;

    function rewardOf(address _stakeholder) public view returns (uint256) {
        return rewards[_stakeholder];
    }

    function totalRewards() public view returns (uint256) {
        uint256 _totalRewards = 0;
        for (uint256 s = 0; s < stakeholders.length; s += 1) {
            _totalRewards = _totalRewards + rewards[stakeholders[s]];
        }
        return _totalRewards;
    }

    function calculateReward(address _stakeholder)
        public
        view
        returns (uint256)
    {
        return (stakes[_stakeholder] / 100) * 10;
    }

    function withdrawReward() public {
        uint256 reward = rewards[msg.sender];
        rewards[msg.sender] = 0;
        transfer(msg.sender, reward);
    }
}
