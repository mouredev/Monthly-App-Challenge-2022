//
//  VehicleListView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import SwiftUI

struct VehicleListView: View {
    @StateObject var model = VehicleListViewModel()
    
    fileprivate func row(_ vehicle: VehicleModel) -> some View {
        HStack{
            NavigationLink(destination: VehicleRouter.showDetail(vehicle: vehicle)) {
                Text("\(vehicle.name)")
            }
        }
    }
    
    fileprivate func list() -> some View {
        List {
            ForEach(model.vehicles.results){ item in
                row(item)
            }
        }
        .background(Color(.clear))
        .navigationTitle("Vehicles")
        .task {
            model.all()
        }
        .alert("Error", isPresented: $model.hasError) {
        } message: {
            Text(model.errorMessage)
        }
    }
    
    var body: some View {
        list()
    }
}

struct VehicleListView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleListView()
    }
}
