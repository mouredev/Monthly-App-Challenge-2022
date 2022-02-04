//
//  PeopleDetailViewModel.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 4/2/22.
//

import Foundation

class PeopleDetailViewModel: ObservableObject {
    
    @Published var people: PeopleModel?
    @Published var errorMessage = ""
    @Published var hasError = false
}
