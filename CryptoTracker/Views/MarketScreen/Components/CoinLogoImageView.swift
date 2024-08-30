//
//  CoinLogoImageView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct CoinLogoImageView: View {
    let urlString: String
    
    var body: some View {
        AsyncImage(url: URL(string: urlString)) { image in
            image
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
        } placeholder: {
            ProgressView()
        }
    }
}

#Preview {
    CoinLogoImageView(urlString: "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400")
}
