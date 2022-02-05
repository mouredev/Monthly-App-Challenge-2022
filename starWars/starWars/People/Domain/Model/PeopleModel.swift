//
//  People.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct PeopleModel: Identifiable {
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
    var url: String
    
    init(entity: PeopleAPIEntity){
        self.init(name: entity.name, height: entity.height, mass: entity.mass, hairColor: entity.hairColor, skinColor: entity.skinColor, eyeColor: entity.eyeColor, birthYear: entity.birthYear, gender: entity.gender, homeworld: entity.homeworld, films: entity.films, species: entity.species, vehicles: entity.vehicles, starships: entity.starships, url: entity.url)
    }
    
    internal init(name: String, height: String, mass: String, hairColor: String, skinColor: String, eyeColor: String, birthYear: String, gender: String, homeworld: String, films: [String], species: [String], vehicles: [String], starships: [String], url: String) {
        self.name = name
        self.height = height
        self.mass = mass
        self.hairColor = hairColor
        self.skinColor = skinColor
        self.eyeColor = eyeColor
        self.birthYear = birthYear
        self.gender = gender
        self.homeworld = homeworld
        self.films = films
        self.species = species
        self.vehicles = vehicles
        self.starships = starships
        self.url = url
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
        url: String.Empty)
}
