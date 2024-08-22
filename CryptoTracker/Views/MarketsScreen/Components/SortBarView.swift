//
//  SortBarView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct SortBarView: View {
    
    @EnvironmentObject var marketsVM: MarketsViewModel
    
    var body: some View {
        HStack {
            
            SortOptionButtonView(
                title: "#",
                options: (asc: .marketCapRankAscending, desc: .marketCapRankDescending)
            )
            .frame(width: 35, alignment: .leading)
            
            SortOptionButtonView(
                title: "Market Cap",
                options: (asc: .marketCapAscending, desc: .marketCapDescending)
            )
            
            Spacer()
            
            SortOptionButtonView(
                title: "Price",
                options: (asc: .priceAscending, desc: .priceDescending)
            )
            
            SortOptionButtonView(
                title: "24h %",
                options: (asc: .priceChangePercentage24HAscending, desc: .priceChangePercentage24HDescending)
            )
            .frame(width: 90, alignment: .trailing)
            
        }
        .font(.system(size: 15))
        .foregroundStyle(.secondary)
        .padding(8)
    }
}

#Preview {
    SortBarView()
        .environmentObject(MarketsViewModel(forPreviews: PreviewsMockData.COINS))
}
