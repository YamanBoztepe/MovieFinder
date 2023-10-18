//
//  SplashViewModel.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import Foundation
import FirebaseRemoteConfig

protocol SplashBusinessLogic {
    func checkNetwork()
}

extension SplashView {
    final class ViewModel: BaseViewModel {
        @Published var splashText = ""
        
        func checkNetwork() {
            networkScanner.checkNetwork { [weak self] isConnected in
                guard let self else { return }
                
                if isConnected {
                    self.fetchConfigData {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            self.sharedInstances.presentSplash = false
                        }
                    }
                } else {
                    self.handleError(SplashModel.internetErrorMessage)
                }
            }
        }
        
        private func fetchConfigData(_ completion: @escaping () -> Void) {
            remoteConfigService.fetchValue(forKey: SplashModel.splashText) { [weak self] result in
                guard let self else { return }
                switch result {
                case .success(let text):
                    DispatchQueue.main.async {
                        self.splashText = text
                        completion()
                    }
                case .failure(let failure):
                    self.handleError(failure.localizedDescription)
                }
            }
        }
    }
}
