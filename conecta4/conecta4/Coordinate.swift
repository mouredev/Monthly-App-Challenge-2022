//
//  Coordinate.swift
//  moureJanuary
//
//  Created by Diego Alberto Dominguez Herreros on 6/1/22.
//

import SwiftUI

class Coordinate: ObservableObject {
    let x: Int
    let y: Int
    var active: Bool
    @Published var player: Player
    init(x: Int, y: Int){
        self.x = x
        self.y = y
        self.active = false
        self.player = NullPlayer()
    }
    func selected(_ player: Player){
        self.player = player
        self.active = true
    }
    func getColor() -> Color {
        self.player.color
    }
    func clear() {
        self.active = false
        self.player = NullPlayer()
    }
}
