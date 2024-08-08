// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Twitter{

    uint8 constant MAX_TWEET_LENGTH = 200;
    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint likes;
        uint reach;
    }

    mapping(address => Tweet[]) public tweets;

    function createTweet(string memory _tweet) public {

        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet cannot be that big bruh!! ");
        Tweet memory newTweet=Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0,
            reach: 0

        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet(address _owner, uint _i) public view returns (Tweet memory) {
        return tweets[_owner][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory){
        return tweets[_owner];
    }
}