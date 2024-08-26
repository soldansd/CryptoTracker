//
//  CoinsSearchViewModel.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 26/08/2024.
//

import Foundation

final class CoinsSearchViewModel: ObservableObject {
    
    @Published var searchText = ""
    private var coinsFetched: [CoinSearch] = []
    
    var coinsFiltered: [CoinSearch] {
        let searchTextLowercased = searchText.lowercased()
      
        return coinsFetched.filter { coin in
            
            let coinIdLowercased = coin.id.lowercased()
            let coinNameLowercased = coin.name.lowercased()
            let coinSymbolLowercased = coin.symbol.lowercased()
            
            return  coinIdLowercased.contains(searchTextLowercased) ||
                    coinNameLowercased.contains(searchTextLowercased) ||
                    coinSymbolLowercased.contains(searchTextLowercased) ||
                    searchTextLowercased.contains(coinIdLowercased) ||
                    searchTextLowercased.contains(coinNameLowercased) ||
                    searchTextLowercased.contains(coinSymbolLowercased)
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
