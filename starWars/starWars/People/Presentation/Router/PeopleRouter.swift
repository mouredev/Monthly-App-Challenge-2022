//
//  PeopleRouter.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

final class PeopleRouter {

    public static func showList() -> PeopleListView {
        PeopleListView()
    }

    public static func showDetail(people: PeopleModel) -> PeopleDetailView {
        PeopleDetailView(model: PeopleDetailViewModel(url: people.url))
    }
    
}
