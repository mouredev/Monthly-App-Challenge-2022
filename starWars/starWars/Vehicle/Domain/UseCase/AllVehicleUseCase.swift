//
//  AllVehicleUseCase.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

protocol AllVehicle {
    func execute(result: @escaping (Result<VehicleListModel, UseCaseException>) -> Void)
}

struct AllVehicleUseCase: AllVehicle {
    
    var repository: VehicleRepository
    
    func execute(result: @escaping (Result<VehicleListModel, UseCaseException>) -> Void) {
        repository.search(
            completion: { data in
                result(.success(data))
            },
            failure: { error in
                switch (error) {
                case APIException.decodingError:
                    result(.failure(UseCaseException.decodingError))
                default:
                    result(.failure(UseCaseException.networkError))
                }
            })
    }
}
