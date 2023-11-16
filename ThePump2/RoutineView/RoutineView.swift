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

    //@Query private var exercises : [Exercise]
    //private var exercises : [Exercise]
    
    @State private var isCreateExerciseView = false
    
    //@State var isRoutineFinished : Bool = false

//    init( routine: Routine) {
//        
//        self.routine = routine
//        //self.exercises = routine.exercises
//        
//    }

    var body: some View {
        VStack{
            
            List{

                ForEach($routine.exercises.sorted(by: { $0.wrappedValue.creationDate < $1.wrappedValue.creationDate }), id: \.id) { exercise in
                    ExerciseView(exercise: exercise)
                    .swipeActions{
                        Button("Delete", systemImage: "trash.fill", role: .destructive) {
//                                //elimina el ejercicio de Core Data
//                                context.delete(exercise)
                                    
                                // Eliminar el ejercicio del modelo de datos de SwiftUI
                                routine.exercises.remove(at: routine.exercises.firstIndex(of: exercise.wrappedValue)!)
                            
                                // Guardar los cambios en el contexto de Core Data
                                try? context.save()
                        }
                        
                        Button("Edit", systemImage: "pencil", role: .none) {
                            print("Edit -->\(exercise.exerciseName.wrappedValue)")
                        }
                        .foregroundStyle(.primary)
                    }
                    
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
