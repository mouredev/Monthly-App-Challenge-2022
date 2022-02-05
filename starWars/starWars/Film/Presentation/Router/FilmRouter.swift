//
//  FilmRouter.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

final class FilmRouter {

    public static func showList() -> FilmListView {
        FilmListView()
    }

    public static func showDetail(film: FilmModel) -> FilmDetailView {
        FilmDetailView(model: FilmDetailViewModel(url: film.url))
    }

}
