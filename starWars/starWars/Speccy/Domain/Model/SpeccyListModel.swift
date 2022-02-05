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
}

extension SpeccyListModel {
    static let NullObject: SpeccyListModel = SpeccyListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
