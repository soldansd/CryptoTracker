//
//  MarketData.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import Foundation

struct MarketData: Decodable {
    let totalMarketCap, totalVolume, marketCapPercentage: [String: Double]
    let marketCapChangePercentage24HUsd: Double

    enum CodingKeys: String, CodingKey {
        case totalMarketCap = "total_market_cap"
        case totalVolume = "total_volume"
        case marketCapPercentage = "market_cap_percentage"
        case marketCapChangePercentage24HUsd = "market_cap_change_percentage_24h_usd"
    }
    
    var marketCap: Double? {
        totalMarketCap["usd"]
    }
    
    var volume: Double? {
        totalVolume["usd"]
    }
    
    var dominance: Double? {
        marketCapPercentage["btc"]
    }
}
