//
//  CoinPropertiesBarView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 24/08/2024.
//

import SwiftUI

struct CoinPropertiesBarView: View {
    
    let coinDetail: CoinDetail
    
    private let coinPropertiesValues: [String]
    
    private let coinPropertiesTitles = [
        "Market Cap",
        "Total Volume",
        "24h High",
        "24h Low",
        "ATH",
        "ATL",
        "Block Time",
        "Hashing Algorithm"
    ]
    
    init(coinDetail: CoinDetail) {
        self.coinDetail = coinDetail
        coinPropertiesValues = [ 
            coinDetail.detailData.marketCap["usd"]?.toAbbreviationString() ?? "—",
            coinDetail.detailData.totalVolume["usd"]?.toAbbreviationString() ?? "—",
            coinDetail.detailData.high24H["usd"]?.toPriceString() ?? "—",
            coinDetail.detailData.low24H["usd"]?.toPriceString() ?? "—",
            coinDetail.detailData.ath["usd"]?.toPriceString() ?? "—",
            coinDetail.detailData.atl["usd"]?.toPriceString() ?? "—",
            String(coinDetail.blockTimeInMinutes) + " min",
            coinDetail.hashingAlgorithm ?? "—"
        ]
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible(minimum: 50, maximum: 150) ,alignment: .leading), count: 2), spacing: 12) {
                ForEach(coinPropertiesTitles.indices, id: \.self) { index in
                    CoinPropertyView(title: coinPropertiesTitles[index], value: coinPropertiesValues[index])
                        .padding(.vertical, 4)
                }
            }
        }
    }
}

#Preview {
    CoinPropertiesBarView(coinDetail: PreviewsMockData.COIN_DETAIL)
}
