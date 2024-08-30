//
//  Coin.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

// MARK: - This model is used for displaying data in row of coins' list
struct Coin: Decodable, Identifiable {
    
    let id, symbol, name: String
    let image: String
    let currentPrice: Double
    let marketCapRank: Int
    let marketCap, priceChangePercentage24H: Double
    var portfolioAmount: Double?
    
    var currentHoldings: Double {
        (portfolioAmount ?? 0) * currentPrice
    }

    enum CodingKeys: String, CodingKey {
        case id, symbol, name, image
        case currentPrice = "current_price"
        case marketCap = "market_cap"
        case marketCapRank = "market_cap_rank"
        case priceChangePercentage24H = "price_change_percentage_24h"
    }
}

