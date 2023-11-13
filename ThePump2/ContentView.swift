//
//  ContentView.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 11/10/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var username: String = ""

    var body: some View {
        VStack {
            SignUpForm()
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
