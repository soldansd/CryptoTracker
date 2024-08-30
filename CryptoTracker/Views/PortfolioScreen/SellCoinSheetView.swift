//
//  SellCoinSheetView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 28/08/2024.
//

import SwiftUI

struct SellCoinSheetView: View {
    
    let coin: CoinDetail
    @Binding var showSheet: Bool
    @EnvironmentObject var portfolioVM: PortfolioViewModel
    @State private var inputString = ""
    
    var body: some View {
        
        CustomSheetView(
            confirmTitle: "Sell",
            confrimIsAble: inputAmountIsValid,
            showSheet: $showSheet,
            confirmAction: {portfolioVM.sell(coinId: coin.id, amount: inputStringToDouble ?? 0)},
            content: {sheetContent}
        )
        
    }
    
    private var sheetContent: some View {
        VStack {
            HStack(spacing: 7) {
                CustomTextFieldView(
                    placeholder: "Enter sell amount",
                    input: $inputString
                )
                
                maxButton
            }
            .padding(.horizontal)
            
            PricePerCoinView(coin: coin)
                .padding()
            
            Spacer()
        }
    }
    
    private var maxButton: some View {
        Button {
            inputString = String(maxAmountOfCoinInPortfolio)
        } label: {
            Text("MAX")
        }
    }
    
    private var inputAmountIsValid: Bool {
        if let amount = Double(inputString.replacingOccurrences(of: ",", with: ".")),
           let portfolioAmount = portfolioVM.coins.first(where: {$0.id == coin.id})?.portfolioAmount,
           amount <= portfolioAmount
        {
            return true
        }
        return false
    }
    
    private var maxAmountOfCoinInPortfolio: Double {
        portfolioVM.coins.first{$0.id == coin.id}?.portfolioAmount ?? 0
    }
    
    private var inputStringToDouble: Double? {
        Double(inputString.replacingOccurrences(of: ",", with: "."))
    }
    
}

#Preview {
    NavigationStack {
        SellCoinSheetView(coin: PreviewsMockData.COIN_DETAIL, showSheet: .constant(true))
            .environmentObject(PortfolioViewModel(forPreview: PreviewsMockData.COINS))
    }
}
