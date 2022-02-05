//
//  PlanetDetailViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

class PlanetDetailViewModel: ObservableObject {
    
    let detailUseCase = DetailPlanetUseCase(repository: PlanetRepositoryImpl(dataSource: PlanetAPIImpl()))
    private var url: String
    @Published var planet: PlanetModel = PlanetModel.NullObject
    @Published var errorMessage = ""
    @Published var hasError = false
    
    init(url: String) {
        self.url = url
    }
    
    func detail() {
        self.errorMessage = String.Empty
        detailUseCase.execute(url: self.url) {
            switch $0 {
            case .success(let planet):
                self.planet = planet
            case .failure(let error):
                self.planet = PlanetModel.NullObject
                self.errorMessage = error.localizedDescription
                self.hasError = true
            }
        }
    }
}
