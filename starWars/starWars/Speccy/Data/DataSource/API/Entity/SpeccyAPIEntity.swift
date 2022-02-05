//
//  SpeccyAPIEntity.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct SpeccyAPIEntity: Codable {
    var name: String
    var classification: String
    var designation: String
    var averageHeight: String
    var skinColors: String
    var hairColors: String
    var eyeColors: String
    var averageLifespan: String
    var homeworld: String?
    var language: String
    var people: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String

    private enum CodingKeys : String, CodingKey {
        case name
        case classification
        case designation
        case averageHeight = "average_height"
        case skinColors = "skin_colors"
        case hairColors = "hair_colors"
        case eyeColors = "eye_colors"
        case averageLifespan = "average_lifespan"
        case homeworld
        case language
        case people
        case films
        case created
        case edited
        case url
    }
}
