//
//  ThePump2App.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 11/10/23.
//

import SwiftUI

@main
struct ThePump2App: App {
    var body: some Scene {
        WindowGroup {
            RoutinesView()
            //ContentView()
        }
        .modelContainer(for: [Routine.self, Exercise.self], isAutosaveEnabled: true)

    }
}
