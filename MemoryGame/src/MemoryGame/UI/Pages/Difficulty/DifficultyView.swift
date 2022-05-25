//
//  DifficultyView.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/19/22.
//

import SwiftUI

struct DifficultyView: View {
    
    let uiscreen = UIScreen.main.bounds
    
    @StateObject var viewModel: DifficultyViewModel
    
    @State private var selection: String? = nil
    
    var body: some View {
        
        NavigationView{
            
            ZStack{
                
                Image("background03")
                    .resizable()
                    .scaledToFit()
                
                Rectangle()
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.blue, Color.white]),
                            startPoint: .top,
                            endPoint: .bottom))
                    .frame(width: self.uiscreen.width,
                           height: self.uiscreen.height,
                           alignment: .center)
                    .ignoresSafeArea(.all)
                    .opacity(0.9)
                
                VStack(spacing: 40){
                    VStack{
                        Text("Memory").font(.custom("Helvetica Neue", size: 60)).foregroundColor(Color.white)
                        Text("Game").font(.system(size: 40)).foregroundColor(Color.white)
                    }
                    .padding([.top], 50)
                    
                    VStack(spacing: 20){
                        
                        NavigationLink(
                            destination: viewModel.cardBoardView(difficultyLevel: DifficultyLevel.easy),
                            tag: "easy",
                            selection: $selection) {
                                EmptyView()
                            }
                        NavigationLink(
                            destination: viewModel.cardBoardView(difficultyLevel: DifficultyLevel.medium),
                            tag: "medium",
                            selection: $selection) {
                                EmptyView()
                            }
                        NavigationLink(
                            destination: viewModel.cardBoardView(difficultyLevel: DifficultyLevel.hard),
                            tag: "hard",
                            selection: $selection) {
                                EmptyView()
                            }
                        
                        
                        Button(action: {self.selection = "easy"}) {
                            Text("Easy").withDifficultyLevelButtonStyle(width: uiscreen.width)
                        }.cornerRadius(50)
                        
                        Button(action: {self.selection = "medium"}) {
                            Text("Medium").withDifficultyLevelButtonStyle(width: uiscreen.width)
                        }.cornerRadius(50)
                        
                        Button(action: {self.selection = "hard"}) {
                            Text("Hard").withDifficultyLevelButtonStyle(width: uiscreen.width)
                        }.cornerRadius(50)
                    }
                    
                    Spacer()
                }
            }
        }
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        DifficultyView(viewModel: DifficultyRouter.view().viewModel)
            .previewInterfaceOrientation(.portrait)
    }
}
