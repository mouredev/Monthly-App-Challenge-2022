//
//  PlanetDataSource.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol PlanetDataSource {
    func page(url: String, completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(value: String, completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void)
    func detail(url urlValue: String, completion: @escaping (PlanetModel) -> Void, failure: @escaping (Error) -> Void)
}
