//
//  CoinsAmountFilterBarView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct CoinsAmountFilterBarView: View {
    
    @EnvironmentObject var marketsVM: MarketsViewModel
    
    var body: some View {
        HStack(spacing: 5) {
            Text("Top: ")
            
            Spacer()
            
            CoinsAmountButtonView(tittle: "50") {
                
            }
            
            CoinsAmountButtonView(tittle: "100") {
                
            }
            
            CoinsAmountButtonView(tittle: "150") {
                
            }
            
            CoinsAmountButtonView(tittle: "200") {
                
            }
            
            CoinsAmountButtonView(tittle: "250") {
                
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
        .environmentObject(MarketsViewModel(forPreviews: PreviewsMockData.COINS))
}
