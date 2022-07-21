//
//  CellView.swift
//  moureJanuary
//
//  Created by Diego Alberto Dominguez Herreros on 6/1/22.
//

import SwiftUI

protocol CellViewDelegate {
    func selectedCell(x: Int, y: Int)
}
struct CellView: View {
    
    //MARK - properties
    let x: Int
    let y: Int
    @ObservedObject var coordinate: Coordinate
    let delegate: CellViewDelegate?
    @State private var background = Color.white
    var body: some View {
        GeometryReader { metrics in
            let top: CGFloat = 5
            let height: CGFloat = metrics.size.height - (top *  2.0)
            let left: CGFloat = (metrics.size.width - height) / 2.0
            Button {
                self.click()
            } label: {
                Text(" ")
                    .frame(width: height, height: height)
                    .background(self.coordinate.getColor())
                    .animation(.easeInOut(duration: 0.5), value: self.coordinate.getColor())
                    .cornerRadius(height)
                    .padding(EdgeInsets(top: top, leading: left, bottom: top, trailing: left))
            }.accessibility(identifier: "buttonCell_\(x)_\(y)")
        }
    }
    
    // MARK: - Actions -
    private func click() -> Void
    {
        if let delegate = self.delegate {
            delegate.selectedCell(x: self.x, y: self.y)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(x: 0, y: 0, coordinate: Coordinate(x: 0, y: 0), delegate: nil)
    }
}
