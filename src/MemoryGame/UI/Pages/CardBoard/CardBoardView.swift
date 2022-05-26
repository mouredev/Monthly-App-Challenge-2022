//
//  CardBoardView.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/15/22.
//

import SwiftUI

struct CardBoardView: View {
    
    @StateObject var viewModel: CardBoardViewModel
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        
        let menuButton = Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }, label: {
            Text("Menu")
                .font(.title3)
                .foregroundColor(.blue)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.blue, lineWidth: 1)
                )
        })
        
        let menuRepeat =  Button(action: {
            viewModel.initializeBoard()
        }, label: {
            Text("Repeat")
                .font(.title3)
                .foregroundColor(.blue)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(Color.blue, lineWidth: 1)
                )
        })
        
        VStack(){
            
            GeometryReader { metrics in
                
                VStack(spacing: 0) {
                    
                    HStack(spacing: 0) {
                        
                        menuButton.frame(width: metrics.size.width * 0.3, height: 50)
                        
                        viewModel.countdownView(timeRemaining: $viewModel.timeRemaining).frame(width: metrics.size.width * 0.4, height: 50)
                        
                        menuRepeat.frame(width: metrics.size.width * 0.3, height: 50)
                        
                    }
                    
                    HStack(spacing: 0) {
                        
                        VStack{
                            Text("Turns")
                            Text("\(viewModel.totalMoves())").fontWeight(.semibold).foregroundColor(.blue)
                        }.frame(width: metrics.size.width * 0.5, height: 50)
                        
                        VStack{
                            Text("Remaining matches")
                            Text("\(viewModel.couplesToDiscover())").fontWeight(.semibold).foregroundColor(.blue)
                        }.frame(width: metrics.size.width * 0.5, height: 50)
                        
                    }
                    
                    viewModel.boardView()
                        .frame(width: metrics.size.width, height: metrics.size.height - 100)
                }
                
            }
        }
        .navigationBarHidden(true)
        .onAppear() {
            viewModel.initializeBoard()
        }
        .popup(isPresented: $viewModel.winner, dragToDismiss: false, closeOnTap: false, closeOnTapOutside: false) {
            ZStack {
                Color.black.frame(maxWidth: .infinity, maxHeight: .infinity).opacity(0.8)
                VStack{
                    Text("WINNER!").foregroundColor(.green)
                    
                    HStack{
                        menuRepeat
                        menuButton
                    }
                }.padding(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.green, lineWidth: 5)
                    )
                    .background(.white)
                    .cornerRadius(10)
                
            }.ignoresSafeArea()
        }
        
        .popup(isPresented: $viewModel.timeOut, dragToDismiss: false, closeOnTap: false, closeOnTapOutside: false) {
            ZStack {
                Color.black.frame(maxWidth: .infinity, maxHeight: .infinity).opacity(0.8)
                VStack{
                    Text("TIME OUT!").foregroundColor(.red)
                    
                    HStack{
                        menuRepeat
                        menuButton
                    }
                }.padding(25)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.red, lineWidth: 5)
                    )
                    .background(.white)
                    .cornerRadius(10)
                
            }.ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
    }
}

struct CardBoardView_Previews: PreviewProvider {
    static var previews: some View {
        CardBoardRouter.view(difficultyLevel: DifficultyLevel.easy)
    }
}
