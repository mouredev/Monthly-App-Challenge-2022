//
//  AllPeopleUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol AllPeople {
    func execute(result: @escaping (Result<PeopleListModel, UseCaseException>) -> Void)
}

struct AllPeopleUseCase: AllPeople {
    
    var repository: PeopleRepository
    
    func execute(result: @escaping (Result<PeopleListModel, UseCaseException>) -> Void) {
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
