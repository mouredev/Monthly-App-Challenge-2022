//
//  VehicleDetailViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

class VehicleDetailViewModel: ObservableObject {
    
    let detailUseCase = DetailVehicleUseCase(repository: VehicleRepositoryImpl(dataSource: VehicleAPIImpl()))
    private var url: String
    @Published var vehicle: VehicleModel = VehicleModel.NullObject
    @Published var errorMessage = ""
    @Published var hasError = false
    
    init(url: String) {
        self.url = url
    }
    
    func detail() {
        self.errorMessage = String.Empty
        detailUseCase.execute(url: self.url) {
            switch $0 {
            case .success(let vehicle):
                self.vehicle = vehicle
            case .failure(let error):
                self.vehicle = VehicleModel.NullObject
                self.errorMessage = error.localizedDescription
                self.hasError = true
            }
        }
    }
}
