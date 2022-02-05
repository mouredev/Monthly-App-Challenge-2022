//
//  FilmRepository.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol FilmRepository {
    func page(url: String, completion: @escaping (FilmListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(completion: @escaping (FilmListModel) -> Void, failure: @escaping (Error) -> Void)
    func search(value: String, completion: @escaping (FilmListModel) -> Void, failure: @escaping (Error) -> Void)
    func detail(url: String, completion: @escaping (FilmModel) -> Void, failure: @escaping (Error) -> Void)
}
