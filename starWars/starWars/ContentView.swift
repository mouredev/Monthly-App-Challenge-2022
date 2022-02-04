//
//  ContentView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var model = PeopleListViewModel()
    
    fileprivate func row(_ people: PeopleModel) -> some View {
        HStack{
            Text("\(people.name)")
        }
    }
    
    fileprivate func list() -> some View {
        List {
            ForEach(model.peoples.results){ item in
                row(item)
            }
        }
        .navigationTitle("Peoples")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
