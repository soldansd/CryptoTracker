//
//  BuyCoinView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 28/08/2024.
//

import SwiftUI

struct BuyCoinButtonView: View {
    
    let coin: CoinDetail
    
    var body: some View {
        ButtonWithSheetView(title: "Buy") { showSheet in
            BuyCoinSheetView(coin: coin, showSheet: showSheet)
        }
    }
}

#Preview {
    NavigationStack {
        BuyCoinButtonView(coin: PreviewsMockData.COIN_DETAIL)
    }
}
