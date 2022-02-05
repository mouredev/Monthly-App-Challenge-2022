//
//  PeopelDetailView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import SwiftUI

struct PeopleDetailView: View {
    
    @StateObject var model: PeopleDetailViewModel
    
    var body: some View {
        VStack {
            Text(model.people.name)
        }.task {
            model.detail()
        }
        .alert("Error", isPresented: $model.hasError) {
        } message: {
            Text(model.errorMessage)
        }
    }
}

struct PeopelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleDetailView(
            model: PeopleDetailViewModel(
                url: "https://swapi.dev/api/people/1/"
            )
        )
    }
}
