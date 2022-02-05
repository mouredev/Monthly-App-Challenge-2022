//
//  VehicleListModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct VehicleListModel {
    var count: Int
    var next: String
    var previous: String
    var results: [VehicleModel]
}

extension VehicleListModel {
    static let NullObject: VehicleListModel = VehicleListModel(
        count: Int.zero,
        next: String.Empty,
        previous: String.Empty,
        results: [])
}
