//
//  SpeccyDetailViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

class SpeccyDetailViewModel: ObservableObject {
    
    let detailUseCase = DetailSpeccyUseCase(repository: SpeccyRepositoryImpl(dataSource: SpeccyAPIImpl()))
    private var url: String
    @Published var speccy: SpeccyModel = SpeccyModel.NullObject
    @Published var errorMessage = ""
    @Published var hasError = false
    
    init(url: String) {
        self.url = url
    }
    
    func detail() {
        self.errorMessage = String.Empty
        detailUseCase.execute(url: self.url) {
            switch $0 {
            case .success(let speccy):
                self.speccy = speccy
            case .failure(let error):
                self.speccy = SpeccyModel.NullObject
                self.errorMessage = error.localizedDescription
                self.hasError = true
            }
        }
    }
}
