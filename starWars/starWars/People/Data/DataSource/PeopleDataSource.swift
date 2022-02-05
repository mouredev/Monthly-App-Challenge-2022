//
//  PeopleDataSource.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

protocol PeopleDataSource {
    func page(url: String, completion: @escaping (PeopleListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(completion: @escaping (PeopleListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(value: String, completion: @escaping (PeopleListModel) -> Void, failure: @escaping (Error) -> Void)
    func detail(url urlValue: String, completion: @escaping (PeopleModel) -> Void, failure: @escaping (Error) -> Void)
}
