//
//  PeopleAPIImpl.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct PeopleAPIImpl: PeopleDataSource {

    private static let domain: String = "https://swapi.dev/api/people"
    
    func page(url: String, completion: @escaping (PeopleListModel) -> Void, failure: @escaping (Error) -> Void) {
        assert(url.contains(PeopleAPIImpl.domain))
        self.execute(url: url, completion: completion, failure: failure)
    }

    func search(completion: @escaping (PeopleListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.execute(url: PeopleAPIImpl.domain, completion: completion, failure: failure)
    }
    
    func search(value: String, completion: @escaping (PeopleListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.execute(url: "\(PeopleAPIImpl.domain)?search=\(value)", completion: completion, failure: failure)
    }

    private func execute(url urlValue: String, completion: @escaping (PeopleListModel) -> Void, failure: @escaping (Error) -> Void) {
        guard let url = URL(string: urlValue) else{
            failure(APIException.badUrl)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let exception = error, error != nil {
                failure(exception)
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                failure(APIException.statusNotOK)
                return
            }

            guard let data = data, !data.isEmpty else {
                failure(APIException.decodingError)
                return
            }

            guard let result = try? JSONDecoder().decode(PeopleListAPIEntity.self, from: data) else {
                failure(APIException.decodingError)
                return
            }

            completion(PeopleListModel (
                count: result.count,
                next: result.next ?? String.Empty,
                previous: result.previous ?? String.Empty,
                results: result.results
            ))
        }.resume()
    }

    func detail(url urlValue: String, completion: @escaping (PeopleModel) -> Void, failure: @escaping (Error) -> Void) {
        assert(urlValue.contains(PeopleAPIImpl.domain))
        guard let url = URL(string: urlValue) else{
            failure(APIException.badUrl)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let exception = error, error != nil {
                failure(exception)
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                failure(APIException.statusNotOK)
                return
            }

            guard let data = data, !data.isEmpty else {
                failure(APIException.decodingError)
                return
            }

            guard let result = try? JSONDecoder().decode(PeopleModel.self, from: data) else {
                failure(APIException.decodingError)
                return
            }

            completion(result)
        }.resume()
    }
}
