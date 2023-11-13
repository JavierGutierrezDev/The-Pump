//
//  GlobalData.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 3/11/23.
//

import Foundation

class GlobalData {
    //unica instancia que se crea
    static let shared = GlobalData()
    
    //constructor privado al cual solo se puede acceder desde la clase para asegurar su patron singleton
    private init(){}
    var exerciseNames : [(exerciseImage: String, exerciseName : String)] = [
        (exerciseImage: "barbellShoulderPress", exerciseName: "Shoulder press with barbell"),
        (exerciseImage: "barbellSquat", exerciseName: "Barbell squat"),
        (exerciseImage: "benchPress", exerciseName: "Barbell bench press"),
        (exerciseImage: "legPress", exerciseName: "Leg press in machine"),
        (exerciseImage: "inclineBenchPress", exerciseName: "Incline barbell bench press")

    ]
}
