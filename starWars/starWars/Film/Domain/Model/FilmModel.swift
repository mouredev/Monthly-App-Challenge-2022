//
//  FilmModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct FilmModel: Identifiable {

    private(set) var id = UUID()
    var title: String
    var episodeId: Int
    var openingCrawl: String
    var director: String
    var producer: String
    var releaseDate: String
    var characters: [String]
    var planets: [String]
    var starships: [String]
    var vehicles: [String]
    var species: [String]
    var url: String

    init(entity: FilmAPIEntity) {
        self.init(title: entity.title, episodeId: entity.episodeId, openingCrawl: entity.openingCrawl, director: entity.director, producer: entity.producer, releaseDate: entity.releaseDate, characters: entity.characters, planets: entity.planets, starships: entity.starships, vehicles: entity.vehicles, species: entity.species, url: entity.url)
    }

    internal init(title: String, episodeId: Int, openingCrawl: String, director: String, producer: String, releaseDate: String, characters: [String], planets: [String], starships: [String], vehicles: [String], species: [String], url: String) {
        self.title = title
        self.episodeId = episodeId
        self.openingCrawl = openingCrawl
        self.director = director
        self.producer = producer
        self.releaseDate = releaseDate
        self.characters = characters
        self.planets = planets
        self.starships = starships
        self.vehicles = vehicles
        self.species = species
        self.url = url
    }
}

extension FilmModel {
    static let NullObject: FilmModel = FilmModel(
        title: String.Empty,
        episodeId: Int.zero,
        openingCrawl: String.Empty,
        director: String.Empty,
        producer: String.Empty,
        releaseDate: String.Empty,
        characters: [],
        planets: [],
        starships: [],
        vehicles: [],
        species: [],
        url: String.Empty)
}
