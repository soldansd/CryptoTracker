//
//  SellCoinButtonView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 28/08/2024.
//

import SwiftUI

struct SellCoinButtonView: View {
    
    let coin: CoinDetail
    
    var body: some View {
        ButtonWithSheetView(title: "Sell") { showSheet in
            SellCoinSheetView(coin: coin, showSheet: showSheet)
        }
    }
}

#Preview {
    NavigationStack {
        SellCoinButtonView(coin: PreviewsMockData.COIN_DETAIL)
    }
}
