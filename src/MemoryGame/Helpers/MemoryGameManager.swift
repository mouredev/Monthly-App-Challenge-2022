//
//  MemoryGameManager.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/24/22.
//

import Foundation

import Foundation
import UIKit
import SwiftUI

final class MemoryGameManager : ObservableObject{
    
    private var xCellWaiting = -1
    private var yCellWaiting = -1
    
    private var difficultyLevel: DifficultyLevel
    
    private var totalTouches = 0
    
    @Published var locked: Bool = false
    @Published var couplesToDiscover: Int = 0
    @Published var totalMoves: Int = 0
    
    init(difficultyLevel: DifficultyLevel) {
        self.difficultyLevel = difficultyLevel
    }
    
    func initializeBoard() -> [[CardModel]] {
        
        var width, height: Int
        
        (width, height) = getBoardSize()
        
        couplesToDiscover = width * height / 2
        totalMoves = 0
        totalTouches = 0
        
        var images = getImages(count: couplesToDiscover)
        
        var matrix : [[CardModel]] = Array(repeating: Array(repeating: CardModel(), count: width), count: height)
        
        for i in 0..<height {
            
            for j in 0..<width {
                
                let index = Int.random(in: 0..<images.count)
                
                let item = images[index]
                
                images.remove(at: index)
                
                let newCard = CardModel()
                
                newCard.image = item
                newCard.x = i
                newCard.y = j
                
                matrix[i][j] = newCard
            }
        }
        
        return matrix
    }
    
    func check(card: CardModel, matrix: [[CardModel]]) -> Bool{
        
        totalTouches += 1
        
        if (totalTouches + 1) % 2 != 1 {
            
            xCellWaiting = card.x
            yCellWaiting = card.y
            return false;
        }
        
        totalMoves += 1
        
        locked = true;
        
        if checkCouples(card: card, matrix: matrix){
            
            couplesToDiscover -= 1
            
            locked = false
            
            if winner(card: card) {
                
                return true
            }
            
            return false
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.hide(matrix: matrix, card: card);
            self.locked = false
        }
        
        return false
    }
    
    private func checkCouples(card: CardModel, matrix: [[CardModel]]) -> Bool {
        
        if xCellWaiting > -1 && yCellWaiting > -1 && matrix[xCellWaiting][yCellWaiting].image == card.image {
            
            matrix[xCellWaiting][yCellWaiting].discovered = true
            matrix[xCellWaiting][yCellWaiting].isFaceUp = true
            
            card.discovered = true
            card.isFaceUp = true
            
            return true
        }
        
        return false
    }
    
    private func winner(card: CardModel) -> Bool {
        return couplesToDiscover == 0
    }
    
    private func hide(matrix: [[CardModel]], card: CardModel){
        
        if xCellWaiting > -1 && yCellWaiting > -1 {
            
            matrix[xCellWaiting][yCellWaiting].waiting = false
            matrix[xCellWaiting][yCellWaiting].isFaceUp = false
            
            card.waiting = false
            card.isFaceUp = false
            
        }
    }
    
    private func getImages(count: Int) -> [String]{
        
        let total = 15
        
        var items = (0..<total).map{ index in
            "image\(index)"
        }
        
        var images = Array(repeating: "", count: count * 2)
        
        for i in 0..<count {
            
            let index = Int.random(in: 0..<items.count)
            let item = items[index]
            items.remove(at: index)
            
            images[i] = item
            images[i + count] = item
        }
        
        return images
    }
    
    private func getBoardSize() -> (Int, Int){
        switch self.difficultyLevel {
        case DifficultyLevel.medium:
            return (4, 6)
        case DifficultyLevel.hard:
            return (5, 6)
        default:
            return (4, 4)
        }
    }
}
