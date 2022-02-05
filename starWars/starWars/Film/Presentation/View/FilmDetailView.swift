//
//  FilmDetailView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import SwiftUI

struct FilmDetailView: View {
    @StateObject var model: FilmDetailViewModel
    
    var body: some View {
        VStack {
            Text(model.film.title)
        }.task {
            model.detail()
        }
        .alert("Error", isPresented: $model.hasError) {
        } message: {
            Text(model.errorMessage)
        }
    }
}

struct FilmDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FilmDetailView(
            model: FilmDetailViewModel(url: "https://swapi.dev/api/films/1/")
        )
    }
}
