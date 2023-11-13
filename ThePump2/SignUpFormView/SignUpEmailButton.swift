//
//  SignUpEmailButton.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 15/10/23.
//

import SwiftUI




struct SignUpEmailButton: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        Button(action: {}, label: {
            HStack{
            
                
                
                Text("Sign Up")
                    .fontWeight(.regular)
            }
            .frame(width: 280,height: 45)
            .presentationCornerRadius(8)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: 2)
            
            
        })
        .buttonStyle(CustomBorderedButtonStyle())

    }
}


struct CustomBorderedButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.blue, lineWidth: 2)
            )
            .foregroundColor(.blue)
    }
}

#Preview {
    SignUpEmailButton()
}
