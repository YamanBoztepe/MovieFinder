//
//  NavigationAction.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import Foundation

enum NavigationAction: Equatable {
    case push(Paths)
    case pop
    case popTo(Int)
    case popToRoot
}
