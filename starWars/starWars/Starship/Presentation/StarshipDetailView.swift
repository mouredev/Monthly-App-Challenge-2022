//
//  StarshipDetailView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import SwiftUI

struct StarshipDetailView: View {
    
    @StateObject var model = StarshipDetailViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct StarshipDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StarshipDetailView()
    }
}
