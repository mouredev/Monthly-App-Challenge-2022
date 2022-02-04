//
//  FilterPeopleUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol FilterPeople {
    func execute(value: String, result: @escaping (Result<PeopleListModel, UseCaseException>) -> Void)
}

struct FilterPeopleUseCase: FilterPeople {
    
    var repository: PeopleRepository
    
    func execute(value: String, result: @escaping (Result<PeopleListModel, UseCaseException>) -> Void) {
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
