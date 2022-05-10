//
//  TwitterCloneAppApp.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 27.04.2022.
//

import SwiftUI
import Firebase

@main
struct TwitterCloneAppApp: App {
    
    @StateObject var authViewModel = AuthViewModel()
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(authViewModel)
        }
    }
}
