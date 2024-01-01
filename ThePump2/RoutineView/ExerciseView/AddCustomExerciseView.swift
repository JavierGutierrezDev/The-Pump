//
//  AddCustomExerciseView.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 14/12/23.
//

import SwiftUI
import PhotosUI

struct AddCustomExerciseView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @Binding var routine : Routine
    @State private var selectedItem : PhotosPickerItem?
    @State private var defaultImage : UIImage?
    @State private var exerciseName : String = ""
    var body: some View {
        VStack{
            PhotosPicker(selection: $selectedItem,
                         matching: .images) {
                
                
                Image(uiImage: defaultImage ?? UIImage(resource: .exampleExercise))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .circular))
            }
                         .padding(.vertical)
                         .onChange(of: selectedItem) { _, _ in
                             Task{
                                 if let selectedItem,
                                    let data = try? await selectedItem.loadTransferable(type: Data.self){
                                     if let image = UIImage(data: data){
                                         defaultImage = image
                                     }
                                     
                                 }
                             }
                         }
            
            
            
            TextField("Exercise Name", text: $exerciseName)
            
            
            Button("Add custom exercise") {
                Task{
                    if let selectedItem,
                       let data = try? await selectedItem.loadTransferable(type: Data.self){
                        let exercise = Exercise(image: data, exerciseName: exerciseName)
                        
//                        GlobalData.shared.exerciseNames.append((exerciseImage: exerciseName, exerciseName: exerciseName))
                        saveExercise(exercise: exercise)
                        dismiss()
                    }
                }
            }
            .disabled((defaultImage == nil || exerciseName == ""))
            .buttonStyle(.bordered)
            .padding()
            
            
//            .toolbar(content: {
//                ToolbarItem(placement: .cancellationAction) {
//                    Button("Dismiss") {
//                        dismiss()
//                    }
//                }
//            })
            
        }
    }
}

private extension AddCustomExerciseView{
    func saveExercise(exercise : Exercise){
        //guarda el ejercicio en la rutina
        routine.exercises.append(exercise)
        //dismiss de la vista
        dismiss()
    }
}

