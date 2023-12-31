//
//  Extensions+String.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 18.10.2023.
//

import Foundation

extension Optional where Wrapped == String {
    
    var stringValue: String {
        return self ?? ""
    }
}
