//
//  SpeccyRepository.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol SpeccyRepository {
    func page(url: String, completion: @escaping (SpeccyListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(completion: @escaping (SpeccyListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(value: String, completion: @escaping (SpeccyListModel) -> Void, failure: @escaping (Error) -> Void)
    func detail(url: String, completion: @escaping (SpeccyModel) -> Void, failure: @escaping (Error) -> Void)
}
