//
//  Timer.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 1/1/24.
//

import Foundation

class CustomTimer{
    var timeRemaining : Int
    var duration : Int
    private var timer : Timer?
    var isActive = false
    
    init(timeRemaining: Int, duration: Int) {
        self.timeRemaining = timeRemaining
        self.duration = duration
    }
    
    
    func start(){
        timeRemaining = duration
        isActive = true
        
        let timer2 = Timer
        timer = Timer.scheduleTim
    }
}
