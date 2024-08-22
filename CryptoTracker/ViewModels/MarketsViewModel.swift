//
//  MarketsViewModel.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

final class MarketsViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var sortOption: SortOption = .marketCapDescending {
        didSet {
            sortCoins()
        }
    }
    
    init() {
        fetchCoins(amount: 100)
    }
    
    init(forPreviews coins: [Coin]) {
        self.coins = coins
    }
    
    enum SortOption {
        case marketCapRankDescending, marketCapRankAscending
        case marketCapDescending, marketCapAscending
        case priceDescending, priceAscending
        case priceChangePercentage24HDescending, priceChangePercentage24HAscending
    }
    
    func fetchCoins(amount: Int) {
        NetworkManager.shared.getCoinsList(amount: amount) { coins in
            DispatchQueue.main.async {
                self.coins = coins
            }
        }
    }
    
    private func sortCoins() {
        switch sortOption {
        case .marketCapDescending, .marketCapRankDescending:
            sort(by: \.marketCap, order: .descending)
        case .marketCapAscending, .marketCapRankAscending:
            sort(by: \.marketCap, order: .ascending)
        case .priceDescending:
            sort(by: \.currentPrice, order: .descending)
        case .priceAscending:
            sort(by: \.currentPrice, order: .ascending)
        case .priceChangePercentage24HDescending:
            sort(by: \.priceChangePercentage24H, order: .descending)
        case .priceChangePercentage24HAscending:
            sort(by: \.priceChangePercentage24H, order: .ascending)
        }
        
        enum SortOrder {
            case ascending
            case descending
        }
        
        func sort<Value>(by keyPath: KeyPath<Coin, Value>, order: SortOrder) where Value: Comparable {
            if case .descending = order {
                coins.sort { $0[keyPath: keyPath] > $1[keyPath: keyPath] }
            } else {
                coins.sort { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
            }
        }
    }
    
}
