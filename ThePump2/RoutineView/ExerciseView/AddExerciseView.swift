//
//  AddExerciseView.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 2/11/23.
//

import SwiftUI
import SwiftData

struct AddExerciseView: View {
    @Environment (\.modelContext) var context
    @Environment (\.dismiss) var dismiss
    var exerciseToReplace : Exercise?
    @Binding var routine : Routine
    @State private var createExercise : Bool = false
    @Query(animation: .bouncy) private var exercises : [Exercise]
    var exerciseNames = GlobalData.shared.exerciseNames
    var body: some View {
        List {
            Section("Custom exercise"){
                AddCustomExerciseView(routine: $routine)
            }
            
            Section("Preloaded exercises"){
                ForEach(0..<exerciseNames.count){index in
                    
                    Button(action: {
                        //codigo para añadir el ejercicio a la rutina
                        let exercise : Exercise = Exercise(imageName:
                                                            exerciseNames[index].exerciseImage
                                                           ,exerciseName: exerciseNames[index].exerciseName,
                                                           anotation: "",
                                                           sets: []
                                                           
                        )
                        //Codigo para reusar en remplazar ejercicio
                        if(exerciseToReplace != nil){
                            exercise.creationDate = exerciseToReplace!.creationDate
                            routine.exercises.remove(at: routine.exercises.firstIndex(of: exerciseToReplace!)!)
                            
                            
                        }
                        routine.exercises.append(exercise)
                        context.insert(routine)
                        dismiss.callAsFunction()
                    }, label: {
                        HStack(alignment : .center){
                            Image(exerciseNames[index].exerciseImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 65, height: 65)
                            VStack(alignment: . leading){
                                Text(exerciseNames[index].exerciseName)
                                    .font(.title3)
                                
                            }
                            
                            Spacer()
                        }
                    })
                    .foregroundStyle(.primary)
                    
                    
                }
            }
            
        }
        
        
    }
}

//#Preview {
//    AddExerciseView()
//}
