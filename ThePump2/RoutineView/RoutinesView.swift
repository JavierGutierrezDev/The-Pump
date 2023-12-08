//
//  RoutinesView.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 18/10/23.
//

import SwiftUI
import SwiftData
struct RoutinesView: View {
    @Environment (\.modelContext) private var context
    @Environment (\.dismiss) private var dismiss
    @State var isNewRoutine : Bool = false
    @Query var routines : [Routine]
    var body: some View {
        NavigationStack{
            
            VStack{
                List{
                    ForEach(routines, id: \.self){ routine in
                        RoutinesCell(routine: routine)
                            
                    }
                }
                
            }
            
            HStack{
                Button("Add routine", systemImage: "plus") {
                    isNewRoutine.toggle()
                }
                .sheet(isPresented: $isNewRoutine) {
                    AddRoutineView()
                }
                RoutinesActionButton(descriptionAction: "Explore",
                                     symbol: "magnifyingglass")
            }
        }
        .navigationTitle("Routines")
        
        
        
        
    }
}

struct RoutinesActionButton : View {
    var descriptionAction : String
    var symbol : String
    var body: some View {
        Button(action: {
            
        }, label: {
            HStack{
                
                Image(systemName: symbol)
                    .resizable()
                    .frame(width: 24,height: 24)
                    .aspectRatio(contentMode: .fit)
                Text(descriptionAction)
                    .font(.title3)
            }
            .padding()
        })
    }
}


struct addRoutineButton : View {
    var body: some View {
        Button(action: {
        }, label: {
            HStack{
                
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 24,height: 24)
                    .aspectRatio(contentMode: .fit)
                Text("New routine")
                    .font(.title3)
            }
            .padding()
        })
        
    }
}

#Preview {
    RoutinesView()
}
