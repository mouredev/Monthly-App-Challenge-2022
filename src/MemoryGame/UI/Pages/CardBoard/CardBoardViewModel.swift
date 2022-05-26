//
//  BoardViewModel.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/15/22.
//

import Foundation
import SwiftUI

final class CardBoardViewModel : ObservableObject {
    
    private var manager: MemoryGameManager
    private let router: CardBoardRouter
    
    var timer: CountdownTimer? = nil
    
    @Published var winner = false
    @Published var timeOut = false
    @Published var timeRemaining = 0
    @Published var matrix: [[CardModel]]
    
    init(manager: MemoryGameManager, router: CardBoardRouter) {
        self.manager = manager
        self.router = router
        self.matrix = [[]]
    }
    
    func locked() -> Bool{
        return manager.locked
    }
    
    func totalMoves() -> Int {
        return self.manager.totalMoves
    }
    
    func couplesToDiscover() -> Int {
        return self.manager.couplesToDiscover
    }
    
    func initializeBoard() {
        
        if(timer == nil){
            timer = CountdownTimer(timeRemaining: 60){timeRemaining in
                self.timeRemaining = timeRemaining
                
            } onFinished: {
                self.timeOut = true
            }
        }
        else{
            timer?.cancel()
        }
        
        winner = false
        timeOut = false
        
        matrix = manager.initializeBoard();
        
        timer?.start()
    }
    
    func check(card: CardModel, matrix: [[CardModel]]) {
        if manager.check(card: card, matrix: matrix) {
            winner = true
        }
    }
    
    func countdownView(timeRemaining: Binding<Int>) -> CountdownView {
        return  router.countdownView(timeRemaining: timeRemaining)
    }
    
    func boardView() -> BoardView {
        return router.boardView(viewModel: self)
    }
    
}
