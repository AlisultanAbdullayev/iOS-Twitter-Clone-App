//
//  TweetFilterViewModel.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 28.04.2022.
//

import Foundation


enum TweetFilterViewModel: Int, CaseIterable {
    
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
            case .tweets: return "Tweets"
            case .replies: return "Replies"
            case .likes: return "Likes"
        }
    }
    
}
