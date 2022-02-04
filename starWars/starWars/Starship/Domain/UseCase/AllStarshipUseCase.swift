//
//  AllStarshipUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol AllStarship {
    func execute(result: @escaping (Result<StarshipListModel, UseCaseException>) -> Void)
}

struct AllStarshipUseCase: AllStarship {
    
    var repository: StarshipRepository
    
    func execute(result: @escaping (Result<StarshipListModel, UseCaseException>) -> Void) {
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
