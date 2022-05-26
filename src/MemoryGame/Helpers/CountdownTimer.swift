//
//  CountdownTimer.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/24/22.
//

import Foundation
import Combine

class CountdownTimer{
    
    var currentTimeRemaining: Int
    
    let timeRemaining: Int
    let onTick: (_ timeRemaining: Int) -> Void
    let onFinished: () -> Void
    
    private var timer: Publishers.Autoconnect<Timer.TimerPublisher>? = nil
    private var subscription: AnyCancellable? = nil
    
    init(timeRemaining: Int, onTick: @escaping (_ timeRemaining: Int) -> Void, onFinished: @escaping () -> Void) {
        self.timeRemaining = timeRemaining
        self.currentTimeRemaining = timeRemaining
        self.onTick = onTick
        self.onFinished = onFinished
    }
    
    var isRunning: Bool {
        timer != nil
    }
    
    // start the timer and begin ticking
    func start() {
        
        timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        self.currentTimeRemaining = self.timeRemaining
        
        subscription = timer?.sink(receiveValue: { [self] _ in
            self.currentTimeRemaining -= 1
            self.onTick(self.currentTimeRemaining)
            
            if(self.currentTimeRemaining < 1){
                self.onFinished()
                cancel()
            }
        })
    }
    
    // cancel the timer and clean up its resources
    func cancel() {
        timer?.upstream.connect().cancel()
        timer = nil
        subscription = nil
    }
}
