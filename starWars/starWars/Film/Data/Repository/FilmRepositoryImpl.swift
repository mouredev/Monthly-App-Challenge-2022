//
//  FilmRepositoryImpl.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct FilmRepositoryImpl: FilmRepository {

    var dataSource: FilmDataSource

    func page(url: String, completion: @escaping (FilmListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.page(url: url, completion: completion, failure: failure)
    }

    func search(completion: @escaping (FilmListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.search(completion: completion, failure: failure)
    }

    func search(value: String, completion: @escaping (FilmListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.search(value: value, completion: completion, failure: failure)
    }

    func detail(url: String, completion: @escaping (FilmModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.detail(url: url, completion: completion, failure: failure)
    }
}
