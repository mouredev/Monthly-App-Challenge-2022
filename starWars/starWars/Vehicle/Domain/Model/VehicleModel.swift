//
//  VehicleModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct VehicleModel: Identifiable {

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
    var url: String

    init(entity: VehicleAPIEntity) {
        self.init(name: entity.name, model: entity.model, manufacturer: entity.manufacturer, costInCredits: entity.costInCredits, length: entity.length, maxAtmospheringSpeed: entity.maxAtmospheringSpeed, crew: entity.crew, passengers: entity.passengers, cargoCapacity: entity.cargoCapacity, consumables: entity.consumables, vehicleClass: entity.vehicleClass, pilots: entity.pilots, films: entity.films, url: entity.url)
    }

    internal init(name: String, model: String, manufacturer: String, costInCredits: String, length: String, maxAtmospheringSpeed: String, crew: String, passengers: String, cargoCapacity: String, consumables: String, vehicleClass: String, pilots: [String], films: [String], url: String) {
        self.name = name
        self.model = model
        self.manufacturer = manufacturer
        self.costInCredits = costInCredits
        self.length = length
        self.maxAtmospheringSpeed = maxAtmospheringSpeed
        self.crew = crew
        self.passengers = passengers
        self.cargoCapacity = cargoCapacity
        self.consumables = consumables
        self.vehicleClass = vehicleClass
        self.pilots = pilots
        self.films = films
        self.url = url
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
        url: String.Empty)
}
