//
//  MarketsView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct MarketsView: View {
    
    @StateObject var marketsVM = CoinsListViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 8) {
                
                Text("Markets")
                    .headerFont()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                
                MarketDataPanelView()
                
                CoinsListView()
            }
            .environmentObject(marketsVM)
        }
    }
}

#Preview {
    MarketsView(marketsVM: CoinsListViewModel(forPreviews: PreviewsMockData.COINS))
}
