//
//  ExploreView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 27.04.2022.
//

import SwiftUI

struct ExploreView: View {
    @State private var textField: String = ""
    @StateObject private var exploreViewModel = ExploreViewModel()
    var body: some View {
            VStack {
                SearchBar(text: $textField)
                ScrollView {
                    LazyVStack {
                        ForEach(exploreViewModel.searchableUsers) { user in
                            NavigationLink  {
                                ProfileView(user: user)
                            } label: {
                                UserRowView(user: user)
                            }
                        }
                    }
                }
            }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
            ExploreView()
    }
}
