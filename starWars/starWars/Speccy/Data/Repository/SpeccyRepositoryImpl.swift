//
//  SpeccyRepositoryImpl.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct SpeccyRepositoryImpl: SpeccyRepository {

    var dataSource: SpeccyDataSource

    func page(url: String, completion: @escaping (SpeccyListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.page(url: url, completion: completion, failure: failure)
    }

    func search(completion: @escaping (SpeccyListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.search(completion: completion, failure: failure)
    }

    func search(value: String, completion: @escaping (SpeccyListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.search(value: value, completion: completion, failure: failure)
    }

    func detail(url: String, completion: @escaping (SpeccyModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.detail(url: url, completion: completion, failure: failure)
    }
}
