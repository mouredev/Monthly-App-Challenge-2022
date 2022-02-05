//
//  VehicleListModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct VehicleListModel {
    var count: Int
    var next: String
    var previous: String
    var results: [VehicleModel]

    init(entity: VehicleListAPIEntity) {
        self.init(count: entity.count, next: entity.next ?? String.Empty, previous: entity.previous ?? String.Empty, results: [])
        entity.results.forEach {
            self.results.append(VehicleModel(entity: $0))
        }
    }

    internal init(count: Int, next: String, previous: String, results: [VehicleModel]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

extension VehicleListModel {
    static let NullObject: VehicleListModel = VehicleListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
