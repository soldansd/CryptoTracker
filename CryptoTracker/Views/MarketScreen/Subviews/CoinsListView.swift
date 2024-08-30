//
//  CoinsListView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct CoinsListView: View {
    
    @StateObject var coinsListVM = CoinsListViewModel()
    
    var body: some View {
        VStack {
            CoinsAmountFilterBarView()
            
            SortBarView()
            
            ScrollView(.vertical, showsIndicators: true) {
                LazyVStack {
                    ForEach(coinsListVM.coins) { coin in
                        NavigationLink(destination: CoinDetailView(id: coin.id)) {
                            CoinRowView(coin: coin)
                        }
                        .buttonStyle(.plain)
                    }
                }
            }
            .refreshable {
                coinsListVM.fetchCoins(amount: coinsListVM.coins.count)
            }
        }
        .environmentObject(coinsListVM)
    }
}

#Preview {
    NavigationStack {
        CoinsListView()
    }
}
