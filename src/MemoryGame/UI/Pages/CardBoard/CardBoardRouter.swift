//
//  CardBoardRouter.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/15/22.
//

import SwiftUI

final class CardBoardRouter {
    
    static func view(difficultyLevel: DifficultyLevel) -> CardBoardView {
        
        let router = CardBoardRouter()
        
        let viewModel = CardBoardViewModel(
            manager: MemoryGameManager(difficultyLevel: difficultyLevel),
            router: router)
        
        let view = CardBoardView(viewModel: viewModel)
        
        return view
    }
    
    func countdownView(timeRemaining: Binding<Int>) -> CountdownView {
        return  CountdownView(timeRemaining: timeRemaining)
    }
    
    func boardView(viewModel: CardBoardViewModel) -> BoardView {
        return BoardView(viewModel: viewModel)
    }
    
}
