//
//  PricePerCoinView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 30/08/2024.
//

import SwiftUI

struct PricePerCoinView: View {
    
    let coin: CoinDetail
    
    var body: some View {
        HStack {
            Text(coin.currentPrice["usd"]?.toPriceString() ?? "—")
            Text("Per Coin")
        }
    }
}

#Preview {
    PricePerCoinView(coin: PreviewsMockData.COIN_DETAIL)
}
