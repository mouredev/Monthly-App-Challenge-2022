//
//  AllFilmUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol AllFilm {
    func execute(result: @escaping (Result<FilmListModel, UseCaseException>) -> Void)
}

struct AllFilmUseCase: AllFilm {
    
    var repository: FilmRepository
    
    func execute(result: @escaping (Result<FilmListModel, UseCaseException>) -> Void) {
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
