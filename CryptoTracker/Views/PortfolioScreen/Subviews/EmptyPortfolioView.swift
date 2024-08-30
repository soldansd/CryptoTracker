//
//  EmptyPortfolioView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 29/08/2024.
//

import SwiftUI

struct EmptyPortfolioView: View {
    
    var body: some View {
        VStack(spacing: 30) {
            Image(systemName: "person.crop.circle")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            Text("Your portfolio is empty")
                .headerFont()
        }
    }
}

#Preview {
    EmptyPortfolioView()
}
