//
//  BaseView.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import SwiftUI

struct BaseView<Content: View>: View {
    @EnvironmentObject var sharedInstances: SharedInstances
    @EnvironmentObject var router: Router
    @ObservedObject var viewModel: BaseViewModel
    let content: Content
    
    init(viewModel: BaseViewModel, @ViewBuilder content: () -> Content) {
        self.viewModel = viewModel
        self.content = content()
    }
    
    var body: some View {
        content
            .onChange(of: viewModel.navigationAction, perform: navigationHandler(_:))
            .presentLoading($viewModel.presentLoading)
            .presentAlert(isPresented: $viewModel.presentAlert, alert: viewModel.alertItem)
            .onAppear(perform: onAppear)
    }
}

// MARK: - Helper Methods
private extension BaseView {
    func onAppear() {
        viewModel.sharedInstances = sharedInstances
    }
    
    func navigationHandler(_ action: NavigationAction?) {
        guard let action else { return }
        
        switch action {
        case .push(let path):
            router.push(to: path)
        case .pop:
            router.pop()
        case .popTo(let pageNumber):
            router.pop(to: pageNumber)
        case .popToRoot:
            router.popToRoot()
        }
        
        viewModel.navigationAction = nil
    }
}
