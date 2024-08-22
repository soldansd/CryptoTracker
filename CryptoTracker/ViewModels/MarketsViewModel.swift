//
//  MarketsViewModel.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

final class MarketsViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    
    init() {
        fetchCoins()
    }
    
    init(forPreviews coins: [Coin]) {
        self.coins = coins
    }
    
    func fetchCoins() {
        NetworkManager.shared.getCoinsList(count: 100) { coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
    
}
