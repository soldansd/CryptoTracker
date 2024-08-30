//
//  MarketsView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct MarketView: View {
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                Text("Market")
                    .headerFont()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                MarketDataPanelView()
                
                CoinsListView()
            }
        }
    }
}

#Preview {
    MarketView()
}
