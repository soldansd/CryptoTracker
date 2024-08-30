//
//  CryptoTrackerApp.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

@main
struct CryptoTrackerApp: App {
    
    @StateObject var portfolioVM = PortfolioViewModel()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                MarketsView()
                    .environmentObject(portfolioVM)
                    .tabItem {
                        Image(systemName: "bitcoinsign.circle")
                        Text("Market")
                    }
                
                SearchBarView()
                    .environmentObject(portfolioVM)
                    .tabItem {
                        Image(systemName: "magnifyingglass.circle")
                        Text("Search")
                    }
                
                PortfolioView()
                    .environmentObject(portfolioVM)
                    .tabItem {
                        Image(systemName: "chart.pie")
                        Text("Portfolio")
                    }
            }
        }
    }
}
