//
//  CoinDescriptionView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 24/08/2024.
//

import SwiftUI

struct CoinDescriptionView: View {
    
    let coinDetail: CoinDetail
    @State private var showFullDescription = false
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Description")
                    .font(.title3)
                
                Spacer()
                
                if let whitepaper = coinDetail.whitepaper, let url = URL(string: whitepaper) {
                    Link("Read Whitepaper", destination: url)
                        .font(.headline)
                }
            }
            .padding(.bottom, 8)
            
            Text(coinDetail.description.removeHTMLLinks())
                .lineLimit(showFullDescription ? nil : 4)
            
            Button {
                withAnimation {
                    showFullDescription.toggle()
                }
            } label: {
                Text(showFullDescription ? "Reduce..." : "Expand...")
            }
        }
    }
}

#Preview {
    CoinDescriptionView(coinDetail: PreviewsMockData.COIN_DETAIL)
}
