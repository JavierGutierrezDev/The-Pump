//
//  SignUpWithAppleButton.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 15/10/23.
//

import SwiftUI
import AuthenticationServices

//UIViewRepresentable para trabajar con vistas UIKit
struct SignUpWithApple : UIViewRepresentable {
    @Environment(\.colorScheme) var colorScheme

    func updateUIView(_ uiView: ASAuthorizationAppleIDButton, context: Context) {}
    //crea el boton proporcionado por Apple
    func makeUIView(context: Context) -> ASAuthorizationAppleIDButton {
        //cambia el estilo del boton con modo claro/oscuro
        let style : ASAuthorizationAppleIDButton.Style = (colorScheme == .dark ? .white : .black)
        return ASAuthorizationAppleIDButton(type: .signUp, style: style)
    }
}


struct SignUpWithAppleButton: View {
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        SignUpWithApple()
            .frame(width: 280, height: 45)
            .overlay {
                RoundedRectangle(cornerRadius: 8)
                                    .stroke((colorScheme == .dark ? .white : .black), lineWidth: 1)
            }
    }
}

#Preview {
    SignUpWithAppleButton()
}
