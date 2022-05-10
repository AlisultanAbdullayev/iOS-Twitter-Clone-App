//
//  UploadTweetViewModel.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 10.05.2022.
//

import Foundation
import SwiftUI


class UploadTweetViewModel: ObservableObject {
    
    @Published var didUploadTweet = false
    let service = TweetService()
    
    func uploadTweet(caption: String) {
        service.uploadTweet(caption: caption) { [weak self] success in
            if success {
                self?.didUploadTweet = true
            } else {
                //
            }
        }
    }
    
}
