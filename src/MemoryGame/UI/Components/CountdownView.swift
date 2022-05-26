//
//  CountdownView.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/18/22.
//

import Foundation
import SwiftUI
import Combine

struct CountdownView: View {
    
    @Binding var timeRemaining: Int
    
    var body: some View {
        ZStack{
            VStack{
                Text("Time: \(counterToMinutes())")
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
            }
        }
    }
    
    private func counterToMinutes() -> String {
        let currentTime = timeRemaining
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}


struct CountdownView_Previews: PreviewProvider {
    static var previews: some View {
        CountdownView(timeRemaining: .constant(60))
    }
}
