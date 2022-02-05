//
//  FilmDetailViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

class FilmDetailViewModel: ObservableObject {
    
    let detailUseCase = DetailFilmUseCase(repository: FilmRepositoryImpl(dataSource: FilmAPIImpl()))
    private var url: String
    @Published var film: FilmModel = FilmModel.NullObject
    @Published var errorMessage = ""
    @Published var hasError = false
    
    init(url: String) {
        self.url = url
    }
    
    func detail() {
        self.errorMessage = String.Empty
        detailUseCase.execute(url: self.url) {
            switch $0 {
            case .success(let film):
                self.film = film
            case .failure(let error):
                self.film = FilmModel.NullObject
                self.errorMessage = error.localizedDescription
                self.hasError = true
            }
        }
    }
}
