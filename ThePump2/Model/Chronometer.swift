//
//  Timer.swift
//  ThePump2
//
//  Created by Javier Gutierrez on 1/1/24.
//

import Foundation

class Chronometer{
    var timeRemaining : Int
    var duration : Int
    private var timer : Timer?
    var isActive = false
    
    init(timeRemaining: Int, duration: Int) {
        self.timeRemaining = timeRemaining
        self.duration = duration
    }
    
    
    func stopTimer(){
        timer?.invalidate()
        isActive = false
        timeRemaining = duration
    }
    
    func start(){
        timer?.invalidate()
        timeRemaining = duration
        isActive = true
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            if self.timeRemaining > 0{
                self.timeRemaining -= 1
            }else{
                self.stopTimer()
            }
        })
    }
    
    func pause(){
        timer?.invalidate()
        isActive = false
    }
}
