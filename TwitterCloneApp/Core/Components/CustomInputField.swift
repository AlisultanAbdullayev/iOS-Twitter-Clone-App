//
//  CustomInputField.swift
//  TwitterCloneApp
//
//  Created by Alisultan Abdullah on 3.05.2022.
//

import SwiftUI

struct CustomInputField: View {
    
    let imageName: String
    let placeholderText: String
    let isSecureField: Bool?
    @Binding var text: String

    init(imageName: String, placeholderText: String, isSecureField: Bool = false, text: Binding<String>) {
        self.imageName = imageName
        self.placeholderText = placeholderText
        self.isSecureField = isSecureField
        self._text = text
    }
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.secondary)
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: $text)
                } else {
                    TextField(placeholderText, text: $text)
                }
            }
            Divider()
                .background(.secondary)
                
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(imageName: "envelope", placeholderText: "Email", isSecureField: false, text: .constant(""))
    }
}
