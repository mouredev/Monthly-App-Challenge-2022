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
            switch $0 {
            case .success(let result):
                self.peoples = result
            case .failure(let error):
                self.peoples = PeopleListModel.Empty
                self.errorMessage = error.localizedDescription
                self.hasError = true
            }
        }
    }
}
