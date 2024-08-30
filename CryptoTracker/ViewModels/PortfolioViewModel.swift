//
//  PortfolioViewModel.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 27/08/2024.
//

import Foundation

class PortfolioViewModel: ObservableObject {
    
    @Published var coins: [Coin] = [] {
        didSet {
            print(coins)
        }
    }
    
    init() {
        print("Portfolio init")
        fetchCoins()
    }
    
    init(forPreview: [Coin]) {
        self.coins = forPreview
    }
    
    var currentBalance: Double {
        coins.reduce(0, { $0 + ($1.portfolioAmount ?? 0) * $1.currentPrice })
    }
    
    func fetchCoins() {
        
        let portfolio = CoreDataManager.shared.getPortfolio()
        guard !portfolio.isEmpty else {
            coins = []
            return
        }
        let ids = portfolio.compactMap { $0.id }
        
        NetworkManager.shared.getPortfolio(ids: ids) { coinsWithoutAmount in
            
            var coinsWithAmount = coinsWithoutAmount
            for index in coinsWithAmount.indices {
                coinsWithAmount[index].portfolioAmount = portfolio.first{ $0.id == coinsWithAmount[index].id }?.amount
            }
            coinsWithAmount.sort{ $0.currentHoldings > $1.currentHoldings }
            
            DispatchQueue.main.async {
                self.coins = coinsWithAmount
            }
        }
        
    }
    
    func buy(coinId id: String, amount: Double) {
        guard amount > 0 else { return }
        let portfolioAmount = coins.first(where: {$0.id == id})?.portfolioAmount ?? 0
        changePortfolio(coinId: id, amount: portfolioAmount + amount)
    }
    
    func sell(coinId id: String, amount: Double) {
        guard 
            amount > 0,
            let portfolioAmount = coins.first(where: {$0.id == id})?.portfolioAmount,
            portfolioAmount >= amount
        else { return }
        
        changePortfolio(coinId: id, amount: portfolioAmount - amount)
    }
    
    private func changePortfolio(coinId id: String, amount: Double) {
        CoreDataManager.shared.updatePortfolio(coinId: id, amount: amount)
        fetchCoins()
    }
    
}
