//
//  Board.swift
//  moureJanuary
//
//  Created by Diego Alberto Dominguez Herreros on 6/1/22.
//

import SwiftUI

class Board: ObservableObject {
    var height: Int
    var width: Int
    private var coordinates: [[Coordinate]]
    private enum Direction {
        case left
        case down
        case diagonalUp
        case diagonalDown
    }
    
    init(height: Int, width: Int){
        self.height = height
        self.width = width
        self.coordinates = Array(repeating: Array(repeating: Coordinate(x: 0, y: 0), count: width), count: height)
        for i in 0..<height {
            for j in 0..<width {
                self.coordinates[i][j] = Coordinate(x: i, y: j)
            }
        }
    }
    
    func get(_ x: Int, _ y: Int) -> Coordinate {
        self.coordinates[x][y]
    }
    
    func get(_ y: Int) -> Coordinate? {
        for i in (0...(self.height-1)).reversed() {
            if !self.coordinates[i][y].active {
                return self.get(i, y)
            }
        }
        return nil
    }
    
    func getAll(_ y: Int) -> [Coordinate] {
        var coordinates = [Coordinate]()
        for i in (0...(self.height-1)) {
            if !self.coordinates[i][y].active {
                coordinates.append(self.get(i, y))
            }
        }
        return coordinates
    }
    
    func clear() {
        for i in 0..<height {
            for j in 0..<width {
                self.coordinates[i][j].clear()
            }
        }
    }
    
    func boardEmpty() -> Bool {
        for i in 0..<height {
            for j in 0..<width {
                if self.coordinates[i][j].active {
                    return false
                }
            }
        }
        return true
    }
    
    func isWin(_ player: Player) -> Bool {
        for i in 0..<height {
            for j in 0..<width {
                let coordinate = self.coordinates[i][j]
                if coordinate.active && coordinate.player === player {
                    if(left(x: i, y: j, player: player)) {
                        return true
                    }
                    if(down(x: i, y: j, player: player)) {
                        return true
                    }
                    if(diagonalUp(x: i, y: j, player: player)) {
                        return true
                    }
                    if(diagonalDown(x: i, y: j, player: player)) {
                        return true
                    }
                }
            }
        }
        return false
    }
    
    private func left(x: Int, y: Int, player: Player) -> Bool{
        let start = y+1
        let end = start+3
        if end > width {
            return false
        }
        for j in start..<end {
            let coordinate = self.coordinates[x][j]
            if !(coordinate.active && coordinate.player === player) {
                return false
            }
        }
        return true
    }
    
    private func down(x: Int, y: Int, player: Player) -> Bool{
        let start = x+1
        let end = start+3
        if end > height {
            return false
        }
        for i in start..<end {
            let coordinate = self.coordinates[i][y]
            if !(coordinate.active && coordinate.player === player) {
                return false
            }
        }
        return true
    }
    
    private func diagonalUp(x: Int, y: Int, player: Player) -> Bool{
        for z in 1...3 {
            let i = x - z
            let j = y + z
            if i < 0 {
                return false
            }
            if j >= width {
                return false
            }
            let coordinate = self.coordinates[i][j]
            if !(coordinate.active && coordinate.player === player) {
                return false
            }
        }
        return true
    }
    
    private func diagonalDown(x: Int, y: Int, player: Player) -> Bool{
        for z in 1...3 {
            let i = x + z
            let j = y + z
            if i >= height {
                return false
            }
            if j >= width {
                return false
            }
            let coordinate = self.coordinates[i][j]
            if !(coordinate.active && coordinate.player === player) {
                return false
            }
        }
        return true
    }
}
