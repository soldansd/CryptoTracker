//
//  PortfolioCoinsView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 28/08/2024.
//

import SwiftUI

struct PortfolioCoinsView: View {
    
    @EnvironmentObject var portfolioVM: PortfolioViewModel
    
    var body: some View {
        
        PortfolioListHeaderView()
        
        ScrollView(.vertical, showsIndicators: true) {
            LazyVStack {
                ForEach(portfolioVM.coins) { coin in
                    NavigationLink(destination: CoinDetailView(id: coin.id)) {
                        PortfolioCoinRowView(coin: coin)
                    }
                    .buttonStyle(.plain)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        PortfolioCoinsView()
            .environmentObject(PortfolioViewModel(forPreview: PreviewsMockData.COINS))
    }
}
