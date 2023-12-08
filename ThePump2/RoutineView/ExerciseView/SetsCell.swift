//
//  SetsCell.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 19/10/23.
//

import SwiftUI

struct SetsCell: View {
    //@Binding var exercise : Exercise

    @Binding var set : Set
    let setTypeOptions = SetType.allCases
    //@State private var selectedSetType: SetType
    //@Binding var isRoutineFinished : Bool?

//    init() {
//        //cuando se inicia la struct y set tiene valor
//        //se le aplica como estado inicial a selectedSetType
//        _selectedSetType = State(initialValue: set.setType)
//        
//    }
    var numberReps : String? {
        return set.reps.description
    }
    var numberWeight : String? {
        return set.weights.description
    }
    @State var reps : String = ""
    @State var weight : String = ""
    
    @State var isCompleted : Bool = false

    var body: some View {
        HStack(){
            
            Picker("Type", selection: $set.setType) {
                ForEach(setTypeOptions, id: \.self) { setTypeOption in
                    Text(setTypeOption.rawValue).tag(setTypeOption)
                }
            }
            
            
            

            TextField("Weight", text: Binding(
                get: { set.weights != 0.0 ? "\(set.weights)" : "" },
                set: { set.weights = Float($0) ?? set.weights }
            ))
            .keyboardType(.decimalPad)
            
            
            TextField("Reps", text: Binding(
                get: { set.reps != 0 ? "\(set.reps)" : "" },
                set: { set.reps = Int($0) ?? set.reps }
            ))
            .keyboardType(.decimalPad)


            Button(action: {
                isCompleted.toggle()
            }, label: {
                Image(systemName: (isCompleted ? "checkmark.circle.fill" :"checkmark.circle" ))
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 25, height: 25)
            })
        }
        .padding()
       
        
        
        
    }
    
}

//#Preview {
//    SetsCell(set: Set(reps: 12,weights: 14, setType: SetType.linear), selectedSetType: .failure)
//}
