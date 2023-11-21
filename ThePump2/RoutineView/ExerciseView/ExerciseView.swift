//
//  ExerciseView.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 19/10/23.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var exercise : Exercise
    @Binding var routine : Routine
    @Environment (\.modelContext) var context
    @State var anotationText : String = ""
    var body: some View {
        VStack{
            
            
            HStack(alignment : .top){
                Image(exercise.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 65, height: 65)
                VStack(alignment: . leading){
                    Text(exercise.exerciseName)
                        .font(.title3)
                    TextField(text: $anotationText) {
                        Text((exercise.anotation != "") ? exercise.anotation :  "Add description")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }.onSubmit {
                        exercise.anotation = anotationText
                    }
                    
                    
                    
                }
                
                //Menu de opciones relacionadas con el ejercicio
                Menu("", systemImage: "ellipsis") {
                    Button("Reorder", systemImage: "arrow.up.arrow.down") {
                        
                    }
                    Button("Replace", systemImage:"arrow.triangle.2.circlepath") {
                        
                    }
                    Button("Add to superset", systemImage:"plus") {
                        
                    }
                    Button("Delete", systemImage:"xmark", role: .destructive) {
                        // Eliminar el ejercicio del modelo de datos de SwiftUI
                        routine.exercises.remove(at: routine.exercises.firstIndex(of: exercise)!)
                    
                        // Guardar los cambios en el contexto de Core Data
                        
                        try? context.save()
                    }
                }
                .foregroundStyle(.foreground)
                .padding(.horizontal)

                Spacer()
            }
            .frame(width: .infinity)
            .padding()
            
            //Función del cronometro
            Button("", systemImage: "alarm") {
                
            }
            .foregroundStyle(.foreground)
            
            ScrollView{
                	
                ForEach($exercise.sets.sorted { $0.wrappedValue.creationDate < $1.wrappedValue.creationDate }, id: \.wrappedValue.id) { set in
                    SetsCell(set: set)
                        
                }
                HStack(){
                    
                    Button("New Set", systemImage: "plus") {
                        exercise.addSet(reps: 0, weights: 0, setType: .normal)
                    }
                    .padding(.horizontal)
                    Button("Delete Set", systemImage: "trash", role: .destructive) {
                        
                        exercise.deleteSet()
                    }
                    .padding(.horizontal)

                }
            }
            
            
        }
    }
}

//#Preview {
//    ExerciseView(sets: [0,0])
//}




