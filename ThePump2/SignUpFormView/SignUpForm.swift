//
//  SignUpForm.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 15/10/23.
//

import SwiftUI


struct SignUpForm: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
            
            Text("Sign Up")
                .foregroundStyle(.foreground)
                .font(.largeTitle)
                .padding(.top)
            
            Spacer()
            
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textContentType(.emailAddress)
                .autocapitalization(.none)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                }
                
            
            
            SecureField("Password", text: $password)
                .textContentType(.password)
                .padding()
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray, lineWidth: 1)
                }
            
            
            Spacer()
            SignUpEmailButton()
                .padding(.top, 10)

            SignUpWithAppleButton()
                .padding(.top, 10)

            
            SignUpWithGoogleButton()
                .padding(.top, 10)
            
            Spacer()
        }
        .padding()
    }
}



#Preview {
    SignUpForm()
}
