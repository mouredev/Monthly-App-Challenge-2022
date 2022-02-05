//
//  PlanetAPIEntity.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct PlanetListAPIEntity: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [PlanetModel]
}
