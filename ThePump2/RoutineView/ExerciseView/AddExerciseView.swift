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
    var routine : Routine
    @Query(animation: .bouncy) private var exercises : [Exercise]
     var exerciseNames = GlobalData.shared.exerciseNames
        var body: some View {
        List {
            ForEach(0..<exerciseNames.count){index in
                
                Button(action: {
                    //codigo para añadir el ejercicio a la rutina
                    let exercise : Exercise = Exercise(imageName:
                                                        exerciseNames[index].exerciseImage
                                                       ,exerciseName: exerciseNames[index].exerciseName,
                                                        anotation: "",
                                                        sets: []
                                    )
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
            Button("Create new exercise", systemImage: "plus") {
                
            }
    }
}

//#Preview {
//    AddExerciseView()
//}
