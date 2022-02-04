//
//  PagePeopleUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol PagePeople {
    func execute(url: String, result: @escaping (Result<PeopleListModel, UseCaseException>) -> Void)
}

struct PagePeopleUseCase: PagePeople {
    
    var repository: PeopleRepository
    
    func execute(url: String, result: @escaping (Result<PeopleListModel, UseCaseException>) -> Void) {
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
