//
//  PeopleListView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import SwiftUI

struct PeopleListView: View {
    
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
        .background(Color(.clear))
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

struct PeopleListView_Previews: PreviewProvider {
    static var previews: some View {
        PeopleListView()
    }
}
