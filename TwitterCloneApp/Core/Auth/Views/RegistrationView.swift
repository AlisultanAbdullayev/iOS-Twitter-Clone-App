//
//  RegistrationView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 3.05.2022.
//

import SwiftUI

struct RegistrationView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var username: String = ""
    @State private var fullName: String = ""
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
            NavigationLink(isActive: $authViewModel.didAuthUser,
                           destination: { ProfilePhotoSelectorView() },
                           label: { EmptyView() })
            
            // Header View
            AuthHeaderView(title1: "Get started.", title2: "Create your account!")
            VStack(spacing: 50.0) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "person", placeholderText: "Full Name", text: $fullName)
                CustomInputField(imageName: "person", placeholderText: "Username", text: $username)
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
            }
            .padding()
            Spacer()
            Button {
                authViewModel.register(email: email, password: password, fullName: fullName, username: username)
            } label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
            }
            
            Button {
                dismiss()
            } label: {
                HStack {
                    Text("Already have an account?")
                    
                    Text("Sign In")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.blue)
            }

        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
            .environmentObject(dev.authVM)
    }
}
