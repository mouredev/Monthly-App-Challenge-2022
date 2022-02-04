//
//  AllPlanetUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol AllPlanet {
    func execute(result: @escaping (Result<PlanetListModel, UseCaseException>) -> Void)
}

struct AllPlanetUseCase: AllPlanet {
    
    var repository: PlanetRepository
    
    func execute(result: @escaping (Result<PlanetListModel, UseCaseException>) -> Void) {
        repository.search(
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
