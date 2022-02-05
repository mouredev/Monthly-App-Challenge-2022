//
//  FilmListAPIEntity.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct FilmListAPIEntity: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [FilmAPIEntity]
}
