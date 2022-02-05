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

    init(entity: FilmListAPIEntity) {
        self.init(count: entity.count, next: entity.next ?? String.Empty, previous: entity.previous ?? String.Empty, results: [])
        entity.results.forEach {
            self.results.append(FilmModel(entity: $0))
        }
    }

    internal init(count: Int, next: String, previous: String, results: [FilmModel]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

extension FilmListModel {
    static let NullObject: FilmListModel = FilmListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
