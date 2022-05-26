//
//  BoardView.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/15/22.
//

import SwiftUI

struct BoardView: View {
    
    @ObservedObject var viewModel : CardBoardViewModel
    
    var body: some View
    {
        GeometryReader
        { geometry in
            self.build(geometry)
        }
        
    }
    
    private func buildRow(_ i: Int, _ width: CGFloat, _ height: CGFloat) -> some View{
        return HStack(spacing: 0) {
            ForEach(0..<viewModel.matrix[i].count, id: \.self) { j in
                CardView(viewModel: viewModel, card: viewModel.matrix[i][j])
                    .frame(width: width, height: height)
            }}
    }
    
    func build(_ geometry: GeometryProxy) -> some View
    {
        let width: CGFloat = CGFloat(geometry.size.width)/CGFloat(viewModel.matrix[0].count)
        let height: CGFloat = CGFloat(geometry.size.height)/CGFloat(viewModel.matrix.count)
        
        return VStack(spacing: 0) {
            ForEach(0..<viewModel.matrix.count, id: \.self) { i in
                buildRow(i, width, height)
            }}
    }
    
    struct BoardView_Previews: PreviewProvider {
        static var previews: some View {
            BoardView(viewModel: CardBoardRouter.view(difficultyLevel: DifficultyLevel.easy).viewModel)
                .previewInterfaceOrientation(.portrait)
        }
    }
}
