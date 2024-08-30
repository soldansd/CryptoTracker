//
//  PieChartView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 28/08/2024.
//

import SwiftUI
import Charts

struct PieChartView: View {
    
    @EnvironmentObject var portfolioVM: PortfolioViewModel
    
    var body: some View {
        GroupBox("Balance: " + portfolioVM.currentBalance.toPriceShortString()) {
            Chart {
                ForEach(portfolioVM.coins) { coin in
                    SectorMark(
                        angle: .value(coin.name, coin.currentHoldings),
                        innerRadius: .ratio(0.5),
                        angularInset: 1
                    )
                    .foregroundStyle(by: .value("id", coin.id))
                    .cornerRadius(5)
                }
            }
            .chartLegend(position: .trailing, alignment: .center)
        }
        .backgroundStyle(.regularMaterial)
        .frame(minHeight: 260, maxHeight: 300)
    }
}

#Preview {
    PieChartView()
        .environmentObject(PortfolioViewModel(forPreview: PreviewsMockData.COINS))
}
