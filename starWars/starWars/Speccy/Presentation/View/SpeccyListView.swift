//
//  SpeccyListView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import SwiftUI

struct SpeccyListView: View {
    @StateObject var model = SpeccyListViewModel()
    
    fileprivate func row(_ speccy: SpeccyModel) -> some View {
        HStack{
            NavigationLink(destination: SpeccyRouter.showDetail(speccy: speccy)) {
                Text("\(speccy.name)")
            }
        }
    }
    
    fileprivate func list() -> some View {
        List {
            ForEach(model.species.results){ item in
                row(item)
            }
        }
        .background(Color(.clear))
        .navigationTitle("Species")
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

struct SpeccyListView_Previews: PreviewProvider {
    static var previews: some View {
        SpeccyListView()
    }
}
