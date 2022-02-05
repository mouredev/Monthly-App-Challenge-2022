//
//  FilmAPIEntity.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct FilmAPIEntity: Codable {
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
    var created: String
    var edited: String
    var url: String
    
    private enum CodingKeys : String, CodingKey {
        case title
        case episodeId = "episode_id"
        case openingCrawl = "opening_crawl"
        case director
        case producer
        case releaseDate = "release_date"
        case characters
        case planets
        case starships
        case vehicles
        case species
        case created
        case edited
        case url
    }
}
