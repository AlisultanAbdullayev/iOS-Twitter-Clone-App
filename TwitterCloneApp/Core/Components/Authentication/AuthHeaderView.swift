 //
//  AuthHeaderView.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 3.05.2022.
//

import SwiftUI

struct AuthHeaderView: View {
    
    let title1, title2: String
    
    var body: some View {
        // Header View
        VStack(alignment: .leading) {
            Text(title1)
                .fontWeight(.semibold)
            Text(title2)
                .fontWeight(.semibold)
        }
        .font(.largeTitle)
        .foregroundColor(.white)
        .padding()
        .frame(width: UIScreen.main.bounds.width, height: 260, alignment: .leading)
        .background(.blue)
        .clipShape(RoundedShape(corners: [.bottomRight]))
    }
}

struct AuthHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AuthHeaderView(title1: "Hello", title2: "Welcome Back")
    }
}
