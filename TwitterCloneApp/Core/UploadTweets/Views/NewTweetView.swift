//
//  NewTweetView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 1.05.2022.
//

import SwiftUI


struct NewTweetView: View {
    
    @Binding var showNewTweetView: Bool
    @State private var caption: String = ""
    @State private var placeholder: String = "What's happening...?"
    @EnvironmentObject private var authViewModel: AuthViewModel
    @StateObject private var uploadTweetViewModel = UploadTweetViewModel()
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            if let user = authViewModel.currentUser {
                VStack {
                    HStack(alignment: .top) {
                        AsyncImage(url: URL(string: user.profileImageUrl)) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 65, height: 65)
                                .clipShape(Circle())
                            
                        } placeholder: {
                            ProgressView()
                                .padding()
                        }
                        textFieldView
                    }
                    .padding()
                    Spacer()
                }
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            showNewTweetView.toggle()
                        } label: {
                            Text("Cancel")
                                .bold()
                                .foregroundColor(.blue)
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            uploadTweetViewModel.uploadTweet(caption: caption)
                        }, label: {
                            Text("Tweet")
                                .bold()
                                .foregroundColor(.white)
                                .frame(width: 75, height: 30)
                                .background(Color.blue)
                                .clipShape(Capsule())
                                .opacity(caption.isEmpty ? 0.5 : 1)
                        })
                        .disabled(caption.isEmpty ? true : false)
                    }
                }
                .onAppear {
                    UITextView.appearance().backgroundColor = .clear
                }
                .onReceive(uploadTweetViewModel.$didUploadTweet) { success in
                    if success {
                        dismiss()
                    }
                }
            }
        }
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView(showNewTweetView: .constant(false))
            .environmentObject(dev.authVM)
    }
}

extension NewTweetView {
    
    private var textFieldView: some View {
        ZStack(alignment: .topLeading) {
            if caption.isEmpty {
                Text(placeholder)
                    .foregroundColor(.secondary)
                    .padding(.top, 10)
                    .padding(.leading, 5)
            }
            TextEditor(text: $caption)
                .multilineTextAlignment(.leading)
        }
        .frame(minWidth: 100, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
    }
    
}
