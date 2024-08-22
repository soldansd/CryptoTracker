//
//  CoinsListView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct CoinsListView: View {
    
    @EnvironmentObject var marketsVM: MarketsViewModel
    
    var body: some View {
        
        SortBarView()
        
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack {
                ForEach(marketsVM.coins) { coin in
                    CoinRowView(coin: coin)
                }
            }
        }
        
    }
}

#Preview {
    CoinsListView()
        .environmentObject(MarketsViewModel(forPreviews: PreviewsMockData.COINS))
}
