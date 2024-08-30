//
//  MarketsViewModel.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

final class CoinsListViewModel: ObservableObject {
    
    static let defaultCoinsAmount = 100
    
    @Published var coins: [Coin] = []
    
    @Published var sortOption: SortOption = .marketCapDescending {
        didSet {
            sortCoins()
        }
    }
    
    init() {
        print("Coins List init")
        fetchCoins(amount: CoinsListViewModel.defaultCoinsAmount)
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
    
    func sortCoins() {
        switch sortOption {
        case.marketCapRankDescending:
            sortCoins(by: \.marketCapRank, order: .descending)
        case.marketCapRankAscending:
            sortCoins(by: \.marketCapRank, order: .ascending)
        case .marketCapDescending:
            sortCoins(by: \.marketCap, order: .descending)
        case .marketCapAscending:
            sortCoins(by: \.marketCap, order: .ascending)
        case .priceDescending:
            sortCoins(by: \.currentPrice, order: .descending)
        case .priceAscending:
            sortCoins(by: \.currentPrice, order: .ascending)
        case .priceChangePercentage24HDescending:
            sortCoins(by: \.priceChangePercentage24H, order: .descending)
        case .priceChangePercentage24HAscending:
            sortCoins(by: \.priceChangePercentage24H, order: .ascending)
        }
    }
    
    private enum SortOrder {
        case ascending
        case descending
    }
    
    private func sortCoins<Value>(by keyPath: KeyPath<Coin, Value>, order: SortOrder) where Value: Comparable {
        if case .descending = order {
             coins.sort { $0[keyPath: keyPath] > $1[keyPath: keyPath]  }
        } else {
            coins.sort { $0[keyPath: keyPath] < $1[keyPath: keyPath] }
        }
    }
    
}
