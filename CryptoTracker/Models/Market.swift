//
//  Market.swift
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
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: DataCodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: CodingKeys.self, forKey: .data)
        
        totalMarketCap = try dataContainer.decode([String: Double].self, forKey: .totalMarketCap)
        totalVolume = try dataContainer.decode([String: Double].self, forKey: .totalVolume)
        marketCapPercentage = try dataContainer.decode([String: Double].self, forKey: .marketCapPercentage)
        marketCapChangePercentage24HUsd = try dataContainer.decode(Double.self, forKey: .marketCapChangePercentage24HUsd)
    }
    
    enum DataCodingKeys: String, CodingKey {
        case data
    }
}



