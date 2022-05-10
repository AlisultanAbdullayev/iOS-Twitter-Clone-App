//
//  AuthViewModel.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 3.05.2022.
//

import Foundation
import Firebase
import UIKit

class AuthViewModel: ObservableObject {
    
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    private let service = UserService()
    
    init() {
        userSession = Auth.auth().currentUser
        fetchUser()
        print("DEBUG: User session is \(String(describing: userSession?.uid))")
    }
    
    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print("DEBUG: Failed to login with error \(error.localizedDescription)")
                return
            }
            
            guard let user = result?.user else { return }
            self?.userSession = user
            self?.fetchUser()
            print("DEBUG: User logged in successfully!")
        }
    }
    
    func register(email: String, password: String, fullName: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                print("DEBUG: Failed to register with error \(error.localizedDescription)")
                return
            }
            guard let user = result?.user else { return }
            
            self?.tempUserSession = user
            
            let data = ["email": email, "username": username.lowercased(), "fullName": fullName, "uid": user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data) { [weak self] error in
                    print(error == nil ? "Did upload user data..." : "DEBUG: Error while saving to firestore \(error?.localizedDescription ?? "")" )
                    self?.didAuthUser = true
                }
        }
    }
    
    func logout() { 
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else { return }
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")
                .document(uid)
                .updateData(["profileImageUrl": profileImageUrl]) { [weak self] _ in
                    self?.userSession = self?.tempUserSession
                    self?.fetchUser()
                }
        }
    }
    
    func fetchUser() {
        guard let uid = userSession?.uid else { return }
        service.fetchUser(uid: uid) { [weak self] user in
            self?.currentUser = user
        }
    }
}
