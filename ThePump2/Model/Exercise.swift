//
//  Exercise.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 1/11/23.
//

import Foundation
import SwiftData

@Model
class Exercise : Identifiable {
    let id: UUID
    var creationDate: Date
    @Attribute(.externalStorage)
    var image : Data?
    var imageName : String
    var exerciseName : String
    var anotation : String
    var sets : [Set]

    init(imageName: String = "", exerciseName: String = "", anotation: String = "", sets: [Set] = []) {
        self.id = UUID()
        self.creationDate = Date() // Guarda la fecha y hora actual

        self.imageName = imageName
        self.exerciseName = exerciseName
        self.anotation = anotation
        self.sets = sets
    }
    
    init(image : Data, exerciseName : String,imageName: String = "", anotation: String = "", sets: [Set] = []){
        self.id = UUID()
        self.creationDate = Date() // Guarda la fecha y hora actual

        self.imageName = imageName
        self.exerciseName = exerciseName
        self.anotation = anotation
        self.sets = sets
        
        self.image = image
        self.exerciseName = exerciseName
    }
    
    func addSet(reps: Int , weights: Float, setType: SetType) {
        let newSet = Set( reps: reps, weights: weights, setType: setType)
            sets.append(newSet)
            
        }
    func deleteSet(){
        //comprobación de si tiene set
        if !self.sets.isEmpty{
            //Encuentro el set más antiguo
            let setToDelete = self.sets.min(by:{ $0.creationDate > $1.creationDate})!
            //Capturo el indice y lo borro con el
            if let index = sets.firstIndex(of: setToDelete){
                sets.remove(at: index)
            }
        }
    }
}

enum SetType: String, Codable,CaseIterable, Identifiable {
    var id: String{self.rawValue}
    
    case dropset = "Dropset"
    case restPause = "Rest Pause"
    case failure = "Failure"
    case normal = "Normal"
    case warmup = "Warm"
    
    var initials: String {
            self.rawValue
                .split(separator: " ") // Divide el string en palabras por el espacio
                .map { String($0.prefix(1)) } // Toma la primera letra de cada palabra
                .joined() // Une las letras para formar las iniciales
        }
    
}

@Model
class Set : Identifiable{
    let id: UUID
    let creationDate: Date
    // Tipo de serie.
    var setType: SetType
    //repeticiones en la serie
    var reps : Int
    //peso de la serie
    var weights : Float
    
    init(reps: Int = 0, weights: Float = 0.0, setType: SetType = .normal) {
            self.id = UUID()
            self.creationDate = Date() // Guarda la fecha y hora actual
            self.reps = reps
            self.weights = weights
            self.setType = setType
        }
}


