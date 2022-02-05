//
//  PlanetRouter.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

final class PlanetRouter {
    
    public static func showList() -> PlanetListView {
        PlanetListView()
    }

    public static func showDetail(planet: PlanetModel) -> PlanetDetailView {
        PlanetDetailView(model: PlanetDetailViewModel(url: planet.url))
    }
    
}
