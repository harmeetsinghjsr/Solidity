// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Twitter{

    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint likes;
    }

    mapping(address => string[]) public tweets;

    function createTweet(string memory _tweet) public {
        tweets[msg.sender].push(_tweet);
    }

    function getTweet(address _owner, uint _i) public view returns (string memory) {
        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner) public view returns (string[] memory){
        return tweets[_owner];
    }

    
}