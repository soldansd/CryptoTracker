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
        
        CoinsAmountFilterBarView()
        
        SortBarView()
        
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack {
                ForEach(marketsVM.coins) { coin in
                    NavigationLink(destination: CoinDetailView(id: coin.id)) {
                        CoinRowView(coin: coin)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
        
    }
}

#Preview {
    NavigationStack {
        CoinsListView()
            .environmentObject(MarketsViewModel(forPreviews: PreviewsMockData.COINS))
    }
}
