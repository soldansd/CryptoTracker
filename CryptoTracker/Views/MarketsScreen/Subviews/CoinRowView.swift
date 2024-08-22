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
            
            VStack(alignment: .leading) {
                Text(coin.symbol.uppercased())
                    .font(.headline)
                Text(coin.marketCap.toAbbreviationString())
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            
            Spacer()
            
            Text(coin.currentPrice.toPriceString())
                .padding(.trailing, 3)
                .font(.headline)
                .lineLimit(1)
            
            
            Text(coin.priceChangePercentage24H.toPercentString())
                .font(.system(size: 15))
                .lineLimit(1)
                .padding(5)
                .background(percentageColor.opacity(0.12))
                .foregroundStyle(percentageColor)
                .clipShape(RoundedRectangle(cornerRadius: 7))
                .frame(width: 90, alignment: .trailing)
                
        }
        .padding(8)
    }
    
    private var percentageColor: Color {
        if coin.priceChangePercentage24H == 0 {
            return .secondary
        } else if coin.priceChangePercentage24H > 0 {
            return .green
        } else  {
            return .red
        }
    }
}

#Preview {
    CoinRowView(
        coin: PreviewsMockData.COIN
    )
}
