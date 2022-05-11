//
//  TweetRowView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 27.04.2022.
//

import SwiftUI

struct TweetRowView: View {
    
    @ObservedObject private var tweetRowViewModel: TweetRowViewModel
    
    init(tweet: Tweet) {
        tweetRowViewModel = TweetRowViewModel(tweet: tweet)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            if let user = tweetRowViewModel.tweet.user {
                // MARK: Profile Image + User Info + Tweet
                HStack(alignment: .top, spacing: 12.0) {
                    AsyncImage(url: URL(string: user.profileImageUrl),
                               content: { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 55, height: 55)
                            .clipShape(Circle())
                    }, placeholder: {
                        ProgressView()
                            .padding()
                    })
                    // MARK: User Info & Tweet Caption
                    VStack(alignment: .leading, spacing: 4.0) {
                        // MARK: User Info
                        if let user = tweetRowViewModel.tweet.user {
                            HStack {
                                Text(user.fullName)
                                    .font(.subheadline)
                                    .bold()
                                Text("@\(user.username)")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Text("\(tweetRowViewModel.tweet.timestamp.dateValue().formatted())")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        // MARK: Tweet Caption
                        Text(tweetRowViewModel.tweet.caption)
                            .font(.subheadline)
                            .multilineTextAlignment(.leading)
                    }
                }
                // MARK: Action Buttons Row
                HStack(alignment: .bottom) {
                    Button {
                        //
                    } label: {
                        Image(systemName: "message")
                    }
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image(systemName: "arrow.2.squarepath")
                    }
                    Spacer()
                    Button {
                        tweetRowViewModel.tweet.didLike ?? false ?
                        tweetRowViewModel.unlikeTweet() :
                        tweetRowViewModel.likeTweet()
                    } label: {
                        Image(systemName: tweetRowViewModel.tweet.didLike ?? false ? "heart.fill" : "suit.heart")
                            .font(.subheadline)
                            .foregroundColor(tweetRowViewModel.tweet.didLike ?? false ? .red : .none)
                    }
                    Spacer()
                    Button {
                        //
                    } label: {
                        Image(systemName: "bookmark")
                    }
                }
                .font(.headline)
                .foregroundColor(.secondary)
                .padding([.top, .horizontal])
            }
   
        }
        .padding()
    }
}

//struct TweetsRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        TweetRowView()
//            .previewLayout(.sizeThatFits)
//    }
//}
