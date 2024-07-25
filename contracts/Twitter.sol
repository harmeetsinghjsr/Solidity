// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Twitter{
    mapping(address => string) public tweets;

    function createTweet(string memory _tweet) public {
        tweets[msg.sender] = _tweet;
    }
}