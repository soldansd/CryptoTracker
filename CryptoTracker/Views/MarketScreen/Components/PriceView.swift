//
//  PriceView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 28/08/2024.
//

import SwiftUI

struct PriceView: View {
    
    let title: String
    
    var body: some View {
        Text(title)
            .padding(.trailing, 3)
            .font(.headline)
            .lineLimit(1)
    }
}

#Preview {
    PriceView(title: "50 000$")
}
