//
//  CoinDetail.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import Foundation

// MARK: - This model is used to display a detail coin's screen
struct CoinDetail: Decodable {
    
    let id, symbol, name: String
    let blockTimeInMinutes: Int
    let hashingAlgorithm: String?
    let description: String
    let whitepaper: String?
    let image: String
    let currentPrice: [String: Double]
    let ath: [String: Double]
    let atl: [String: Double]
    let marketCap: [String: Double]
    let marketCapRank: Int?
    let totalVolume: [String: Double]
    let high24H: [String: Double]
    let low24H: [String: Double]
    let priceChangePercentage24H: Double
    let priceChangePercentage7D: Double
    let priceChangePercentage30D: Double
    let priceChangePercentage60D: Double
    let priceChangePercentage1Y: Double
    let sparkline7D: [Double]

    enum CodingKeys: String, CodingKey {
        case id, symbol, name
        case blockTimeInMinutes = "block_time_in_minutes"
        case hashingAlgorithm = "hashing_algorithm"
        case description, links, image
        case detailData = "market_data"
    }

    enum DescriptionKeys: String, CodingKey {
        case en
    }

    enum ImageKeys: String, CodingKey {
        case small
    }

    enum LinksKeys: String, CodingKey {
        case whitepaper
    }

    enum MarketDataKeys: String, CodingKey {
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

    enum Sparkline7DKeys: String, CodingKey {
        case price
    }
    
    init(
        id: String,
        symbol: String,
        name: String,
        blockTimeInMinutes: Int,
        hashingAlgorithm: String?,
        description: String,
        whitepaper: String?,
        image: String,
        currentPrice: [String : Double],
        ath: [String : Double],
        atl: [String : Double],
        marketCap: [String : Double],
        marketCapRank: Int?,
        totalVolume: [String : Double],
        high24H: [String : Double],
        low24H: [String : Double],
        priceChangePercentage24H: Double,
        priceChangePercentage7D: Double,
        priceChangePercentage30D: Double,
        priceChangePercentage60D: Double,
        priceChangePercentage1Y: Double,
        sparkline7D: [Double]
    ) {
        self.id = id
        self.symbol = symbol
        self.name = name
        self.blockTimeInMinutes = blockTimeInMinutes
        self.hashingAlgorithm = hashingAlgorithm
        self.description = description
        self.whitepaper = whitepaper
        self.image = image
        self.currentPrice = currentPrice
        self.ath = ath
        self.atl = atl
        self.marketCap = marketCap
        self.marketCapRank = marketCapRank
        self.totalVolume = totalVolume
        self.high24H = high24H
        self.low24H = low24H
        self.priceChangePercentage24H = priceChangePercentage24H
        self.priceChangePercentage7D = priceChangePercentage7D
        self.priceChangePercentage30D = priceChangePercentage30D
        self.priceChangePercentage60D = priceChangePercentage60D
        self.priceChangePercentage1Y = priceChangePercentage1Y
        self.sparkline7D = sparkline7D
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        id = try container.decode(String.self, forKey: .id)
        symbol = try container.decode(String.self, forKey: .symbol)
        name = try container.decode(String.self, forKey: .name)
        blockTimeInMinutes = try container.decode(Int.self, forKey: .blockTimeInMinutes)
        hashingAlgorithm = try container.decodeIfPresent(String.self, forKey: .hashingAlgorithm)

        let descriptionContainer = try container.nestedContainer(keyedBy: DescriptionKeys.self, forKey: .description)
        description = try descriptionContainer.decode(String.self, forKey: .en)

        let linksContainer = try container.nestedContainer(keyedBy: LinksKeys.self, forKey: .links)
        whitepaper = try linksContainer.decodeIfPresent(String.self, forKey: .whitepaper)

        let imageContainer = try container.nestedContainer(keyedBy: ImageKeys.self, forKey: .image)
        image = try imageContainer.decode(String.self, forKey: .small)

        let marketDataContainer = try container.nestedContainer(keyedBy: MarketDataKeys.self, forKey: .detailData)
        currentPrice = try marketDataContainer.decode([String: Double].self, forKey: .currentPrice)
        ath = try marketDataContainer.decode([String: Double].self, forKey: .ath)
        atl = try marketDataContainer.decode([String: Double].self, forKey: .atl)
        marketCap = try marketDataContainer.decode([String: Double].self, forKey: .marketCap)
        marketCapRank = try marketDataContainer.decodeIfPresent(Int.self, forKey: .marketCapRank)
        totalVolume = try marketDataContainer.decode([String: Double].self, forKey: .totalVolume)
        high24H = try marketDataContainer.decode([String: Double].self, forKey: .high24H)
        low24H = try marketDataContainer.decode([String: Double].self, forKey: .low24H)
        priceChangePercentage24H = try marketDataContainer.decode(Double.self, forKey: .priceChangePercentage24H)
        priceChangePercentage7D = try marketDataContainer.decode(Double.self, forKey: .priceChangePercentage7D)
        priceChangePercentage30D = try marketDataContainer.decode(Double.self, forKey: .priceChangePercentage30D)
        priceChangePercentage60D = try marketDataContainer.decode(Double.self, forKey: .priceChangePercentage60D)
        priceChangePercentage1Y = try marketDataContainer.decode(Double.self, forKey: .priceChangePercentage1Y)

        let sparkline7DContainer = try marketDataContainer.nestedContainer(keyedBy: Sparkline7DKeys.self, forKey: .sparkline7D)
        sparkline7D = try sparkline7DContainer.decode([Double].self, forKey: .price)
    }
}
