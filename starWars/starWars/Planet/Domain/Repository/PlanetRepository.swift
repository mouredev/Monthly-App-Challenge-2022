//
//  PlanetRepository.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol PlanetRepository {
    func page(url: String, completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(value: String, completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void)
}
