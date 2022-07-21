//
//  ContentView.swift
//  conecta4
//
//  Created by Diego Alberto Dominguez Herreros on 11/1/22.
//

import SwiftUI

struct ContentView: View {
    private static let height = 6
        private static let width = 7
        @ObservedObject var board: Board = Board(height: ContentView.height, width: ContentView.width)
        @ObservedObject private var turn: Turn = Turn()
        @State private var showingWinAlert = false
        @State private var showingAlert = false
        
        var icon: some View {
            Image("conecta4")
                .resizable()
                .scaledToFit()
                .opacity(0.2)
                .accessibility(identifier: "image")
        }
        
        func printPlayers() -> some View {
            return HStack(spacing: CGFloat.zero) {
                Spacer().frame(width: 8)
                HStack(spacing: CGFloat.zero) {
                    self.printColorIcon(LocalPlayer().color)
                        .accessibility(identifier: "localWinsIcon")
                    Text(": \(self.turn.localWins())")
                        .accessibility(identifier: "localWins")
                }
                Spacer()
                HStack(spacing: CGFloat.zero){
                    self.printColorIcon(AwayPlayer().color).accessibility(identifier: "awayWinsIcon")
                    Text(": \(self.turn.awayWins())")
                        .accessibility(identifier: "awayWins")
                }
                Spacer().frame(width: 8)
            }
        }

        func printColorIcon(_ color: Color) -> some View {
            Text("").frame(width: 16, height: 16)
                .background(color)
                .cornerRadius(16)
        }
        
        func printButton(width: CGFloat) -> some View {
            Button {
                if !self.board.boardEmpty() {
                    showingAlert = true
                }
            } label: {
                Text("New game")
                    .frame(width: width, height: 40.0)
            }.foregroundColor(.white)
                .background(.blue)
                .alert(
                    Text("Do you want to start a new game?"),
                    isPresented: $showingAlert) {
                        Button("Ok") {
                            showingAlert = false
                            self.board.clear()
                        }
                        Button("Cancel") {
                            showingAlert = false
                        }
                    }.accessibility(identifier: "buttonNewGame")
        }
        
        func printSingleLine(width: CGFloat) -> some View {
            Text("")
                .frame(width: width, height: 1.0)
                .background(self.turn.player.color.opacity(0.5))
                .animation(.easeInOut(duration: 0.5), value: self.turn.player.color)
                .accessibility(identifier: "singleLine")
        }
        
        func printBoard(size: CGSize) -> some View {
            let itemSize = size.width/CGFloat(self.board.width)
            return HStack(alignment: .center, spacing: 2) {
                self.printColumns(itemSize: itemSize)
            }.frame(
                width: itemSize * CGFloat(self.board.width),
                height: itemSize * CGFloat(self.board.height)
            ).background(self.turn.player.color.opacity(0.5))
                .animation(.easeInOut(duration: 0.5), value: self.turn.player.color)
        }
        
        func printColumns(itemSize: CGFloat) -> some View {
            ForEach(0 ..< ContentView.width) { j in
                VStack(alignment: .center, spacing: 1) {
                    ForEach(0 ..< ContentView.height) { i in
                        self.printCell(x: i, y: j)
                    }
                }.frame(
                    width: itemSize-2,
                    alignment: .topLeading
                )
            }
        }
        
        func printCell(x: Int, y: Int) -> some View {
            return CellView(x: x, y: y, coordinate: self.board.get(x, y), delegate: self).background(.blue).cornerRadius(5)
        }
        
        var body: some View {
            GeometryReader { metrics in
                VStack(alignment: .center, spacing: CGFloat.zero){
                    ZStack(alignment: Alignment.top) {
                        self.icon
                        self.printPlayers()
                    }
                    Spacer()
                    //self.printTurn()
                    self.printButton(width: metrics.size.width)
                    self.printSingleLine(width: metrics.size.width)
                    self.printBoard(size: metrics.size)
                    self.printSingleLine(width: metrics.size.width)
                }.background(.white)
                .alert(
                    Text("Player \(self.turn.player.name) WIN!!!"),
                    isPresented: $showingWinAlert) {
                        Button("New Game") {
                            showingWinAlert = false
                            self.turn.next()
                            self.board.clear()
                        }
                        Button("Cancel") {
                            showingWinAlert = false
                            self.turn.next()
                        }
                    }
            }
        }
        
        private func animation(coordinates: [Coordinate], index: Int){
            let coordinate = coordinates[index]
            coordinate.selected(self.turn.player)
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                if index < coordinates.count - 1 {
                    coordinate.clear()
                    self.animation(coordinates: coordinates, index: index + 1)
                } else {
                    if self.board.isWin(self.turn.player) {
                        self.turn.win()
                        self.showingWinAlert = true
                    } else {
                        self.turn.next()
                    }
                }
            }
        }
    }

    extension ContentView: CellViewDelegate {
        func selectedCell(x: Int, y: Int) {
            let coordinates = self.board.getAll(y)
            if coordinates.count > 0 {
                self.animation(coordinates: coordinates, index: 0)
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
