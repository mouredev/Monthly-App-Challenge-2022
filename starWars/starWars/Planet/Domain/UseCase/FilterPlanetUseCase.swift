//
//  FilterPlanetUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol FilterPlanet {
    func execute(value: String, result: @escaping (Result<PlanetListModel, UseCaseException>) -> Void)
}

struct FilterPlanetUseCase: FilterPlanet {
    
    var repository: PlanetRepository
    
    func execute(value: String, result: @escaping (Result<PlanetListModel, UseCaseException>) -> Void) {
        repository.search(
            value: value,
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
