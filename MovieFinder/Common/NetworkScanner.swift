//
//  NetworkScanner.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import Foundation
import Network

protocol NetworkBusinessLogic {
    func checkNetwork(_ isConnected: @escaping (Bool) -> Void)
}

class NetworkScanner: ObservableObject, NetworkBusinessLogic {
    let monitor = NWPathMonitor()
    let queue = DispatchQueue(label: "Monitor")
    
    func checkNetwork(_ isConnected: @escaping (Bool) -> Void) {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                isConnected(path.status == .satisfied)
            }
        }
        
        monitor.start(queue: queue)
    }
}

