//
//  AllSpeccyUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol AllSpeccy {
    func execute(result: @escaping (Result<SpeccyListModel, UseCaseException>) -> Void)
}

struct AllSpeccyUseCase: AllSpeccy {
    
    var repository: SpeccyRepository
    
    func execute(result: @escaping (Result<SpeccyListModel, UseCaseException>) -> Void) {
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
