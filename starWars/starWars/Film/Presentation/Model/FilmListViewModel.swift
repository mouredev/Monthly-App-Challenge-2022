//
//  FilmListViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

class FilmListViewModel: ObservableObject {
    
    let allUseCase = AllFilmUseCase(repository: FilmRepositoryImpl(dataSource: FilmAPIImpl()))
    let filterUserCase = FilterFilmUseCase(repository: FilmRepositoryImpl(dataSource: FilmAPIImpl()))
    let pageUseCase = PageFilmUseCase(repository: FilmRepositoryImpl(dataSource: FilmAPIImpl()))
    @Published var films: FilmListModel = FilmListModel.NullObject
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func all() {
        self.errorMessage = String.Empty
        allUseCase.execute {
            self.response($0)
        }
    }
    
    func filter(value: String) {
        self.errorMessage = String.Empty
        filterUserCase.execute(value: value) {
            self.response($0)
        }
    }
    
    func next() {
        self.errorMessage = String.Empty
        if self.containNextPage() {
            self.page(url: self.films.next)
        }
    }
    
    func previous() {
        self.errorMessage = String.Empty
        if self.containPreviousPage() {
            self.page(url: self.films.previous)
        }
    }
    
    private func page(url: String) {
        self.pageUseCase.execute(url: url) {
            self.response($0)
        }
    }
    
    private func response(_ result: Result<FilmListModel, UseCaseException>) {
        switch result {
        case .success(let films):
            self.films = films
        case .failure(let error):
            self.films = FilmListModel.NullObject
            self.errorMessage = error.localizedDescription
            self.hasError = true
        }
    }
    
    func containNextPage() -> Bool {
        !self.films.next.isEmpty
    }
    
    func containPreviousPage() -> Bool {
        !self.films.previous.isEmpty
    }
}
