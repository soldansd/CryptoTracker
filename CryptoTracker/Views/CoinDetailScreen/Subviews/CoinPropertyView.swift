//
//  CoinPropertyView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 24/08/2024.
//

import SwiftUI

struct CoinPropertyView: View {
    
    let title: String
    let value: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(title)
            Text(value)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
    }
}

#Preview {
    CoinPropertyView(title: "24h High", value: "3412,90 $")
}
