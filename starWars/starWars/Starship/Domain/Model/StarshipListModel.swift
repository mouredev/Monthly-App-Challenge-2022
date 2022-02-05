//
//  StarshipListModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct StarshipListModel {
    var count: Int
    var next: String
    var previous: String
    var results: [StarshipModel]

    init(entity: StarshipListAPIEntity) {
        self.init(count: entity.count, next: entity.next ?? String.Empty, previous: entity.previous ?? String.Empty, results: [])
        entity.results.forEach {
            self.results.append(StarshipModel(entity: $0))
        }
    }

    internal init(count: Int, next: String, previous: String, results: [StarshipModel]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

extension StarshipListModel {
    static let NullObject: StarshipListModel = StarshipListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
