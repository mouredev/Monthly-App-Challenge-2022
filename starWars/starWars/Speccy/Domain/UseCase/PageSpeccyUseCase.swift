//
//  PageSpeccyUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol PageSpeccy {
    func execute(url: String, result: @escaping (Result<SpeccyListModel, UseCaseException>) -> Void)
}

struct PageSpeccyUseCase: PageSpeccy {
    
    var repository: SpeccyRepository
    
    func execute(url: String, result: @escaping (Result<SpeccyListModel, UseCaseException>) -> Void) {
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
