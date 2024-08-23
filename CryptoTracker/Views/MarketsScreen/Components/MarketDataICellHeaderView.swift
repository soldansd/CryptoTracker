//
//  MarketDataICellView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import SwiftUI

struct MarketDataICellHeaderView: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(.secondary)
            Text(value)
                .font(.headline)
        }
    }
}

#Preview {
    MarketDataICellHeaderView(title: "Market Cap", value: "2,16T $")
}
