//
//  Tweet.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 10.05.2022.
//

import Foundation
import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    let uid: String
    var likes: Int
    var user: User?
}
