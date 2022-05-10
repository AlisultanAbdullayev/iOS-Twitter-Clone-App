//
//  PreviewProvider.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 7.05.2022.
//

import Foundation
import SwiftUI
import Firebase


extension PreviewProvider {
    
    static var dev: DeveloperPreview {
        return DeveloperPreview.instance
    }
    
}

class DeveloperPreview {
    static let instance = DeveloperPreview()
    private init() { }
    let authVM = AuthViewModel()
    let user = User(username: "Alisultan", fullName: "Alisultan Abdullah", profileImageUrl: "https://firebasestorage.googleapis.com:443/v0/b/twitterswiftuiclone-95b28.appspot.com/o/profile_images%2F21565D3B-10EC-4C7F-BC23-3522E57E6635?alt=media&token=acb98bc5-bacd-4316-9d74-5a4fa04bd316", email: "test@mail.ru")
}
