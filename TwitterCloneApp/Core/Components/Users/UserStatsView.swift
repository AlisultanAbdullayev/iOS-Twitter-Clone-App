//
//  UserStatsView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 28.04.2022.
//

import SwiftUI

struct UserStatsView: View {
    var body: some View {
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
}

struct UserStatsView_Previews: PreviewProvider {
    static var previews: some View {
        UserStatsView()
    }
}
