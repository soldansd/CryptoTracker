//
//  BuyCoinSheetView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 28/08/2024.
//

import SwiftUI

struct BuyCoinSheetView: View {
    
    let coin: CoinDetail
    @Binding var showSheet: Bool
    @EnvironmentObject var portfolioVM: PortfolioViewModel
    @State private var inputString = ""
    
    var body: some View {
        
        CustomSheetView(
            confirmTitle: "Buy",
            confrimIsAble: inputAmountIsValid,
            showSheet: $showSheet,
            confirmAction: { portfolioVM.buy(coinId: coin.id, amount: amountToBuy) }
        ) {
            CustomTextFieldView(placeholder: "Enter amount in $", input: $inputString)
                .padding()
            
            PricePerCoinView(coin: coin)
            
            Spacer()
        }
        
    }
    
    private var inputAmountIsValid: Bool {
        if inputStringToDouble != nil {
            return true
        }
        return false
    }
    
    private var amountToBuy: Double {
        (inputStringToDouble ?? 0) / (coin.currentPrice["usd"] ?? 1)
    }
    
    private var inputStringToDouble: Double? {
        Double(inputString.replacingOccurrences(of: ",", with: "."))
    }
}

#Preview {
    NavigationStack {
        BuyCoinSheetView(coin: PreviewsMockData.COIN_DETAIL, showSheet: .constant(true))
            .environmentObject(PortfolioViewModel(forPreview: PreviewsMockData.COINS))
    }
}
