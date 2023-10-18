//
//  HomeView.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var text = ""
    
    var body: some View {
        BaseView(viewModel: viewModel) {
            VStack(alignment: .leading) {
                descriptionText
                HStack {
                    filmTextField
                    searchButton
                }
                
                if let movie = viewModel.movie {
                    makeMovieRowButton(movie)
                        .padding(.top, 24)
                }
            }
            .padding(.horizontal)
        }
        .animation(.linear, value: viewModel.movie)
    }
}

// MARK: - Views
private extension HomeView {
    var descriptionText: some View {
        Text("Enter a movie you want to search")
            .font(.callout)
    }
    
    var filmTextField: some View {
        TextField("",
                  text: $text,
                  prompt: Text("Terminator 2")
            .font(.subheadline)
            .foregroundColor(.gray)
        )
        .textFieldStyle(.roundedBorder)
    }
    
    var searchButton: some View {
        Button {
            viewModel.search(movie: text)
        } label: {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.primary)
        }
        .buttonStyle(BorderedButtonStyle())
    }
    
    func makeMovieRowButton(_ movie: HomeModel.Response) -> some View {
        Button {
            viewModel.routeToDetail()
        } label: {
            MovieRow(title: movie.title.stringValue,
                     subTitle: movie.genre.stringValue)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
