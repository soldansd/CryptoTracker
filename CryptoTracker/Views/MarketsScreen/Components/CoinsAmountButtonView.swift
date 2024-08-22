//
//  CoinsAmountButtonView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct CoinsAmountButtonView: View {
    
    let tittle: String
    let action: () -> ()
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(tittle)
                .font(.headline)
                .padding(8)
                .background(.secondary)
                .clipShape(RoundedRectangle(cornerRadius: 7))
        }
    }
}

#Preview {
    CoinsAmountButtonView(tittle: "100", action: {})
}
