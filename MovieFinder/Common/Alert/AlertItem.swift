//
//  AlertItem.swift
//  MovieFinder
//
//  Created by Yaman Boztepe on 17.10.2023.
//

import SwiftUI

struct AlertItem {
    let title: String
    let message: String
    let buttons: [AlertButton]
}

struct AlertButton: Identifiable {
    var id = UUID()
    let title: String
    var role: ButtonRole? = nil
    let action: (() -> Void)
}
