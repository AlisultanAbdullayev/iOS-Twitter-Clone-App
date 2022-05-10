//
//  User.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 7.05.2022.
//

import FirebaseFirestoreSwift
import Foundation


struct User: Identifiable, Decodable {
    @DocumentID var id: String?
    let username: String
    let fullName: String
    let profileImageUrl: String
    let email: String
}
