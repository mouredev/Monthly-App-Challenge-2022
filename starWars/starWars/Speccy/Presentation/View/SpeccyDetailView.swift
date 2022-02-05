//
//  SpeccyDetailView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import SwiftUI

struct SpeccyDetailView: View {
    @StateObject var model: SpeccyDetailViewModel
    
    var body: some View {
        VStack {
            Text(model.speccy.name)
        }.task {
            model.detail()
        }
        .alert("Error", isPresented: $model.hasError) {
        } message: {
            Text(model.errorMessage)
        }
    }
}

struct SpeccyDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SpeccyDetailView(
            model: SpeccyDetailViewModel(url: "https://swapi.dev/api/species/1/")
        )
    }
}
