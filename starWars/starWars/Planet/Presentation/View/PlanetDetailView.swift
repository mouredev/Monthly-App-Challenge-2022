//
//  PlanetDetailView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import SwiftUI

struct PlanetDetailView: View {
    
    @StateObject var model: PlanetDetailViewModel
    
    var body: some View {
        VStack {
            Text(model.planet.name)
        }.task {
            model.detail()
        }
        .alert("Error", isPresented: $model.hasError) {
        } message: {
            Text(model.errorMessage)
        }
    }
}

struct PlanetDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlanetDetailView(
            model: PlanetDetailViewModel(
                url: "https://swapi.dev/api/planets/3/"
            )
        )
    }
}
