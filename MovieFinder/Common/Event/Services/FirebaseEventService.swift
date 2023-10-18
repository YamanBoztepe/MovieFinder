//
//  FirebaseEventService.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 18.10.2023.
//

import Foundation
import FirebaseAnalytics

struct FirebaseEventService: EventBusinessLogic {
    
    func log(event: String, parameters: [String : Any]) {
        FirebaseAnalytics.Analytics.logEvent(event, parameters: parameters)
    }
}
