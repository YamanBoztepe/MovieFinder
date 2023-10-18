//
//  Paths.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import SwiftUI

enum Paths: Hashable {
    case home
    case movieDetail(HomeModel.Response)
}

extension Paths {
    @ViewBuilder
    var screenToDisplay: some View {
        switch self {
        case .home:
            HomeView()
        case .movieDetail(let movie):
            MovieDetailView(movie: movie)
        }
    }
}
