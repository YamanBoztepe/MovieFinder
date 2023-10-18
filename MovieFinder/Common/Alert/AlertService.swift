//
//  AlertService.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import SwiftUI

struct AlertService: ViewModifier {
    @Binding var isPresented: Bool
    let alert: AlertItem
    
    func body(content: Content) -> some View {
        content
            .alert(alert.title,
                   isPresented: $isPresented,
                   actions: makeAlertButtons,
                   message: makeAlertMessage)

    }
}

// MARK: - Views
private extension AlertService {
    func makeAlertButtons() -> some View {
        ForEach(alert.buttons) { button in
            Button(button.title, role: button.role, action: button.action)
        }
    }
    
    func makeAlertMessage() -> some View {
        Text(alert.message)
    }
}

// MARK: - Modifier
extension View {
    func presentAlert(isPresented: Binding<Bool>, alert: AlertItem) -> some View {
        modifier(AlertService(isPresented: isPresented, alert: alert))
    }
}
