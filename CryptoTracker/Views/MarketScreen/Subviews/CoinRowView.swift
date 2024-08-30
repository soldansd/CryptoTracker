//
//  CoinRowView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coin
    
    var body: some View {
        HStack {
            Text("\(coin.marketCapRank)")
                .frame(width: 35, alignment: .leading)
                .foregroundStyle(.secondary)
                .lineLimit(1)
            
            CoinLogoImageView(urlString: coin.image)
                .frame(width: 30, height: 30)
            
            CapitalizationView(
                title: coin.symbol.uppercased(),
                amount: coin.marketCap.toAbbreviationString()
            )
            
            Spacer()
            
            PriceView(title: coin.currentPrice.toPriceString())
            
            PercentageView(percentage: coin.priceChangePercentage24H)
                .frame(width: 90, alignment: .trailing)
        }
        .padding(8)
    }
    
}

#Preview {
    CoinRowView(
        coin: PreviewsMockData.COIN
    )
}
