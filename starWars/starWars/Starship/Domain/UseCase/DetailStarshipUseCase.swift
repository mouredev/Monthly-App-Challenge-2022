//
//  DetailStarshipUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol DetailStarship {
    func execute(url: String, result: @escaping (Result<StarshipModel, UseCaseException>) -> Void)
}

struct DetailStarshipUseCase: DetailStarship {
    
    var repository: StarshipRepository
    
    func execute(url: String, result: @escaping (Result<StarshipModel, UseCaseException>) -> Void) {
        repository.detail(
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
