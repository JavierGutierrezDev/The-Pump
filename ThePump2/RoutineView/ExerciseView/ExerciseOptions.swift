//
//  ExerciseOptions.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 16/11/23.
//

import SwiftUI

struct ExerciseOptions: View {
    var body: some View {
        ZStack{
            Color("lightBlack", bundle: .main)
                .opacity(0.7)
                .ignoresSafeArea(edges: .all)
            
            VStack{
                
                Spacer()
                
                
                CustomOptionCell(labelText: "Reorder", systemImage: "arrow.up.arrow.down")
                CustomOptionCell(labelText: "Replace", systemImage: "arrow.triangle.2.circlepath")
                CustomOptionCell(labelText: "Add to superset", systemImage: "plus")
                CustomOptionCell(labelText: "Delete", systemImage: "xmark")
                    .foregroundStyle(.red)
                //Celda que no se muestra
                Rectangle()
                    .frame(height: 35)
                    .hidden()
                
                CustomOptionCell(labelText: "Cancel")
                
            }
            
            
        }
    }
}


struct CustomOptionCell : View {
    var labelText : String
    var systemImage : String?
    
    var body : some View {
        Button {
            
        } label: {
            
            HStack{
                if((systemImage) != nil){
                    Image(systemName: systemImage!)
                        .resizable()
                        .frame(width: 16,height: 16)
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal)
                }
                Text(labelText)
            }
            
            .frame(maxWidth: .infinity)
            .padding(.vertical)
            .background(Color("lightGray", bundle: .main))
            .clipShape(.rect(cornerRadius: 8), style: FillStyle())
            .padding(.horizontal,32)
        }
    }
}


#Preview {
    ExerciseOptions()
}
