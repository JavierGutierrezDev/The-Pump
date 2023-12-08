//
//  ReplaceExercise.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 5/12/23.
//

import SwiftUI
import SwiftData

struct ReplaceExercise: View {
    @Environment (\.modelContext) var context
    @Environment (\.dismiss) var dismiss
    @Query(animation: .bouncy) private var exercises : [Exercise]
    @State private var exerciseToChange : Exercise
    
    var body: some View {
        Text("Hello world")
    }
}

//#Preview {
//    ReplaceExercise()
//}
