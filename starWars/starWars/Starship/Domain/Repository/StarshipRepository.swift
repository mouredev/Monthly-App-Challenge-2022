//
//  StarshipRepository.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol StarshipRepository {
    func page(url: String, completion: @escaping (StarshipListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(completion: @escaping (StarshipListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(value: String, completion: @escaping (StarshipListModel) -> Void, failure: @escaping (Error) -> Void)
    func detail(url: String, completion: @escaping (StarshipModel) -> Void, failure: @escaping (Error) -> Void)
}
