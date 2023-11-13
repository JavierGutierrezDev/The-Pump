//
//  SignUpWithGoogleButton.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 15/10/23.
//

import SwiftUI

struct SignUpWithGoogleButton: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        Button(action: {}, label: {
            HStack{
            Image("google-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 15,height: 15)
                
                
                Text("Sign Up with Google")
                    .fontWeight(.regular)
                    .foregroundStyle((colorScheme == .dark ? .white : .black))
                //Para empujar el contenido hacia la izquierda
            }
            .frame(width: 280,height: 45)
            .presentationCornerRadius(8)
            .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: 2)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                                    .stroke((colorScheme == .dark ? .white : .black), lineWidth: 1)
            }
            
        })
    }
}


struct SignUpPreview : View {
    var body: some View {
        SignUpWithAppleButton()
        SignUpWithGoogleButton()
    }
}

#Preview {
    SignUpPreview()
}
