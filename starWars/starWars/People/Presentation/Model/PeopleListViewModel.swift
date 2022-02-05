//
//  PeopleListViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

class PeopleListViewModel: ObservableObject {
    
    let allUseCase = AllPeopleUseCase(repository: PeopleRepositoryImpl(dataSource: PeopleAPIImpl()))
    let filterUserCase = FilterPeopleUseCase(repository: PeopleRepositoryImpl(dataSource: PeopleAPIImpl()))
    let pageUseCase = PagePeopleUseCase(repository: PeopleRepositoryImpl(dataSource: PeopleAPIImpl()))
    @Published var peoples: PeopleListModel = PeopleListModel.Empty
    @Published var errorMessage = String.Empty
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
            self.page(url: self.peoples.next)
        }
    }
    
    func previous() {
        self.errorMessage = String.Empty
        if self.containPreviousPage() {
            self.page(url: self.peoples.previous)
        }
    }
    
    private func page(url: String) {
        self.pageUseCase.execute(url: url) {
            self.response($0)
        }
    }
    
    private func response(_ result: Result<PeopleListModel, UseCaseException>) {
        switch result {
        case .success(let peoples):
            self.peoples = peoples
        case .failure(let error):
            self.peoples = PeopleListModel.Empty
            self.errorMessage = error.localizedDescription
            self.hasError = true
        }
    }
    
    func containNextPage() -> Bool {
        !self.peoples.next.isEmpty
    }
    
    func containPreviousPage() -> Bool {
        !self.peoples.previous.isEmpty
    }
}
