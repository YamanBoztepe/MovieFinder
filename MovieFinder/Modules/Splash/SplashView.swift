//
//  SplashView.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        BaseView(viewModel: viewModel) {
            ZStack {
                Color.cyan
                Text(viewModel.splashText)
                    .font(.largeTitle)
                    .foregroundColor(.white)
            }
            .ignoresSafeArea()
        }
        .onAppear(perform: viewModel.checkNetwork)
        .animation(.linear, value: viewModel.splashText)
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
