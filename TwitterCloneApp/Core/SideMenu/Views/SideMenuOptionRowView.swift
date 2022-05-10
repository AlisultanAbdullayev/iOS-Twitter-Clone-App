//
//  SideMenuOptionRowView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 28.04.2022.
//

import SwiftUI

struct SideMenuOptionRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let viewModel: SideMenuViewModel
    
    var body: some View {
        HStack(spacing: 16.0) {
            Image(systemName: viewModel.imageName)
            Text(viewModel.title)
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
    }
}

struct SideMenuOptionRowView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionRowView(viewModel: .profile)
    }
}
