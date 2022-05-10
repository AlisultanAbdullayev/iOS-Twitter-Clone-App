//
//  FeedViewModel.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 10.05.2022.
//

import Foundation


class FeedViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    
    init() {
        fetchTweets()
    }
    
    func fetchTweets() {
        
        service.fetchTweets { [weak self] tweets in
            
            self?.tweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                self?.userService.fetchUser(uid: uid, completion: { [weak self] user in
                    self?.tweets[i].user = user
                })
            }
            
        }
        
    }
    
}
