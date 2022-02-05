//
//  StarshipDetailViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

class StarshipDetailViewModel: ObservableObject {
    
    let detailUseCase = DetailStarshipUseCase(repository: StarshipRepositoryImpl(dataSource: StarshipAPIImpl()))
    private var url: String
    @Published var starship: StarshipModel = StarshipModel.NullObject
    @Published var errorMessage = ""
    @Published var hasError = false
    
    init(url: String) {
        self.url = url
    }
    
    func detail() {
        self.errorMessage = String.Empty
        detailUseCase.execute(url: self.url) {
            switch $0 {
            case .success(let starship):
                self.starship = starship
            case .failure(let error):
                self.starship = StarshipModel.NullObject
                self.errorMessage = error.localizedDescription
                self.hasError = true
            }
        }
    }
}
