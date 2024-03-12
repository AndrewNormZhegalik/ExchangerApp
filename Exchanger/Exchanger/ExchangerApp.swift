//
//  ExchangerApp.swift
//  Exchanger
//
//  Created by Andrey on 10.03.24.
//

import SwiftUI

@main
struct ExchangerApp: App {
    @StateObject private var networkMonitor = NetworkMonitor()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(networkMonitor)
        }
    }
}
