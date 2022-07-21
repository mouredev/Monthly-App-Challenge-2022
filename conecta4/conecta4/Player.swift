//
//  Player.swift
//  moureJanuary
//
//  Created by Diego Alberto Dominguez Herreros on 6/1/22.
//

import SwiftUI

class Player: ObservableObject {
    let color: Color
    let name: String
    @Published var wins: Int
    init (color: Color, name: String) {
        self.color = color
        self.name = name
        self.wins = 0
    }
    func win() {
        self.wins += 1
    }
}
