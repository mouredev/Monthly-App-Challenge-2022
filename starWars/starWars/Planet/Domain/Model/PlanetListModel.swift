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
}

extension PlanetListModel {
    static let NullObject: PlanetListModel = PlanetListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
