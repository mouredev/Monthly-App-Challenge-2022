//
//  PlanetListModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct PlanetListModel {
    var count: Int
    var next: String
    var previous: String
    var results: [PlanetModel]
    
    init(entity: PlanetListAPIEntity) {
        self.init(count: entity.count, next: entity.next ?? String.Empty, previous: entity.previous ?? String.Empty, results: [])
        entity.results.forEach {
            self.results.append(PlanetModel(entity: $0))
        }
    }

    internal init(count: Int, next: String, previous: String, results: [PlanetModel]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

extension PlanetListModel {
    static let NullObject: PlanetListModel = PlanetListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
