//
//  PlanetListViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

class PlanetListViewModel: ObservableObject {
    
    let allUseCase = AllPlanetUseCase(repository: PlanetRepositoryImpl(dataSource: PlanetAPIImpl()))
    let filterUserCase = FilterPlanetUseCase(repository: PlanetRepositoryImpl(dataSource: PlanetAPIImpl()))
    let pageUseCase = PagePlanetUseCase(repository: PlanetRepositoryImpl(dataSource: PlanetAPIImpl()))
    @Published var planets: PlanetListModel = PlanetListModel.Empty
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
            self.page(url: self.planets.next)
        }
    }
    
    func previous() {
        self.errorMessage = String.Empty
        if self.containPreviousPage() {
            self.page(url: self.planets.previous)
        }
    }
    
    private func page(url: String) {
        self.pageUseCase.execute(url: url) {
            self.response($0)
        }
    }
    
    private func response(_ result: Result<PlanetListModel, UseCaseException>) {
        switch result {
        case .success(let planets):
            self.planets = planets
        case .failure(let error):
            self.planets = PlanetListModel.Empty
            self.errorMessage = error.localizedDescription
            self.hasError = true
        }
    }
    
    func containNextPage() -> Bool {
        !self.planets.next.isEmpty
    }
    
    func containPreviousPage() -> Bool {
        !self.planets.previous.isEmpty
    }
}
