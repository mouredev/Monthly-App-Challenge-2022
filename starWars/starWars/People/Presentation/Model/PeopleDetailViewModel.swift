//
//  PeopleDetailViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

class PeopleDetailViewModel: ObservableObject {
    
    let detailUseCase = DetailPeopleUseCase(repository: PeopleRepositoryImpl(dataSource: PeopleAPIImpl()))
    private var url: String
    @Published var people: PeopleModel = PeopleModel.NullObject
    @Published var errorMessage = ""
    @Published var hasError = false
    
    init(url: String) {
        self.url = url
    }
    
    func detail() {
        self.errorMessage = String.Empty
        detailUseCase.execute(url: self.url) {
            switch $0 {
            case .success(let people):
                self.people = people
            case .failure(let error):
                self.people = PeopleModel.NullObject
                self.errorMessage = error.localizedDescription
                self.hasError = true
            }
        }
    }
}
