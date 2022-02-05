//
//  FilmListView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import SwiftUI

struct FilmListView: View {
    @StateObject var model = FilmListViewModel()
    
    fileprivate func row(_ film: FilmModel) -> some View {
        HStack{
            NavigationLink(destination: FilmRouter.showDetail(film: film)) {
                Text("\(film.title)")
            }
        }
    }
    
    fileprivate func list() -> some View {
        List {
            ForEach(model.films.results){ item in
                row(item)
            }
        }
        .background(Color(.clear))
        .navigationTitle("Films")
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

struct FilmListView_Previews: PreviewProvider {
    static var previews: some View {
        FilmListView()
    }
}
