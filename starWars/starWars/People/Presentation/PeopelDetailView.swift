//
//  PeopelDetailView.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import SwiftUI

struct PeopelDetailView: View {
    
    @StateObject var model = PeopleDetailViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct PeopelDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PeopelDetailView()
    }
}
