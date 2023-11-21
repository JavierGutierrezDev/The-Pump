import SwiftUI

struct AddRoutineView: View {
    @State var routine : Routine?
    @State private var routineName = "" // Para almacenar el nombre de la rutina
    @State private var routineDescription = "" // Para almacenar la descripción de la rutina
    @Environment (\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información de la Rutina")) {
                    TextField( "Nombre de la Rutina", text: $routineName)
                    TextField("Descripción (Opcional)", text: $routineDescription)
                }
                

                // Botón para guardar la rutina
                Section {
                    Button("Guardar Rutina") {
                        if(routine != nil){
                            if routineName != ""{
                                routine?.name = routineName
                            }
                            if routineDescription != ""{
                                routine?.routineDescription = routineDescription
                            }
                            try? context.save()
                        }else{
                            let routine = Routine(name: routineName, routineDescription: routineDescription, exercises: [])
                            context.insert(routine)

                        }
                        dismiss.callAsFunction()
                    }
                }
            }
            .navigationBarTitle((routine != nil) ?  routine!.name : "Nueva Rutina")
        }
    }
}



#Preview {
    AddRoutineView()
}
