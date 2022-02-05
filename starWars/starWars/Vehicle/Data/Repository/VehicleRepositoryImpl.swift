//
//  VehicleRepositoryImpl.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct VehicleRepositoryImpl: VehicleRepository {

    var dataSource: VehicleDataSource

    func page(url: String, completion: @escaping (VehicleListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.page(url: url, completion: completion, failure: failure)
    }

    func search(completion: @escaping (VehicleListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.search(completion: completion, failure: failure)
    }

    func search(value: String, completion: @escaping (VehicleListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.search(value: value, completion: completion, failure: failure)
    }

    func detail(url: String, completion: @escaping (VehicleModel) -> Void, failure: @escaping (Error) -> Void) {
        self.dataSource.detail(url: url, completion: completion, failure: failure)
    }
}
