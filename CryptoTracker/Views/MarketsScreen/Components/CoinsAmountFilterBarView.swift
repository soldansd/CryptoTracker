//
//  CoinsAmountFilterBarView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct CoinsAmountFilterBarView: View {
    
    @EnvironmentObject var marketsVM: CoinsListViewModel
    @State private var lastTappedButton = 1
    private var buttonTitles = [50, CoinsListViewModel.defaultCoinsAmount, 150, 200, 250]
    
    var body: some View {
        HStack(spacing: 15) {
            Text("Top: ")
                .font(.headline)
            
            ForEach(buttonTitles.indices, id: \.self) { index in
                CoinsAmountButtonView(title: "\(buttonTitles[index])") {
                    self.lastTappedButton = index
                    marketsVM.fetchCoins(amount: buttonTitles[index])
                    marketsVM.sortCoins()
                }
                .opacity(lastTappedButton == index ? 1.0 : 0.4)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .lineLimit(1)
        .padding(8)
    }
}

#Preview {
    CoinsAmountFilterBarView()
        .environmentObject(CoinsListViewModel(forPreviews: PreviewsMockData.COINS))
}
