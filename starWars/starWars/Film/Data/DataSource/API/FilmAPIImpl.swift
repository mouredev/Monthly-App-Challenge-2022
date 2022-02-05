//
//  FilmAPIImpl.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

struct FilmAPIImpl: FilmDataSource {

    private static let domain: String = "https://swapi.dev/api/films"

    func page(url: String, completion: @escaping (FilmListModel) -> Void, failure: @escaping (Error) -> Void) {
        assert(url.contains(FilmAPIImpl.domain))
        self.execute(url: url, completion: completion, failure: failure)
    }

    func search(completion: @escaping (FilmListModel) -> Void, failure: @escaping (Error) -> Void) {
        self.execute(url: FilmAPIImpl.domain, completion: completion, failure: failure)
    }
    
    func search(value: String, completion: @escaping (FilmListModel) -> Void, failure: @escaping (Error) -> Void){
        self.execute(url: "\(FilmAPIImpl.domain)?search=\(value)", completion: completion, failure: failure)
    }

    private func execute(url urlValue: String, completion: @escaping (FilmListModel) -> Void, failure: @escaping (Error) -> Void) {
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
            
            guard let result = try? JSONDecoder().decode(FilmListAPIEntity.self, from: data) else {
                failure(APIException.decodingError)
                return
            }
            
            completion(FilmListModel(entity: result))
        }.resume()
    }

    func detail(url urlValue: String, completion: @escaping (FilmModel) -> Void, failure: @escaping (Error) -> Void) {
        assert(urlValue.contains(FilmAPIImpl.domain))
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

            guard let result = try? JSONDecoder().decode(FilmAPIEntity.self, from: data) else {
                failure(APIException.decodingError)
                return
            }

            completion(FilmModel(entity: result))
        }.resume()
    }
}
