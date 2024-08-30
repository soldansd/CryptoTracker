//
//  PortfolioCoinRowView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 28/08/2024.
//

import SwiftUI

struct PortfolioCoinRowView: View {
    
    let coin: Coin
    
    var body: some View {
        HStack {
            CoinLogoImageView(urlString: coin.image)
                .frame(width: 34, height: 34)
            
            CapitalizationView(
                title: coin.name,
                amount: coin.symbol.uppercased(),
                spacing: 10
            )
            
            Spacer()
            
            VStack(alignment: .trailing, spacing: 3) {
                PriceView(title: coin.currentPrice.toPriceString())
                
                PercentageView(percentage: coin.priceChangePercentage24H)
                    .frame(width: 90, alignment: .trailing)
            }
            
            VStack(alignment: .trailing, spacing: 8) {
                PriceView(title: coin.currentHoldings.toPriceShortString())
                
                HStack {
                    Text(coin.portfolioAmount?.toAbbreviationString(withCurency: false) ?? "—")
                    Text(coin.symbol.uppercased())
                        .foregroundStyle(.secondary)
                }
            }
            .frame(width: 120, alignment: .trailing)
        }
        .frame(maxWidth: .infinity)
        .padding(8)
    }
}

#Preview {
    PortfolioCoinRowView(coin: PreviewsMockData.COIN)
}
