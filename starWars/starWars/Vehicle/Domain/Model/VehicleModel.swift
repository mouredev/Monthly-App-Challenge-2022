//
//  VehicleModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct VehicleModel: Codable, Identifiable {
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
    var vehicleClass: String
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
        case vehicleClass = "vehicle_class"
        case pilots
        case films
        case created
        case edited
        case url
    }
}

extension VehicleModel {
    static let NullObject: VehicleModel = VehicleModel(
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
        vehicleClass: String.Empty,
        pilots: [],
        films: [],
        created: String.Empty,
        edited: String.Empty,
        url: String.Empty)
}
