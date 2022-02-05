//
//  StarshipRouter.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

final class StarshipRouter {

    public static func showList() -> StarshipListView {
        StarshipListView()
    }

    public static func showDetail(starship: StarshipModel) -> StarshipDetailView {
        StarshipDetailView(model: StarshipDetailViewModel(url: starship.url))
    }

}
