//
//  ProfileViewNew.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 28.04.2022.
//

import SwiftUI

struct ProfileViewNew: View {
    
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Namespace private var animation
    
    var body: some View {
        ScrollView {
                ZStack(alignment: .bottomLeading) {
                    Color(.systemCyan)
                        .frame(minHeight: 150)
                    Circle()
                        .frame(width: 72, height: 72)
                        .background(
                            Circle()
                                .fill(.white)
                                .frame(width: 80, height: 80)
                        )
                        .offset(x: 25, y: 35)
                }
                VStack(alignment: .leading) {
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
                                Text("Edit Profile")
                                    .bold()
                                    .frame(width: 120, height: 32)
                                    .background(
                                        Capsule()
                                            .stroke()
                                    )
                            }
                        }
                        .foregroundColor(.black)
                        .padding(.horizontal)
                    VStack(alignment: .leading, spacing: 5.0) {
                        HStack {
                            Text("Alisultan Abdullah")
                                .font(.title2)
                                .bold()
                            Image(systemName: "checkmark.seal.fill")
                                .foregroundColor(.blue)
                        }
                        Text("@Alisutlan")
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
                            
                            HStack(spacing: 30) {
                                HStack {
                                    Text("10")
                                        .font(.subheadline)
                                        .bold()
                                    Text("Following")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                                HStack {
                                    Text("20K")
                                        .font(.subheadline)
                                        .bold()
                                    Text("Followers")
                                        .font(.footnote)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                    HStack {
                        ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                            VStack {
                                Text(item.title)
                                    .font(.subheadline)
                                    .fontWeight(selectedFilter == item ? .semibold : .regular)
                                    .foregroundColor(selectedFilter == item ? .black : .secondary)
                                
                                if selectedFilter == item {
                                    Capsule()
                                        .fill(.cyan)
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
                    Divider()
                    LazyVStack {
                        ForEach(0..<10, id: \.self) { _ in
                            TweetRowView()
                            Divider()
                        }
                    }
                }
        }
        .ignoresSafeArea()
    }
}

struct ProfileViewNew_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProfileViewNew()
        }
    }
}

