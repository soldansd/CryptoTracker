//
//  PreviewsMockData.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

enum PreviewsMockData {
    static let COIN = Coin(
        id: "bitcoin",
        symbol: "btc",
        name: "Bitcoin",
        image: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
        currentPrice: 70187,
        marketCapRank: 1,
        marketCap: 1381651251183,
        priceChangePercentage24H: 300.05,
        priceChange24H: nil,
        fullyDilutedValuation: nil,
        totalVolume: nil,
        high24H: nil,
        low24H: nil,
        marketCapChange24H: nil,
        marketCapChangePercentage24H: nil,
        circulatingSupply: nil,
        totalSupply: nil,
        maxSupply: nil,
        ath: nil,
        athChangePercentage: nil,
        athDate: nil,
        atl: nil,
        atlChangePercentage: nil,
        atlDate: nil,
        lastUpdated: nil
    )
    
    static let COINS = [
        COIN,
        Coin(
            id: "ethereum",
            symbol: "eth",
            name: "Ethereum",
            image: "https://coin-images.coingecko.com/coins/images/279/large/ethereum.png?16965016280",
            currentPrice: 2634.47,
            marketCapRank: 2,
            marketCap: 316874133631,
            priceChangePercentage24H: -1.76,
            priceChange24H: nil,
            fullyDilutedValuation: nil,
            totalVolume: nil,
            high24H: nil,
            low24H: nil,
            marketCapChange24H: nil,
            marketCapChangePercentage24H: nil,
            circulatingSupply: nil,
            totalSupply: nil,
            maxSupply: nil,
            ath: nil,
            athChangePercentage: nil,
            athDate: nil,
            atl: nil,
            atlChangePercentage: nil,
            atlDate: nil,
            lastUpdated: nil
        ),
        Coin(
            id: "tether",
            symbol: "usdt",
            name: "Tether",
            image: "https://coin-images.coingecko.com/coins/images/325/large/Tether.png?1696501661",
            currentPrice: 0.99964148,
            marketCapRank: 3,
            marketCap: 117352549688,
            priceChangePercentage24H: 0.00,
            priceChange24H: nil,
            fullyDilutedValuation: nil,
            totalVolume: nil,
            high24H: nil,
            low24H: nil,
            marketCapChange24H: nil,
            marketCapChangePercentage24H: nil,
            circulatingSupply: nil,
            totalSupply: nil,
            maxSupply: nil,
            ath: nil,
            athChangePercentage: nil,
            athDate: nil,
            atl: nil,
            atlChangePercentage: nil,
            atlDate: nil,
            lastUpdated: nil
        )
    ]
}
