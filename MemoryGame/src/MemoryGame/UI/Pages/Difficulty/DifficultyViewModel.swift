//
//  DifficultyViewModel.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/20/22.
//

import Foundation

enum DifficultyLevel {
    case easy
    case medium
    case hard
}

final class DifficultyViewModel : ObservableObject{
    
    private let router: DifficultyRouter
    
    init(router: DifficultyRouter) {
        self.router = router
    }
    
    func cardBoardView(difficultyLevel: DifficultyLevel) -> CardBoardView {
        return router.cardBoardView(difficultyLevel: difficultyLevel)
    }
    
}
