//
//  VehicleRouter.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

final class VehicleRouter {

    public static func showList() -> VehicleListView {
        VehicleListView()
    }

    public static func showDetail(vehicle: VehicleModel) -> VehicleDetailView {
        VehicleDetailView(model: VehicleDetailViewModel(url: vehicle.url))
    }

}
