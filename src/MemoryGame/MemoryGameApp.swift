//
//  MemoryGameApp.swift
//  MemoryGame
//
//  Created by lazarokcf on 5/15/22.
//
// https://www.png.utilidadeswebblog.com/2021/07/imagenes-de-mario-bros-en-png-con-fondo.html
import SwiftUI

@main
struct MemoryGameApp: App {
    var body: some Scene {
        WindowGroup {
            DifficultyRouter.view()
        }
    }
}
