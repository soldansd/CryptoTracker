//
//  CoinDetailTitleView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 24/08/2024.
//

import SwiftUI

struct CoinDetailTitleView: View {
    
    let coinDetail: CoinDetail
    
    var body: some View {
        HStack(alignment: .bottom) {
            Text("#" + (coinDetail.detailData.marketCapRank?.toString() ?? "—"))
                .foregroundStyle(.secondary)
                .font(.headline)
            
            Text(coinDetail.name)
                .font(.title)
                .fontWeight(.bold)
                .fontDesign(.rounded)
                .offset(y: 4)
            
            Text(coinDetail.detailData.currentPrice["usd"]?.toPriceString() ?? "—")
                .fontWeight(.semibold)
            
            Spacer()
        }
    }
}

#Preview {
    CoinDetailTitleView(coinDetail: PreviewsMockData.COIN_DETAIL)
}
