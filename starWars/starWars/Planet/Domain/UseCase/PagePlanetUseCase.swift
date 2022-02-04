//
//  PagePlanetUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol PagePlanet {
    func execute(url: String, result: @escaping (Result<PlanetListModel, UseCaseException>) -> Void)
}

struct PagePlanetUseCase: PagePlanet {
    
    var repository: PlanetRepository
    
    func execute(url: String, result: @escaping (Result<PlanetListModel, UseCaseException>) -> Void) {
        repository.page(
            url: url,
            completion: { data in
                result(.success(data))
            },
            failure: { error in
                switch (error) {
                case APIException.decodingError:
                    result(.failure(UseCaseException.decodingError))
                default:
                    result(.failure(UseCaseException.networkError))
                }
            })
    }
}
