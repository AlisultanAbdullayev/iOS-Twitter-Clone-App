//
//  LoginView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 3.05.2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        // Parent container
        VStack {
            AuthHeaderView(title1: "Hello,", title2: "Welcome Back!")
            
            VStack(spacing: 40.0) {
                CustomInputField(imageName: "envelope", placeholderText: "Email", text: $email)
                CustomInputField(imageName: "lock", placeholderText: "Password", isSecureField: true, text: $password)
                HStack {
                    Spacer()
                    NavigationLink {
                        Text("Reset password view...")
                    } label: {
                        Text("Forgot password?")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                }
            }
            .padding()
            .padding()
            Spacer()
            Button {
                authViewModel.login(email: email, password: password)
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                    .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
            }
            NavigationLink {
                RegistrationView()
                    .navigationBarHidden(true)
            } label: {
                HStack {
                    Text("Don't have an account?")
                    
                    Text("Sign Up")
                        .fontWeight(.semibold)
                }
                .font(.footnote)
                .foregroundColor(.blue)
            }
        }
        .navigationBarHidden(true)
        .edgesIgnoringSafeArea(.top)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
