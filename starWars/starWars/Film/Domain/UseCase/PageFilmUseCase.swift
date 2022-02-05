//
//  PageFilmUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol PageFilm {
    func execute(url: String, result: @escaping (Result<FilmListModel, UseCaseException>) -> Void)
}

struct PageFilmUseCase: PageFilm {
    
    var repository: FilmRepository
    
    func execute(url: String, result: @escaping (Result<FilmListModel, UseCaseException>) -> Void) {
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
