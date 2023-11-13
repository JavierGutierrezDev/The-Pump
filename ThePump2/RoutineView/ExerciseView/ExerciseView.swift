//
//  ExerciseView.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 19/10/23.
//

import SwiftUI

struct ExerciseView: View {
    @Binding var exercise : Exercise
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
                        Text("Agregar descripción")
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    
                }
                
                
                Spacer()
            }
            .frame(width: .infinity)
            .padding()
            HStack{
                Button(action: {}, label: {
                    Image(systemName: "alarm")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20)
                    
                    Text("Temporizador de descanso (desactivado)")                })
                
            }
            ScrollView{
                
                ForEach($exercise.sets.sorted { $0.wrappedValue.creationDate < $1.wrappedValue.creationDate }, id: \.wrappedValue.id) { set in
                    SetsCell(set: set)
                }

                Button("New Set", systemImage: "plus") {
                    exercise.addSet(reps: 0, weights: 0, setType: .normal)
                }
            }
            
        }
    }
}

//#Preview {
//    ExerciseView(sets: [0,0])
//}
