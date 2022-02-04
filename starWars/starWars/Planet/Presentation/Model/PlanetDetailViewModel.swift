//
//  PlanetDetailViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

class PlanetDetailViewModel: ObservableObject {
    
    @Published var planet: PlanetModel?
    @Published var errorMessage = ""
    @Published var hasError = false
}
