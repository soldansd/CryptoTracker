//
//  CoinChangePercentageView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 24/08/2024.
//

import SwiftUI

struct CoinChangePercentageView: View {
    
    let coinDetail: CoinDetail
    private let titles: [String] = ["24 hours", "7 days", "30 days", "60 days", "1 year"]
    private let paths: [KeyPath<CoinDetail, Double>] = [
        \.priceChangePercentage24H, \.priceChangePercentage7D,
        \.priceChangePercentage30D, \.priceChangePercentage60D,
        \.priceChangePercentage1Y
    ]

    var body: some View {
        ScrollView(.horizontal,showsIndicators: false) {
            HStack {
                ForEach(titles.indices, id: \.self) { index in
                    VStack(alignment: .leading) {
                        Text(titles[index])
                        PercentageView(percentage: coinDetail[keyPath: paths[index]])
                    }
                    .padding(.horizontal, 5)
                }
            }
            .padding()
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 10))
        }
    }
}

#Preview {
    CoinChangePercentageView(coinDetail: PreviewsMockData.COIN_DETAIL)
}
