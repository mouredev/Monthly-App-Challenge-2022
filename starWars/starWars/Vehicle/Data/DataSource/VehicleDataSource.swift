//
//  Vehicle.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol VehicleDataSource {
    func page(url: String, completion: @escaping (VehicleListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(completion: @escaping (VehicleListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(value: String, completion: @escaping (VehicleListModel) -> Void, failure: @escaping (Error) -> Void)
    func detail(url urlValue: String, completion: @escaping (VehicleModel) -> Void, failure: @escaping (Error) -> Void)
}
