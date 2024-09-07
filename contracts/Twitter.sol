// SPDX-License-Identifier: MIT

pragma solidity ^0.8.26;

contract Twitter{

    uint16 public MAX_TWEET_LENGTH = 200;
    struct Tweet{
        address author;
        string content;
        uint256 timestamp;
        uint likes;
        uint reach;
        uint comments;
    }

    address public owner =msg.sender;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    mapping(address => Tweet[]) public tweets;

    function changeTweetLength(uint16 newTweetLength) public {
        MAX_TWEET_LENGTH = newTweetLength;
    }

    function createTweet(string memory _tweet) public {

        require(bytes(_tweet).length <= MAX_TWEET_LENGTH, "Tweet cannot be that big bruh!! ");
        
        Tweet memory newTweet=Tweet({
            author: msg.sender,
            content: _tweet,
            timestamp: block.timestamp,
            likes: 0,
            reach: 0,
            comments: 0
        });

        tweets[msg.sender].push(newTweet);
    }

    function getTweet(uint _i) public view returns (Tweet memory) {
        return tweets[msg.sender][_i];
    }

    function getAllTweets(address _owner) public view returns (Tweet[] memory){
        return tweets[_owner];
    }
}