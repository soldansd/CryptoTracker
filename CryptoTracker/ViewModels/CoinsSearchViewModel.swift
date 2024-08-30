//
//  CoinsSearchViewModel.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 26/08/2024.
//

import Foundation

final class CoinsSearchViewModel: ObservableObject {
    
    @Published var searchText = ""
    
    // All coin available from API
    private var coinsFetched: [CoinSearch] = []
    
    // Array of coins matching the search query
    var coinsFiltered: [CoinSearch] {
        let searchTextLowercased = searchText.lowercased().trimmingCharacters(in: .whitespaces)
        
        return coinsFetched.filter { coin in
            coin.id.lowercased().contains(searchTextLowercased) ||
            coin.name.lowercased().contains(searchTextLowercased) ||
            coin.symbol.lowercased().contains(searchTextLowercased)
        }
    }
    
    init() {
        fetchCoins()
    }
    
    init(forPreviews: [CoinSearch]) {
        self.coinsFetched = forPreviews
    }
    
    func fetchCoins() {
        NetworkManager.shared.getCoinsForSearch { coins in
            DispatchQueue.main.async {
                self.coinsFetched = coins
            }
        }
    }
}
