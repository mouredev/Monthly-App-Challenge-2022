//
//  FilmListModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct FilmListModel {
    var count: Int
    var next: String
    var previous: String
    var results: [FilmModel]
}

extension FilmListModel {
    static let NullObject: FilmListModel = FilmListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
