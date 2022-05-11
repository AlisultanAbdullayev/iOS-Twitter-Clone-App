//
//  TweetRowViewModel.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 11.05.2022.
//

import Foundation


class TweetRowViewModel: ObservableObject {
    
    private let service = TweetService()
    @Published var tweet: Tweet
    
    init(tweet: Tweet) {
        self.tweet = tweet
        checkIfUserLikedTweet()
    }
    
    func likeTweet() {
        service.likeTweet(tweet: tweet) { [weak self] in
            self?.tweet.didLike = true
        }
    }
    
    func unlikeTweet() {
        service.unlikeTweet(tweet: tweet) { [weak self] in
            self?.tweet.didLike = false
        }
    }
    
    func checkIfUserLikedTweet() {
        service.checkIfUserLikeTweet(tweet: tweet) { [weak self] didLike in
            if didLike {
                self?.tweet.didLike = true
            }
        }
    }
    

}
