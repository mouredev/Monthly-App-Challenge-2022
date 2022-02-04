//
//  PlanetAPIImpl.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

struct PlanetAPIImpl: PlanetDataSource {

    private static let domain: String = "https://swapi.dev/api/planets"

    func page(url: String, completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void) {
        assert(url.contains(PlanetAPIImpl.domain))
        self.execute(url: url, completion: completion, failure: failure)
    }

    func search(completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void)  {
        self.execute(url: PlanetAPIImpl.domain, completion: completion, failure: failure)
    }
    
    func search(value: String, completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.execute(url: "\(PlanetAPIImpl.domain)?search=\(value)", completion: completion, failure: failure)
    }

    private func execute(url urlValue: String, completion: @escaping (PlanetListModel) -> Void, failure: @escaping (Error) -> Void) {
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
            
            guard let result = try? JSONDecoder().decode(PlanetAPIEntity.self, from: data) else {
                failure(APIException.decodingError)
                return
            }
            
            completion(PlanetListModel (
                count: result.count,
                next: result.next ?? String.Empty,
                previous: result.previous ?? String.Empty,
                results: result.results
            ))
        }.resume()
    }
}
