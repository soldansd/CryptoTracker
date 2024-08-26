//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                TabView {
                    MarketsView()
                        .tabItem {
                            Image(systemName: "bitcoinsign.circle")
                        }
                    
                    SearchBarView()
                        .tabItem {
                            Image(systemName: "magnifyingglass.circle")
                        }
                }
            }
        }
    }
}
