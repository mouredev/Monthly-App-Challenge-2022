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
}

extension StarshipListModel {
    static let Empty: StarshipListModel = StarshipListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
