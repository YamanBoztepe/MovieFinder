//
//  EventService.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 18.10.2023.
//

import Foundation

protocol EventBusinessLogic {
    func log(event: String, parameters: [String: Any])
}

struct EventService: EventBusinessLogic {
    private var services: [EventBusinessLogic] {
        [FirebaseEventService()]
    }
    
    func log(event: String, parameters: [String: Any]) {
        services.forEach { $0.log(event: event, parameters: parameters) }
    }
}
