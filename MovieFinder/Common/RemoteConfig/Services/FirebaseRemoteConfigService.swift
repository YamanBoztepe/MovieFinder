//
//  FirebaseRemoteConfigService.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import Foundation
import FirebaseRemoteConfig

struct FirebaseRemoteConfigService: RemoteConfigBusinessLogic {
    var remoteConfig: RemoteConfig {
        setupRemoteConfig()
    }
    
    func fetchValue(forKey key: String, completion: @escaping (Result<String, Error>) -> Void) {
        remoteConfig.fetch { (status, error) -> Void in
            
          if status == .success {
              remoteConfig.activate { _, error in
                  guard let value = remoteConfig.configValue(forKey: key).stringValue else { return }
                  completion(.success(value))
              }
          } else {
              guard let error else { return }
              completion(.failure(error))
          }
          
        }
    }
    
    private func setupRemoteConfig() -> RemoteConfig {
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        return remoteConfig
    }
}
