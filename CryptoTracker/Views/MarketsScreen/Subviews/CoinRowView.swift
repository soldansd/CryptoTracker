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
        
        HStack(spacing: 20) {
            Text("\(coin.marketCapRank)")
                .foregroundStyle(.secondary)
            
            HStack {
                
                AsyncImage(url: URL(string: coin.image)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                        .frame(width: 30, height: 30)
                }
                
                VStack(alignment: .leading) {
                    Text(coin.symbol.uppercased())
                        .font(.headline)
                    Text(coin.marketCap.toAbbreviationString())
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                }
            }
            
            
            
            Spacer()
            
            Text(coin.currentPrice.toPriceString())
                .font(.headline)
                .lineLimit(1)
            
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.footnote)
                .frame(width: 90, alignment: .trailing)
                .lineLimit(1)
        }
        .padding()
    }
}

#Preview {
    CoinRowView(
        coin: PreviewsMockData.COIN
    )
}
