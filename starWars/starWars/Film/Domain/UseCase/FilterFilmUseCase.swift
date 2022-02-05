//
//  FilterFilmUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol FilterFilm {
    func execute(value: String, result: @escaping (Result<FilmListModel, UseCaseException>) -> Void)
}

struct FilterFilmUseCase: FilterFilm {
    
    var repository: FilmRepository
    
    func execute(value: String, result: @escaping (Result<FilmListModel, UseCaseException>) -> Void) {
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
