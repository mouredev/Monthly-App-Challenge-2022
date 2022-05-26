//
//  DifficultyLevelButtonStyle.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/25/22.
//

import SwiftUI

extension Text {
    
    func withDifficultyLevelButtonStyle(width: CGFloat) -> some View {
        self.font(.title2)
            .padding()
            .frame(maxWidth: width / 2)
            .foregroundColor(.white)
            .background(Color.blue)
            .border(Color.white)
            .overlay(
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.white, lineWidth: 2))
    }
}
