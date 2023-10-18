//
//  HomeViewModel.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 18.10.2023.
//

import Foundation

protocol HomeBusinessLogic {
    func search(movie: String)
}

extension HomeView {
    final class ViewModel: BaseViewModel, HomeBusinessLogic {
        @Published var movie: HomeModel.Response? = nil
        
        func search(movie: String) {
            presentLoading = true
            
            networkService
                .addParameters([NetworkParameters.title : movie])
                .fetch(dataType: HomeModel.Response.self) { [weak self] result in
                    guard let self else { return }
                    
                    switch result {
                    case .success(let data):
                        if let error = data.error {
                            self.handleError(error)
                            self.movie = nil
                        } else {
                            self.movie = data
                        }
                    case .failure(let error):
                        self.handleError(error.localizedDescription)
                        self.movie = nil
                    }
                    
                    self.presentLoading = false
                }
        }
        
        func routeToDetail() {
            guard let movie else { return }
            eventService.log(event: "movieDetails",
                             parameters: ["title": movie.title.stringValue,
                                          "year": movie.year.stringValue,
                                          "actors": movie.actors.stringValue])
            navigationAction = .push(.movieDetail(movie))
        }
    }
}
