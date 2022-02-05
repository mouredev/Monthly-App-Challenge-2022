//
//  VehicleAPIImpl.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct VehicleAPIImpl: VehicleDataSource {

    private static let domain: String = "https://swapi.dev/api/vehicles"

    func page(url: String, completion: @escaping (VehicleListModel) -> Void, failure: @escaping (Error) -> Void) {
        assert(url.contains(VehicleAPIImpl.domain))
        self.execute(url: url, completion: completion, failure: failure)
    }

    func search(completion: @escaping (VehicleListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.execute(url: VehicleAPIImpl.domain, completion: completion, failure: failure)
    }
    
    func search(value: String, completion: @escaping (VehicleListModel) -> Void, failure: @escaping (Error) -> Void){
        self.execute(url: "\(VehicleAPIImpl.domain)?search=\(value)", completion: completion, failure: failure)
    }

    private func execute(url urlValue: String, completion: @escaping (VehicleListModel) -> Void, failure: @escaping (Error) -> Void) {
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
            
            guard let result = try? JSONDecoder().decode(VehicleListAPIEntity.self, from: data) else {
                failure(APIException.decodingError)
                return
            }
            
            completion(VehicleListModel (
                count: result.count,
                next: result.next ?? String.Empty,
                previous: result.previous ?? String.Empty,
                results: result.results
            ))
        }.resume()
    }

    func detail(url urlValue: String, completion: @escaping (VehicleModel) -> Void, failure: @escaping (Error) -> Void) {
        assert(urlValue.contains(VehicleAPIImpl.domain))
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

            guard let result = try? JSONDecoder().decode(VehicleModel.self, from: data) else {
                failure(APIException.decodingError)
                return
            }

            completion(result)
        }.resume()
    }
}
