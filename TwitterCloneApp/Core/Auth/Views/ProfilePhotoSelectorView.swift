//
//  ProfilePhotoSelectorView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 5.05.2022.
//

import SwiftUI

struct ProfilePhotoSelectorView: View {
    
    @State private var showImagePicker = false
    @State private var selectedImage: UIImage?
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Setup your account", title2: "Add a profile picture")
            Button {
                showImagePicker.toggle()
            } label: {
                if let selectedImage = selectedImage {
                    VStack {
                        Image(uiImage: selectedImage)
                            .resizable()
                            .renderingMode(.original)
                            .clipShape(Circle())
                            .scaledToFit()
                        Text("Change the picture")
                            .font(.headline)
                            .fontWeight(.heavy)
                    }
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 200)
                    .padding(.top, 45)
                } else {
                    VStack {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .renderingMode(.template)
                            .scaledToFit()
                        Text("Add a picture")
                            .font(.headline)
                            .fontWeight(.heavy)
                    }
                    .foregroundColor(.blue)
                    .frame(width: 200, height: 200)
                    .padding(.top, 45)
                    
                }
                
            }
            .sheet(isPresented: $showImagePicker) {
                ImagePicker(selectedImage: $selectedImage)
            }
            if let selectedImage = selectedImage {
                Button {
                    authViewModel.uploadProfileImage(selectedImage)
                } label: {
                    Text("Continue")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 50)
                        .background(.blue)
                        .clipShape(Capsule())
                        .padding()
                        .shadow(color: .black.opacity(0.5), radius: 10, x: 0, y: 10)
                }
            }
            Spacer()
        }
        .ignoresSafeArea()
    }
}

struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}
