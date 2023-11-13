import SwiftUI

struct AddRoutineView: View {
    @State private var routineName = "" // Para almacenar el nombre de la rutina
    @State private var routineDescription = "" // Para almacenar la descripción de la rutina
    @Environment (\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Información de la Rutina")) {
                    TextField("Nombre de la Rutina", text: $routineName)
                    TextField("Descripción (Opcional)", text: $routineDescription)
                }
                

                // Botón para guardar la rutina
                Section {
                    Button("Guardar Rutina") {
                        let routine = Routine(name: routineName, routineDescription: routineDescription, exercises: [])
                        context.insert(routine)
                        dismiss.callAsFunction()
                    }
                }
            }
            .navigationBarTitle("Nueva Rutina")
        }
    }
}



#Preview {
    AddRoutineView()
}
