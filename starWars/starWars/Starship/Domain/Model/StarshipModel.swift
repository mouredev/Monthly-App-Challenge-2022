//
//  Starship.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct StarshipModel: Codable, Identifiable {
    private(set) var id = UUID()
    var name: String
    var model: String
    var manufacturer: String
    var costInCredits: String
    var length: String
    var maxAtmospheringSpeed: String
    var crew: String
    var passengers: String
    var cargoCapacity: String
    var consumables: String
    var hyperdriveRating: String
    var MGLT: String
    var starshipClass: String
    var pilots: [String]
    var films: [String]
    var created: String
    var edited: String
    var url: String
    
    private enum CodingKeys : String, CodingKey {
        case name
        case model
        case manufacturer
        case costInCredits = "cost_in_credits"
        case length
        case maxAtmospheringSpeed = "max_atmosphering_speed"
        case crew
        case passengers
        case cargoCapacity = "cargo_capacity"
        case consumables
        case hyperdriveRating = "hyperdrive_rating"
        case MGLT
        case starshipClass = "starship_class"
        case pilots
        case films
        case created
        case edited
        case url
    }
}

extension StarshipModel {
    static let NullObject: StarshipModel = StarshipModel.init(
        name: String.Empty,
        model: String.Empty,
        manufacturer: String.Empty,
        costInCredits: String.Empty,
        length: String.Empty,
        maxAtmospheringSpeed: String.Empty,
        crew: String.Empty,
        passengers: String.Empty,
        cargoCapacity: String.Empty,
        consumables: String.Empty,
        hyperdriveRating: String.Empty,
        MGLT: String.Empty,
        starshipClass: String.Empty,
        pilots: [],
        films: [],
        created: String.Empty,
        edited: String.Empty,
        url: String.Empty)
}
