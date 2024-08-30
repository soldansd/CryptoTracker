//
//  PortfolioListHeaderView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 30/08/2024.
//

import SwiftUI

struct PortfolioListHeaderView: View {
    var body: some View {
        HStack {
            Text("Asset")
            
            Spacer()
            
            Text("Price")
            
            Text("Holdings")
                .frame(width: 120, alignment: .trailing)
        }
        .foregroundStyle(.secondary)
        .padding(8)
    }
}

#Preview {
    PortfolioListHeaderView()
}
