//
//  PeopleRepository.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol PeopleRepository {
    func page(url: String, completion: @escaping (PeopleListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(completion: @escaping (PeopleListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(value: String, completion: @escaping (PeopleListModel) -> Void, failure: @escaping (Error) -> Void)
}
