//
//  UseCaseException.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

enum UseCaseException: Error{
    case networkError, decodingError
}
