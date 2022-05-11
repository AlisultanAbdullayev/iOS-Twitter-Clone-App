//
//  ProfileView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 27.04.2022.
//

import SwiftUI


struct ProfileView: View {
    
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @ObservedObject private var profileViewModel: ProfileViewModel
    @Namespace private var animation
    
    init(user: User) {
        profileViewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                headerView
                actionButtons
                infoDetails
                tweetFilterBar
                Divider()
                tweetsView
            }
        }
        .ignoresSafeArea()
        .navigationTitle(profileViewModel.user.fullName)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: dev.user)
    }
}

extension ProfileView {
    
    private var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            AsyncImage(url: URL(string: profileViewModel.user.profileImageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 30)
                    .frame(height: 150)
                    .clipped()
            } placeholder: {
                ProgressView()
                    .padding()
                    .frame(width: UIScreen.main.bounds.width, height: 150, alignment: .bottom)
            }
            AsyncImage(url: URL(string: profileViewModel.user.profileImageUrl)) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 75, height: 75)
                    .clipShape(Circle())
                    .background(
                        Circle()
                            .fill(.white)
                            .frame(width: 80, height: 80)
                    )
                    .offset(x: 25, y: 35)
            } placeholder: {
                ProgressView()
                    .padding()
            }
        }
        .frame(minHeight: 150)
    }
    
    private var actionButtons: some View {
        HStack(spacing: 12.0) {
            Spacer()
            Button {
                //
            } label: {
                Image(systemName: "bell.badge")
                    .font(.title3)
                    .padding(5)
                    .background(
                        Circle()
                            .stroke(.black)
                    )
            }
            Button {
                //
            } label: {
                Text(profileViewModel.actionButtonTitle)
                    .bold()
                    .frame(width: 120, height: 32)
                    .background(
                        Capsule()
                            .stroke()
                    )
            }
        }
        .foregroundColor(.accentColor)
        .padding(.horizontal)
    }
    
    private var infoDetails: some View {
        VStack(alignment: .leading, spacing: 5.0) {
            HStack {
                Text(profileViewModel.user.fullName)
                    .font(.title2)
                    .bold()
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.blue)
            }
            Text("@\(profileViewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            Text("Senior iOS Developer")
                .font(.subheadline)
                .padding(.vertical)
            VStack(alignment: .leading, spacing: 15.0) {
                HStack(spacing: 30) {
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text("Antalya, Turkey")
                    }
                    HStack {
                        Image(systemName: "link")
                        Text("www.alijaver.com")
                    }
                }
                .font(.footnote)
                .foregroundColor(.secondary)
                UserStatsView()
            }
            .padding(.bottom)
        }
        .padding(.horizontal)
    }
    
    private var tweetFilterBar: some View {
        HStack {
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular)
                        .foregroundColor(selectedFilter == item ? .accentColor : .secondary)
                    
                    if selectedFilter == item {
                        Capsule()
                            .fill(.blue)
                            .frame(height: 5)
                            .offset(y: 8)
                            .matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        Capsule()
                            .fill(Color.clear)
                            .frame(height: 5)
                    }
                }
                .onTapGesture {
                    withAnimation(.linear) {
                        self.selectedFilter = item
                    }
                }
            }
        }
    }
    
    private var tweetsView: some View {
        LazyVStack {
            ForEach(profileViewModel.tweets(filter: selectedFilter)) { tweet in
                TweetRowView(tweet: tweet)
                Divider()
            }
        }
    }
    
}
