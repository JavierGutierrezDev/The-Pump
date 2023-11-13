//
//  Routine.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 1/11/23.
//

import Foundation
import SwiftData
@Model
class Routine : Identifiable{
    var name : String
    var routineDescription : String
    var exercises : [Exercise]
    init(name: String = "", routineDescription: String = "", exercises: [Exercise] = []) {
        self.name = name
        self.routineDescription = routineDescription
        self.exercises = exercises
    }
}
