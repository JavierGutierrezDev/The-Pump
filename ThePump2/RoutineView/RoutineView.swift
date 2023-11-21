//
//  RoutineView.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 19/10/23.
//

import SwiftUI
import SwiftData
struct RoutineView: View {
    @Environment (\.modelContext) var context
    @Environment (\.dismiss) var dismiss
    @State var routine : Routine
    
    @State private var isCreateExerciseView = false
    
  
    var body: some View {
        VStack{
            
            List{

                ForEach($routine.exercises.sorted(by: { $0.wrappedValue.creationDate < $1.wrappedValue.creationDate }), id: \.id) { exercise in
                    ExerciseView(exercise: exercise, routine: $routine)
                    
                }
                
                
            }
            .listStyle(.plain)
            
            Button(action: {
                isCreateExerciseView.toggle()
            }, label: {
                Label("Add exercise", systemImage: "plus")
            })
            .buttonStyle(.borderedProminent)
            .sheet(isPresented: $isCreateExerciseView, content: {
                AddExerciseView(routine: routine)
                    
            })
            
            

            Button(action: {
                try? context.save()
                //isRoutineFinished.toggle()
                dismiss.callAsFunction()
            }, label: {
                Text("Finish workout")
            })
            .buttonStyle(.borderedProminent)
            
        }.navigationTitle(routine.name)
        
    }
        
}


//#Preview {
//    RoutineView()
//}
