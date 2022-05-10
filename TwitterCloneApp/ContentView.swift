//
//  ContentView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 27.04.2022.
//

import SwiftUI


struct ContentView: View {
    
    @State private var showMenu: Bool = false
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            if authViewModel.userSession == nil {
                LoginView()
            } else {
                mainInterfaceView
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
                .environmentObject(dev.authVM)
        }
    }
}

extension ContentView {
    
    private var mainInterfaceView: some View {
        ZStack(alignment: .topLeading) {
            MainTabView()
            if showMenu {
                Color.black.opacity(showMenu ? 0.35 : 0)
                    .ignoresSafeArea()
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    }
                SideMenuView()
                    .frame(width: UIScreen.main.bounds.width * 2.25/3)
                    .background(.thinMaterial)
                    .zIndex(1)
                    .transition(.move(edge: .leading))
            }
        }
        .navigationBarHidden(showMenu)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                if let user = authViewModel.currentUser {
                    Button {
                        withAnimation(.easeInOut) {
                            showMenu.toggle()
                        }
                    } label: {
                        AsyncImage(url: URL(string: user.profileImageUrl),
                                   content: { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 35, height: 35)
                                .clipShape(Circle())
                        }, placeholder: {
                            ProgressView()
                                .padding()
                        })
                    }
                }
            }
        }
        .onAppear {
            showMenu = false
        }
    }
    
}
