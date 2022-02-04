//
//  APIException.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

enum APIException: Error {
    case badUrl, requestError, decodingError, statusNotOK
}
