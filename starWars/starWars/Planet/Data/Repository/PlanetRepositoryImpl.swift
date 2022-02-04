//
//  PlanetRepositoryImpl.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct PlanetRepositoryImpl: PlanetRepository {

    var dataSource: PlanetDataSource

    func page(url: String, completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.page(url: url, completion: completion, failure: failure)
    }

    func search(completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.search(completion: completion, failure: failure)
    }

    func search(value: String, completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.search(value: value, completion: completion, failure: failure)
    }
}
