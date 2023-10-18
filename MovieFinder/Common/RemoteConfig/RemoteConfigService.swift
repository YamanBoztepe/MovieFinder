//
//  RemoteConfigService.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import Foundation

protocol RemoteConfigBusinessLogic {
    func fetchValue(forKey key: String, completion: @escaping (Result<String, Error>) -> Void)
}

struct RemoteConfigService: RemoteConfigBusinessLogic {
    private var services: [RemoteConfigBusinessLogic] {
        [FirebaseRemoteConfigService()]
    }
    
    func fetchValue(forKey key: String, completion: @escaping (Result<String, Error>) -> Void) {
        services.forEach { $0.fetchValue(forKey: key, completion: completion) }
    }
}
