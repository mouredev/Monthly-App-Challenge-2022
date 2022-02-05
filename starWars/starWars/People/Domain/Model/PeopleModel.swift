//
//  People.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct PeopleModel: Codable, Identifiable {
    private(set) var id = UUID()
    var name: String
    var height: String
    var mass: String
    var hairColor: String
    var skinColor: String
    var eyeColor: String
    var birthYear: String
    var gender: String
    var homeworld: String
    var films: [String]
    var species: [String]
    var vehicles: [String]
    var starships: [String]
    var created: String
    var edited: String
    var url: String
    
    private enum CodingKeys : String, CodingKey {
        case name
        case height
        case mass
        case hairColor = "hair_color"
        case skinColor = "skin_color"
        case eyeColor = "eye_color"
        case birthYear = "birth_year"
        case gender
        case homeworld
        case films
        case species
        case vehicles
        case created
        case starships
        case edited
        case url
    }
}

extension PeopleModel {
    static let NullObject: PeopleModel = PeopleModel.init(
        name: String.Empty,
        height: String.Empty,
        mass: String.Empty,
        hairColor: String.Empty,
        skinColor: String.Empty,
        eyeColor: String.Empty,
        birthYear: String.Empty,
        gender: String.Empty,
        homeworld: String.Empty,
        films: [],
        species: [],
        vehicles: [],
        starships: [],
        created: String.Empty,
        edited: String.Empty,
        url: String.Empty)
}
