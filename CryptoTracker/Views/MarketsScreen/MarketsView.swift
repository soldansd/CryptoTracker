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
        VStack {
            MarketDataPanelView()
            CoinsListView()
        }
        .environmentObject(marketsVM)
        .navigationTitle("Markets")
    }
}

#Preview {
    MarketsView(marketsVM: CoinsListViewModel(forPreviews: PreviewsMockData.COINS))
}
