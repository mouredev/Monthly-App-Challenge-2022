//
//  StarshipListViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

class StarshipListViewModel: ObservableObject {
    
    @Published var starships: StarshipListModel?
    @Published var errorMessage = ""
    @Published var hasError = false
}
