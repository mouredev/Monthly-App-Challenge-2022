//  https://swdevnotes.com/swift/2021/flip-card-in-swiftui/
//  CardView.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/15/22.

import SwiftUI

final class CardModel: ObservableObject {
    @Published var isFaceUp = false
    @Published var discovered = false
    @Published var waiting = false
    @Published var image = ""
    @Published var x = -1
    @Published var y = -1
}


struct CardView: View {
    
    @ObservedObject var viewModel: CardBoardViewModel
    @ObservedObject var card: CardModel
    
    var axis:(CGFloat,CGFloat,CGFloat) = (0,1,0)
    
    var body: some View {
        VStack{
            
            if(card.isFaceUp){
                Image(card.image)
                    .resizable()
                    .scaledToFit()
                    .clipped()
                    .padding(10)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(card.isFaceUp ?
                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.white, Color.black]),
                                   startPoint: .bottomLeading,
                                   endPoint: .topTrailing) :
                        LinearGradient(gradient: Gradient(colors: [Color.blue, Color.blue, Color.black]),
                                       startPoint: .bottomLeading,
                                       endPoint: .topTrailing))
        .padding(5)
        .gesture(
            TapGesture()
                .onEnded { _ in
                    if !card.waiting && !card.discovered && !viewModel.locked(){
                        
                        withAnimation(.linear(duration: 0.2)){
                            card.isFaceUp.toggle()
                            card.waiting = true
                            viewModel.check(card: card, matrix: viewModel.matrix)
                        }
                    }
                }
        )
        .rotation3DEffect(
            Angle.degrees(card.isFaceUp ? 0: 180),
            axis: axis
        )
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(viewModel: CardBoardRouter.view(difficultyLevel: DifficultyLevel.easy).viewModel, card: CardModel())
    }
}
