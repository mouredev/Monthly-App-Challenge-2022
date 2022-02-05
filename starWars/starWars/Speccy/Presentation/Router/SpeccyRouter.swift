//
//  SpeccyRouter.swift
//  starWars
//
//  Created by Diego Alberto Dominguez Herreros on 5/2/22.
//

import Foundation

final class SpeccyRouter {

    public static func showList() -> SpeccyListView {
        SpeccyListView()
    }

    public static func showDetail(speccy: SpeccyModel) -> SpeccyDetailView {
        SpeccyDetailView(model: SpeccyDetailViewModel(url: speccy.url))
    }

}
