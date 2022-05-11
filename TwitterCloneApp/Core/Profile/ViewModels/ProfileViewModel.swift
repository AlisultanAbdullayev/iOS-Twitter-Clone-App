//
//  ProfileViewModel.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 11.05.2022.
//

import Foundation


class ProfileViewModel: ObservableObject {
    
    @Published var tweets = [Tweet]()
    @Published var likedTweets = [Tweet]()
    private let userService = UserService()
    private let service = TweetService()
    let user: User
    var actionButtonTitle: String {
        return user.isCurrentUser ? "Edit Profile" : "Follow"
    }
    
    init(user: User) {
        self.user = user
        fetchUserTweet()
        fetchLikedTweets()
    }
    
    func tweets(filter: TweetFilterViewModel) -> [Tweet] {
        switch filter {
            case .tweets:
                return tweets
            case .replies:
                return tweets
            case .likes:
                return likedTweets
        }
    }
    
    func fetchUserTweet() {
        guard let uid = user.id else { return }
        service.fetchTweetsWithUid(uid: uid) { [weak self] tweets in
            self?.tweets = tweets
            
            for i in 0 ..< tweets.count {
                self?.tweets[i].user = self?.user
            }
        }
    }
    
    func fetchLikedTweets() {
        guard let uid = user.id else { return }
        service.fetchLikedTweets(uid: uid) { [weak self] tweets in
            self?.likedTweets = tweets
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                self?.userService.fetchUser(uid: uid, completion: { [weak self] user in
                    self?.likedTweets[i].user = user
                })
            }
        }
    }
    
}
