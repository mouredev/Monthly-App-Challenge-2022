//
//  ContentView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: FilmRouter.showList()) {
                    Text("Films")
                }
                NavigationLink(destination: PeopleRouter.showList()) {
                    Text("Peoples")
                }
                NavigationLink(destination: PlanetListView()) {
                    Text("Planets")
                }
                NavigationLink(destination: SpeccyRouter.showList()) {
                    Text("Species")
                }
                NavigationLink(destination: StarshipListView()) {
                    Text("Starships")
                }
                NavigationLink(destination: VehicleRouter.showList()) {
                    Text("Vehicles")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
