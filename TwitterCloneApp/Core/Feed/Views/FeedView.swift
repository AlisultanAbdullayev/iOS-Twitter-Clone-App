//
//  FeedView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 27.04.2022.
//

import SwiftUI


struct FeedView: View {
    
    @State private var showNewTweetView = false
    @StateObject private var feedViewModel = FeedViewModel()
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(feedViewModel.tweets) { tweet in
                        TweetRowView(tweet: tweet)
                        Divider()
                    }
                }
            }
            floatingButton
        }
        .onAppear {
            feedViewModel.fetchTweets()
        }
        .navigationBarTitle("Feed")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}

extension FeedView {
    
    private var floatingButton: some View {
        Button {
            showNewTweetView.toggle()
        } label: {
            Circle()
                .fill(.blue)
                .frame(width: 60, height: 60)
                .overlay(
                    Image(systemName: "pencil")
                        .foregroundColor(.white)
                        .font(.title.bold())
                )
                .padding()
                .shadow(color: .accentColor, radius: 10, x: 0, y: 5)
                .fullScreenCover(isPresented: $showNewTweetView) {
                    NewTweetView(showNewTweetView: $showNewTweetView)
                }
        }
    }
    
}
