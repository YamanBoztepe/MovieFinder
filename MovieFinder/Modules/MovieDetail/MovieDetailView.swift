//
//  MovieDetailView.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 18.10.2023.
//

import SwiftUI
import Kingfisher

struct MovieDetailView: View {
    @StateObject private var viewModel = ViewModel()
    let movie: HomeModel.Response
    
    var body: some View {
        BaseView(viewModel: viewModel) {
            ScrollView(.vertical) {
                VStack {
                    if let poster = movie.poster, poster != "N/A" {
                        KFImage(URL(string: poster))
                    }
                    Text(movie.title.stringValue)
                        .font(.largeTitle)
                    Text(movie.year.stringValue)
                        .font(.footnote)
                    VStack(alignment: .leading) {
                        Text(movie.plot.stringValue)
                        Text("Actors: \(movie.actors.stringValue)")
                            .padding(.vertical, 16)
                    }
                    .padding(.top, 24)
                }
                .padding()
            }
        }
    }
}
