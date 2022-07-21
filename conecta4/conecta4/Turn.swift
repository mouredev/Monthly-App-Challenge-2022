//
//  Turn.swift
//  moureJanuary
//
//  Created by Diego Alberto Dominguez Herreros on 6/1/22.
//

import Foundation

class Turn: ObservableObject {
    @Published var player: Player
    private let local = LocalPlayer()
    private let away = AwayPlayer()
    init() {
        self.player = self.local
    }
    func next() {
        if self.player === self.local {
            self.player = self.away
        } else {
            self.player = self.local
        }
    }
    func win() {
        self.player.win()
    }
    func isTurnLocal() -> Bool{
        self.player === self.local
    }
    func localWins() -> Int {
        return self.local.wins
    }
    func awayWins() -> Int {
        return self.away.wins
    }
}
