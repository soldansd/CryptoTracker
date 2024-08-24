//
//  MarketDataPanelView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import SwiftUI

struct MarketDataPanelView: View {
    @EnvironmentObject var marketsVM: MarketsViewModel
    
    var body: some View {
        
        HStack(alignment: .top, spacing: 20) {
            
            VStack(alignment: .leading, spacing: 5) {
                MarketDataICellHeaderView(
                    title: "Market Cap",
                    value: marketsVM.marketData?.totalMarketCap["usd"]?.toAbbreviationString() ?? "—"
                )
                
                PercentageView(percentage: marketsVM.marketData?.marketCapChangePercentage24HUsd ?? 0)
            }
            
            Rectangle()
                .fill(.secondary)
                .frame(width: 1)
            
            MarketDataICellHeaderView(
                title: "Volume",
                value: marketsVM.marketData?.totalVolume["usd"]?.toAbbreviationString() ?? "—"
            )
            
            Rectangle()
                .fill(.secondary)
                .frame(width: 1)
            
            VStack(alignment: .leading, spacing: 8) {
                MarketDataICellHeaderView(title: "Dominance", value: marketsVM.marketData?.marketCapPercentage["btc"]?.toPercentString() ?? "—")
                
                HStack {
                    Image("bitcoinIcon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                    
                    Text("BTC")
                        .foregroundStyle(.secondary)
                }
            }

        }
        .padding()
        .frame(height: 100)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(8)
    }
}

#Preview {
    MarketDataPanelView()
        .environmentObject(MarketsViewModel(forPreviews: PreviewsMockData.COINS))
}
