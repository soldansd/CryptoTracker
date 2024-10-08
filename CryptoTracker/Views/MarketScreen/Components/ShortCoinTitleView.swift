//
//  ShortCoinTitleView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 28/08/2024.
//

import SwiftUI

struct ShortCoinTitleView: View {
    
    let title: String
    let amount: String
    var spacing: CGFloat = 8
    
    var body: some View {
        VStack(alignment: .leading, spacing: spacing) {
            Text(title)
                .font(.headline)
            Text(amount)
                .font(.subheadline)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    ShortCoinTitleView(title: "BTC", amount: "1.4T $")
}
