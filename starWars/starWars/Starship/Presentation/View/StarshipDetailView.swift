//
//  StarshipDetailView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import SwiftUI

struct StarshipDetailView: View {
    
    @StateObject var model: StarshipDetailViewModel
    
    var body: some View {
        VStack {
            Text(model.starship.name)
        }.task {
            model.detail()
        }
        .alert("Error", isPresented: $model.hasError) {
        } message: {
            Text(model.errorMessage)
        }
    }
}

struct StarshipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipDetailView(
            model: StarshipDetailViewModel (
                url: "https://swapi.dev/api/starships/9/"
            )
        )
    }
}
