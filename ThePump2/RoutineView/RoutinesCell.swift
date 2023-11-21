//
//  RoutinesCell.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 18/10/23.
//

import SwiftUI

struct RoutinesCell : View {
    @Environment (\.modelContext) var context
    @State private var navigateToNextView : Bool = false
    @State private var editRoutine : Bool = false
    var routine: Routine
    var body: some View {
        
        NavigationStack{
            
            VStack{
                HStack(alignment: .top){
                    VStack(alignment: .leading){
                        Text(routine.name)
                            .padding(.top)
                            .font(.title3)
                            .bold()
                        
                        Text(routine.routineDescription)
                            .font(.footnote)
                            .padding(.vertical , 0.5)
                    }
                    Spacer()
                    Menu("", systemImage: "ellipsis") {
                        Button("Edit", systemImage: "pencil") {
                            editRoutine.toggle()
                        }
                        

                        Button("Delete", systemImage: "trash",role: .destructive) {
                            context.delete(routine)
                        }
                    }
                    .foregroundStyle(.foreground)
                    .sheet(isPresented: $editRoutine, content: {
                        AddRoutineView(routine: routine)
                    })
                }
                HStack{
                    Button(action: {
                        navigateToNextView.toggle() // Cambia el estado para activar la navegación
                        
                    }, label: {
                        Text("Start routine")
                            .frame(maxWidth: .infinity)
                    })
                    .background{
                        NavigationLink(
                            destination: RoutineView(routine: routine), // Define la vista de destino aquí
                            isActive: $navigateToNextView
                        ) {
                            EmptyView()
                        }
                        .hidden()
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.horizontal)
                    
                    
                }
                .padding(.vertical)
                
                
                
            }
            .padding(.horizontal ,32)
            
        }
    }
}


//#Preview {
//    RoutinesCell()
//}
