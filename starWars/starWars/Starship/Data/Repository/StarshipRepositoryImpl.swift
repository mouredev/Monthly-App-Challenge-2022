//
//  StarshipRepositoryImpl.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct StarshipRepositoryImpl: StarshipRepository {

    var dataSource: StarshipDataSource

    func page(url: String, completion: @escaping (StarshipListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.page(url: url, completion: completion, failure: failure)
    }

    func search(completion: @escaping (StarshipListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.search(completion: completion, failure: failure)
    }

    func search(value: String, completion: @escaping (StarshipListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.search(value: value, completion: completion, failure: failure)
    }

    func detail(url: String, completion: @escaping (StarshipModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.detail(url: url, completion: completion, failure: failure)
    }
}
