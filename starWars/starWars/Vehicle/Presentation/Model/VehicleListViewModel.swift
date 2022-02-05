//
//  VehicleListViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

class VehicleListViewModel: ObservableObject {
    
    let allUseCase = AllVehicleUseCase(repository: VehicleRepositoryImpl(dataSource: VehicleAPIImpl()))
    let filterUserCase = FilterVehicleUseCase(repository: VehicleRepositoryImpl(dataSource: VehicleAPIImpl()))
    let pageUseCase = PageVehicleUseCase(repository: VehicleRepositoryImpl(dataSource: VehicleAPIImpl()))
    @Published var vehicles: VehicleListModel = VehicleListModel.NullObject
    @Published var errorMessage = ""
    @Published var hasError = false
    
    func all() {
        self.errorMessage = String.Empty
        allUseCase.execute {
            self.response($0)
        }
    }
    
    func filter(value: String) {
        self.errorMessage = String.Empty
        filterUserCase.execute(value: value) {
            self.response($0)
        }
    }
    
    func next() {
        self.errorMessage = String.Empty
        if self.containNextPage() {
            self.page(url: self.vehicles.next)
        }
    }
    
    func previous() {
        self.errorMessage = String.Empty
        if self.containPreviousPage() {
            self.page(url: self.vehicles.previous)
        }
    }
    
    private func page(url: String) {
        self.pageUseCase.execute(url: url) {
            self.response($0)
        }
    }
    
    private func response(_ result: Result<VehicleListModel, UseCaseException>) {
        switch result {
        case .success(let vehicles):
            self.vehicles = vehicles
        case .failure(let error):
            self.vehicles = VehicleListModel.NullObject
            self.errorMessage = error.localizedDescription
            self.hasError = true
        }
    }
    
    func containNextPage() -> Bool {
        !self.vehicles.next.isEmpty
    }
    
    func containPreviousPage() -> Bool {
        !self.vehicles.previous.isEmpty
    }
}
