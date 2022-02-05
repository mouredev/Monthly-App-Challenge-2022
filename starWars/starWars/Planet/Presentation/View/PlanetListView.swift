//
//  PlanetListView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import SwiftUI

struct PlanetListView: View {

    @StateObject var model = PlanetListViewModel()
    
    fileprivate func row(_ planet: PlanetModel) -> some View {
        HStack{
            NavigationLink(destination: PlanetRouter.showDetail(planet: planet)) {
                Text("\(planet.name)")
            }
        }
    }
    
    fileprivate func list() -> some View {
        List {
            ForEach(model.planets.results){ item in
                row(item)
            }
        }
        .background(Color(.clear))
        .navigationTitle("Planets")
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

struct PlanetListView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetListView()
    }
}
