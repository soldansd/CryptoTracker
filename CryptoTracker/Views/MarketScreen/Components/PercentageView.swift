//
//  PercentageView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import SwiftUI

struct PercentageView: View {
    
    let percentage: Double
    
    var body: some View {
        Text(percentage == 0 ? "—" : percentage.toPercentString())
            .font(.system(size: 15))
            .lineLimit(1)
            .padding(5)
            .background(percentageColor.opacity(0.12))
            .foregroundStyle(percentageColor)
            .clipShape(RoundedRectangle(cornerRadius: 7))
    }
    
    private var percentageColor: Color {
        if percentage == 0 {
            return .secondary
        } else if percentage > 0 {
            return .green
        } else  {
            return .red
        }
    }
}

#Preview {
    VStack {
        PercentageView(percentage: 0)
        PercentageView(percentage: -3.58)
    }
}
