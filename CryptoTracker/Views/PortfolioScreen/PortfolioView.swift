//
//  PortfolioView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 28/08/2024.
//

import SwiftUI

struct PortfolioView: View {
    
    @EnvironmentObject var portfolioVM: PortfolioViewModel
    
    var body: some View {
        NavigationStack {
            if !portfolioVM.coins.isEmpty {
                VStack(alignment: .leading) {
                    Text("Portfolio")
                        .headerFont()
                        .padding(.leading)
                    
                    PieChartView()
                        .padding(.horizontal, 8)
                    
                    PortfolioCoinsView()
                }
            } else {
                EmptyPortfolioView()
            }
        }
    }
}

#Preview {
    NavigationStack {
        PortfolioView()
            .environmentObject(PortfolioViewModel(forPreview: PreviewsMockData.COINS))
    }
}
