//
//  PeopleListModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct PeopleListModel {
    var count: Int
    var next: String
    var previous: String
    var results: [PeopleModel]
}

extension PeopleListModel {
    static let Empty: PeopleListModel = PeopleListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
