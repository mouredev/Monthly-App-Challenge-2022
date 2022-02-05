//
//  Planet.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct PlanetModel: Codable, Identifiable {
    private(set) var id = UUID()
    var name: String
    var rotationPeriod: String
    var orbitalPeriod: String
    var diameter: String
    var climate: String
    var gravity: String
    var terrain: String
    var surfaceWater: String
    var population: String
    var residents: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
    
    private enum CodingKeys : String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate
        case gravity
        case terrain
        case surfaceWater = "surface_water"
        case population
        case residents
        case films
        case created
        case edited
        case url
    }
}

extension PlanetModel {
    static let NullObject: PlanetModel = PlanetModel.init(
        name: String.Empty,
        rotationPeriod: String.Empty,
        orbitalPeriod: String.Empty,
        diameter: String.Empty,
        climate: String.Empty,
        gravity: String.Empty,
        terrain: String.Empty,
        surfaceWater: String.Empty,
        population: String.Empty,
        residents: [],
        films: [],
        created: String.Empty,
        edited: String.Empty,
        url: String.Empty)
}
