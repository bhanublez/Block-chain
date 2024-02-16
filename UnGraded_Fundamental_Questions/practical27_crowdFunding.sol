// Problem Statement 1: Crowdfunding Platform

// Objective: Create a contract named Crowdfunding that enables users to initiate fundraising campaigns for innovative projects. The contract should allow contributions from the community and enable campaign creators to withdraw the funds upon reaching their goals.

// Users should be able to create campaigns with a specific monetary goal.
// The community can contribute Ether to these campaigns.
// Campaign creators can withdraw contributions once the campaign goal is met.
// Implement safeguards to ensure only the creator can withdraw funds and only when the goal is achieved.

// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// This code is written by tusheet sir 
// I have just copied it from the class work and pasted it here. (Toh kuch galat hoga toh isme mai kuch nahi kar sakta.)

contract SimpleCrowdfunding {
    struct Campaign {
        address payable owner;
        uint goal;
        uint totalFunds;
    }

    uint public numCampaigns;

    mapping(uint => Campaign) public campaigns;

    function createCampaign(uint _goal) public {
        uint campaignId = numCampaigns++;

        campaigns[campaignId] = Campaign(payable(msg.sender), _goal, 0);// Idar msg.sender se address payable me convert karke store kiya hai.
    }

    function contribute(uint campaignId) public payable {
        Campaign storage campaign = campaigns[campaignId];

        campaign.totalFunds += msg.value;//msg.value me jo bhi amount hoga wo add ho jayega totalFunds me.
    }

    function withdrawFunds(uint campaignId) public {
        Campaign storage campaign = campaigns[campaignId];

        require(
            msg.sender == campaign.owner,
            "Only the campaign owner can withdraw funds."
        );

        require(campaign.totalFunds >= campaign.goal, "Goal not reached yet.");

        uint amount = campaign.totalFunds;

        campaign.totalFunds = 0; // Reset the fund to prevent re-entrancy attacks

        campaign.owner.transfer(amount);//amount ko owner ko transfer kiya hai.
    }
}
