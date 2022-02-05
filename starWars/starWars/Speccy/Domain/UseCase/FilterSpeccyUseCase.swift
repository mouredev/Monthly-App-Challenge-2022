//
//  FilterSpeccyUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol FilterSpeccy {
    func execute(value: String, result: @escaping (Result<SpeccyListModel, UseCaseException>) -> Void)
}

struct FilterSpeccyUseCase: FilterSpeccy {
    
    var repository: SpeccyRepository
    
    func execute(value: String, result: @escaping (Result<SpeccyListModel, UseCaseException>) -> Void) {
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
