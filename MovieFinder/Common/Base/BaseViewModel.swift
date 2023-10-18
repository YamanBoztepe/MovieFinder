//
//  BaseViewModel.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import Foundation

protocol AlertLogics {
    var alertItem: AlertItem { get set }
    func handleError(_ error: String)
}

protocol NetworkLogics {
    var remoteConfigService: RemoteConfigBusinessLogic { get }
    var eventService: EventBusinessLogic { get }
    var networkService: NetworkServiceBusinessLogic { get }
}

class BaseViewModel: ObservableObject, AlertLogics, NetworkLogics {
    @Published var navigationAction: NavigationAction? = nil
    @Published var networkScanner = NetworkScanner()
    @Published var presentAlert = false
    @Published var presentLoading = false
    @Published var sharedInstances = SharedInstances()
    
    var alertItem = AlertItem(title: "", message: "", buttons: [])
    var remoteConfigService: RemoteConfigBusinessLogic = RemoteConfigService()
    var eventService: EventBusinessLogic = EventService()
    var networkService: NetworkServiceBusinessLogic = NetworkService()
    
    func handleError(_ error: String) {
        presentAlert = true
        alertItem = AlertItem(title: "Error", message: error, buttons: [])
    }
}
