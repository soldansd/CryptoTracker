//
//  MarketDataViewModel.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 24/08/2024.
//

import Foundation

final class MarketDataViewModel: ObservableObject {
    
    @Published var marketData: Market.MarketData?
    
    init() {
        print("Market init")
        fetchMarketData()
    }
    
    init(forPreviews: Market.MarketData?) {
        self.marketData = forPreviews
    }
    
    func fetchMarketData() {
        NetworkManager.shared.getMarketData { market in
            DispatchQueue.main.async {
                self.marketData = market?.data
            }
        }
    }
}
