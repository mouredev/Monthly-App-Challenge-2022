//
//  StarshipListViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

class StarshipListViewModel: ObservableObject {
    
    let allUseCase = AllStarshipUseCase(repository: StarshipRepositoryImpl(dataSource: StarshipAPIImpl()))
    let filterUserCase = FilterStarshipUseCase(repository: StarshipRepositoryImpl(dataSource: StarshipAPIImpl()))
    let pageUseCase = PageStarshipUseCase(repository: StarshipRepositoryImpl(dataSource: StarshipAPIImpl()))
    @Published var starships: StarshipListModel = StarshipListModel.Empty
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
            self.page(url: self.starships.next)
        }
    }
    
    func previous() {
        self.errorMessage = String.Empty
        if self.containPreviousPage() {
            self.page(url: self.starships.previous)
        }
    }
    
    private func page(url: String) {
        self.pageUseCase.execute(url: url) {
            self.response($0)
        }
    }
    
    private func response(_ result: Result<StarshipListModel, UseCaseException>) {
        switch result {
        case .success(let starships):
            self.starships = starships
        case .failure(let error):
            self.starships = StarshipListModel.Empty
            self.errorMessage = error.localizedDescription
            self.hasError = true
        }
    }
    
    func containNextPage() -> Bool {
        !self.starships.next.isEmpty
    }
    
    func containPreviousPage() -> Bool {
        !self.starships.previous.isEmpty
    }
}
