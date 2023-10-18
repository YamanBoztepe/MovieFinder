//
//  NetworkService.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 18.10.2023.
//

import Foundation
import Alamofire

protocol NetworkServiceBusinessLogic {
    func fetch<T: Codable>(dataType: T.Type, completion: @escaping NetworkResult<T>)
    func addParameters(_ parameters: [NetworkParameters: String]) -> Self
}

struct NetworkService: NetworkServiceBusinessLogic {
    private var parameters: [NetworkParameters: String] = [:]
    
    func fetch<T: Codable>(dataType: T.Type, completion: @escaping NetworkResult<T>) {
        AF.request(buildURL()).responseDecodable(of: dataType.self) { response in
            if let error = response.error {
                completion(.failure(error))
                
            } else if let value = response.value {
                completion(.success(value))
            }
        }
    }
    
    func addParameters(_ parameters: [NetworkParameters: String]) -> Self {
        var _self = self
        
        parameters.forEach { parameter, value in
            let concatenatedValue = value.replacingOccurrences(of: " ", with: "+")
            _self.parameters[parameter] = concatenatedValue
        }
        
        return _self
    }
    
    private func buildURL() -> String {
        var requestedURL = "https://www.omdbapi.com/"
        + "?\(NetworkParameters.apiKey.rawValue)="
        + "bf1c8ae6"
        
        parameters.forEach { parameter, value in
            requestedURL += "&\(parameter.rawValue)=\(value)"
        }
        
        return requestedURL
    }
}

// MARK: - Network Result Type
typealias NetworkResult<T: Codable> = (Result<T, Error>) -> Void
