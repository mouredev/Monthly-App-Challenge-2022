//
//  StarshipListView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import SwiftUI

struct StarshipListView: View {
    
    @StateObject var model = StarshipListViewModel()
    
    fileprivate func row(_ starship: StarshipModel) -> some View {
        HStack{
            NavigationLink(destination: StarshipRouter.showDetail(starship: starship)) {
                Text("\(starship.name)")
            }
        }
    }
    
    fileprivate func list() -> some View {
        List {
            ForEach(model.starships.results){ item in
                row(item)
            }
        }
        .background(Color(.clear))
        .navigationTitle("Starships")
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

struct StarshipListView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipListView()
    }
}
