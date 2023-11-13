//
//  RoutinesCell.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 18/10/23.
//

import SwiftUI

struct RoutinesCell : View {
    @State private var navigateToNextView = false
    var routine: Routine
    var body: some View {
        
        NavigationStack{
            VStack(alignment: .leading){
                
                Text(routine.name)
                    .padding(.top)
                    .font(.title3)
                    .bold()
                
                Text(routine.routineDescription)
                    .font(.footnote)
                    .padding(.vertical , 0.5)
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
