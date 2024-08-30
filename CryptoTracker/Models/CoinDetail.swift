//
//  CoinDetail.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import Foundation

struct CoinDetail: Decodable {
    let id, symbol, name: String
    let blockTimeInMinutes: Int
    let hashingAlgorithm: String?
    let description: Description
    let links: Links?
    let image: ImageURLString
    let detailData: CoinDetailData

    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case blockTimeInMinutes = "block_time_in_minutes"
        case hashingAlgorithm = "hashing_algorithm"
        case description, links, image
        case detailData = "market_data"
    }
    
    struct Description: Decodable {
        let en: String
    }

    struct ImageURLString: Decodable {
        let small: String
    }

    struct Links: Decodable {
        let whitepaper: String?
    }

    struct CoinDetailData: Decodable {
        let currentPrice: [String: Double]
        let ath: [String: Double]
        let atl: [String: Double]
        let marketCap: [String: Double]
        let marketCapRank: Int?
        let totalVolume, high24H, low24H: [String: Double]
        let priceChangePercentage24H, priceChangePercentage7D, priceChangePercentage30D: Double
        let priceChangePercentage60D, priceChangePercentage1Y: Double
        let sparkline7D: Sparkline7D

        enum CodingKeys: String, CodingKey {
            case currentPrice = "current_price"
            case ath, atl
            case marketCap = "market_cap"
            case marketCapRank = "market_cap_rank"
            case totalVolume = "total_volume"
            case high24H = "high_24h"
            case low24H = "low_24h"
            case priceChangePercentage24H = "price_change_percentage_24h"
            case priceChangePercentage7D = "price_change_percentage_7d"
            case priceChangePercentage30D = "price_change_percentage_30d"
            case priceChangePercentage60D = "price_change_percentage_60d"
            case priceChangePercentage1Y = "price_change_percentage_1y"
            case sparkline7D = "sparkline_7d"
        }
        
    }

    struct Sparkline7D: Decodable {
        let price: [Double]
    }

}

