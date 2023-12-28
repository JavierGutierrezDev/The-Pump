//
//  ReorderExercise.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 5/12/23.
//

import SwiftUI

struct ReorderExercise: View {
    @Environment (\.modelContext) private var context
    @Environment (\.dismiss) private var dismiss
    @Binding  var routine : Routine
    @State private var exercise1 : Exercise?
    @State private var exercise2 : Exercise?
    var body: some View {
        Text("Select the exercises")
            .font(.title2)
            .padding()
        List {
            
            ForEach($routine.exercises.sorted(by: { $0.wrappedValue.creationDate < $1.wrappedValue.creationDate }), id: \.id){exercise in
                HStack{
                    Image( exercise.imageName.wrappedValue)
                        .resizable()
                        .frame(width: 60, height: 60)
                        .aspectRatio(contentMode: .fit)
                    
                    Text(exercise.exerciseName.wrappedValue)
                        .font(.title3)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Button {
                            
                        if(exercise1 == nil  ){
                            exercise1 = exercise.wrappedValue
                        }
                        else{
                            if(exercise2 == nil){
                                exercise2 = exercise.wrappedValue
                                var exercise1Date = exercise1?.creationDate
                                var exercise2Date = exercise2?.creationDate
                                exercise1?.creationDate = exercise2Date!
                                exercise2?.creationDate = exercise1Date!
                                exercise1 = nil
                                exercise2 = nil
                                
                                
                            }
                        }
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundStyle((exercise1?.id == exercise.wrappedValue.id || exercise2?.id == exercise.wrappedValue.id ) ? .blue : .gray)
                            
                    }

                    
                    
                    
                    
                    
                    
                }

            }
            .animation(.spring, value: routine.exercises)
        }
        .padding(.vertical)
        
        
    }

}


