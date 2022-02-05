//
//  VehicleDetailView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import SwiftUI

struct VehicleDetailView: View {
    @StateObject var model: VehicleDetailViewModel
    
    var body: some View {
        VStack {
            Text(model.vehicle.name)
        }.task {
            model.detail()
        }
        .alert("Error", isPresented: $model.hasError) {
        } message: {
            Text(model.errorMessage)
        }
    }
}

struct VehicleDetailView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleDetailView(
            model: VehicleDetailViewModel(url: "https://swapi.dev/api/vehicles/14/")
        )
    }
}
