//
//  SideMenuView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 28.04.2022.
//

import SwiftUI


struct SideMenuView: View {
    
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        if let user = authViewModel.currentUser {
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 35) {
                        VStack(alignment: .leading, spacing: 4.0) {
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
                                .padding(.vertical)
                            Text(user.fullName)
                                .font(.headline)
                            Text("@\(user.username)")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                            UserStatsView()
                                .padding(.vertical)
                        }
                        VStack(alignment: .leading, spacing: 50) {
                            ForEach(SideMenuViewModel.allCases, id: \.rawValue) { viewModel in
                                if viewModel == .profile {
                                    NavigationLink {
                                        ProfileView(user: user)
                                    } label: {
                                        SideMenuOptionRowView(viewModel: viewModel)
                                    }
                                } else if viewModel == .logout {
                                    Button {
                                        authViewModel.logout()
                                    } label: {
                                        SideMenuOptionRowView(viewModel: viewModel)
                                    }
                                    
                                } else {
                                    SideMenuOptionRowView(viewModel: viewModel)
                                }
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
                .padding()
                Spacer()
            }
        }
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
            .environmentObject(dev.authVM)
    }
}
