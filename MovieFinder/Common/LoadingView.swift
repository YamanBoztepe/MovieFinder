//
//  LoadingView.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 18.10.2023.
//

import SwiftUI

struct LoadingView: ViewModifier {
    @Binding var presentLoading: Bool
    
    func body(content: Content) -> some View {
        if presentLoading {
            content.overlay(progressView)
        } else {
            content
        }
    }
}

extension LoadingView {
    var progressView: some View {
        ProgressView()
            .scaleEffect(2)
            .padding()
            .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.secondary))
    }
}

extension View {
    func presentLoading(_ presentLoading: Binding<Bool>) -> some View {
        modifier(LoadingView(presentLoading: presentLoading))
    }
}
