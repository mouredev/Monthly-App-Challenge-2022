//
//  SpeccyListModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct SpeccyListModel {

    var count: Int
    var next: String
    var previous: String
    var results: [SpeccyModel]

    init(entity: SpeccyListAPIEntity) {
        self.init(count: entity.count, next: entity.next ?? String.Empty, previous: entity.previous ?? String.Empty, results: [])
        entity.results.forEach {
            self.results.append(SpeccyModel(entity: $0))
        }
    }

    internal init(count: Int, next: String, previous: String, results: [SpeccyModel]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

extension SpeccyListModel {
    static let NullObject: SpeccyListModel = SpeccyListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
