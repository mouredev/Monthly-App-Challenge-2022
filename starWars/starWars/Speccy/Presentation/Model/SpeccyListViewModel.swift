//
//  SpeccyListViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

class SpeccyListViewModel: ObservableObject {
    
    let allUseCase = AllSpeccyUseCase(repository: SpeccyRepositoryImpl(dataSource: SpeccyAPIImpl()))
    let filterUserCase = FilterSpeccyUseCase(repository: SpeccyRepositoryImpl(dataSource: SpeccyAPIImpl()))
    let pageUseCase = PageSpeccyUseCase(repository: SpeccyRepositoryImpl(dataSource: SpeccyAPIImpl()))
    @Published var species: SpeccyListModel = SpeccyListModel.NullObject
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
            self.page(url: self.species.next)
        }
    }
    
    func previous() {
        self.errorMessage = String.Empty
        if self.containPreviousPage() {
            self.page(url: self.species.previous)
        }
    }
    
    private func page(url: String) {
        self.pageUseCase.execute(url: url) {
            self.response($0)
        }
    }
    
    private func response(_ result: Result<SpeccyListModel, UseCaseException>) {
        switch result {
        case .success(let species):
            self.species = species
        case .failure(let error):
            self.species = SpeccyListModel.NullObject
            self.errorMessage = error.localizedDescription
            self.hasError = true
        }
    }
    
    func containNextPage() -> Bool {
        !self.species.next.isEmpty
    }
    
    func containPreviousPage() -> Bool {
        !self.species.previous.isEmpty
    }
}
