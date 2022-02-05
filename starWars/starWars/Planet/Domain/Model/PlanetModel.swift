//
//  Planet.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct PlanetModel: Identifiable {
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
    var url: String
    
    init(entity: PlanetAPIEntity) {
        self.init(name: entity.name, rotationPeriod: entity.rotationPeriod, orbitalPeriod: entity.orbitalPeriod, diameter: entity.diameter, climate: entity.climate, gravity: entity.gravity, terrain: entity.terrain, surfaceWater: entity.surfaceWater, population: entity.population, residents: entity.residents, films: entity.films, url: entity.url)
    }

    internal init(name: String, rotationPeriod: String, orbitalPeriod: String, diameter: String, climate: String, gravity: String, terrain: String, surfaceWater: String, population: String, residents: [String], films: [String], url: String) {
        self.name = name
        self.rotationPeriod = rotationPeriod
        self.orbitalPeriod = orbitalPeriod
        self.diameter = diameter
        self.climate = climate
        self.gravity = gravity
        self.terrain = terrain
        self.surfaceWater = surfaceWater
        self.population = population
        self.residents = residents
        self.films = films
        self.url = url
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
        url: String.Empty)
}
