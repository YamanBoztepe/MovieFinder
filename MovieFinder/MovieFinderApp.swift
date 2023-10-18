//
//  MovieFinderApp.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import SwiftUI

@main
struct MovieFinderApp: App {
    @StateObject var sharedInstances = SharedInstances()
    @StateObject var router = Router()
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.paths) {
                HomeView()
                    .navigationDestination(for: Paths.self) { path in
                        path.screenToDisplay
                    }
            }
            .overlay(
                SplashView()
                    .opacity(sharedInstances.presentSplash ? 1 : 0)
            )
            .environmentObject(router)
            .environmentObject(sharedInstances)
            .animation(.linear, value: sharedInstances.presentSplash)
        }
    }
}
