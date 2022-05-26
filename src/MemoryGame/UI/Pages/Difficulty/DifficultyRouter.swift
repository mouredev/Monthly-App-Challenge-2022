//
//  DifficultyRouter.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/20/22.
//

import SwiftUI

final class DifficultyRouter {
    
    static func view() -> DifficultyView {
        
        let router = DifficultyRouter()
        let viewModel = DifficultyViewModel(router: router)
        let view = DifficultyView(viewModel: viewModel)
        
        return view
    }
    
    func cardBoardView(difficultyLevel: DifficultyLevel) -> CardBoardView {
        return CardBoardRouter.view(difficultyLevel: difficultyLevel)
    }
    
}
