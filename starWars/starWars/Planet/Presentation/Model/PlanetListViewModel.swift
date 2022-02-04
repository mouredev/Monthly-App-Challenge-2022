//
//  PlanetListViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

class PlanetListViewModel: ObservableObject {
    
    @Published var planets: PlanetListModel?
    @Published var errorMessage = ""
    @Published var hasError = false
    
}
