//
//  UserRowView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 28.04.2022.
//

import SwiftUI


struct UserRowView: View {
    
    @Environment(\.colorScheme) var colorScheme
    let user: User
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.profileImageUrl),
                       content: { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }, placeholder: {
                ProgressView()
                    .padding()
            })
            VStack(alignment: .leading) {
                Text(user.username)
                    .font(.subheadline)
                    .bold()
                Text(user.fullName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            Spacer()
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
        .padding(.horizontal)
    }
}

struct UserRowView_Previews: PreviewProvider {
    static var previews: some View {
        UserRowView(user: dev.user)
            .previewLayout(.sizeThatFits)
    }
}
