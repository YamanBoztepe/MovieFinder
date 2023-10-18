//
//  Router.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import SwiftUI

protocol RouterBusinessLogic {
    func popToRoot()
    func pop()
    func pop(to pathNumber: Int)
    func push(to path: Paths)
}

class Router: ObservableObject, RouterBusinessLogic {
    @Published var paths = NavigationPath()
    
    func popToRoot() {
        paths.removeLast(paths.count)
    }
    
    func pop() {
        paths.removeLast()
    }
    
    func pop(to pathNumber: Int) {
        paths.removeLast(pathNumber)
    }
    
    func push(to path: Paths) {
        paths.append(path)
    }
}
