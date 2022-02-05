//
//  SpeccyModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct SpeccyModel: Identifiable {

    private(set) var id = UUID()
    var name: String
    var classification: String
    var designation: String
    var averageHeight: String
    var skinColors: String
    var hairColors: String
    var eyeColors: String
    var averageLifespan: String
    var homeworld: String
    var language: String
    var people: [String]
    var films: [String]
    var url: String

    init(entity: SpeccyAPIEntity) {
        self.init(name: entity.name, classification: entity.classification, designation: entity.designation, averageHeight: entity.averageHeight, skinColors: entity.skinColors, hairColors: entity.hairColors, eyeColors: entity.eyeColors, averageLifespan: entity.averageLifespan, homeworld: entity.homeworld ?? String.Empty, language: entity.language, people: entity.people, films: entity.films, url: entity.url)
    }

    internal init(name: String, classification: String, designation: String, averageHeight: String, skinColors: String, hairColors: String, eyeColors: String, averageLifespan: String, homeworld: String, language: String, people: [String], films: [String], url: String) {
        self.name = name
        self.classification = classification
        self.designation = designation
        self.averageHeight = averageHeight
        self.skinColors = skinColors
        self.hairColors = hairColors
        self.eyeColors = eyeColors
        self.averageLifespan = averageLifespan
        self.homeworld = homeworld
        self.language = language
        self.people = people
        self.films = films
        self.url = url
    }
}

extension SpeccyModel {
    static let NullObject: SpeccyModel = SpeccyModel(
        name: String.Empty,
        classification: String.Empty,
        designation: String.Empty,
        averageHeight: String.Empty,
        skinColors: String.Empty,
        hairColors: String.Empty,
        eyeColors: String.Empty,
        averageLifespan: String.Empty,
        homeworld: String.Empty,
        language: String.Empty,
        people: [],
        films: [],
        url: String.Empty)
}
