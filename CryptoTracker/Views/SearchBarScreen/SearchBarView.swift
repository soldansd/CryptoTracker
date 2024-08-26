//
//  SearchBarView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 26/08/2024.
//

import SwiftUI

struct SearchBarView: View {
    
    @StateObject var searchVM = CoinsSearchViewModel()
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            
            TextField("Search coins", text: $searchVM.searchText)
                .autocorrectionDisabled()
            
            Button {
                searchVM.searchText = ""
            } label: {
                Image(systemName: "xmark.circle.fill")
                    .foregroundStyle(.secondary)
            }
            .opacity(searchVM.searchText.isEmpty ? 0 : 1)
            .buttonStyle(.plain)
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(Capsule())
        .padding(.horizontal)
        
        List(searchVM.coinsFiltered) { coin in
            NavigationLink(destination: CoinDetailView(id: coin.id)) {
                HStack(spacing: 10) {
                    Text(coin.symbol.uppercased())
                        .font(.headline)
                    Text(coin.name)
                }
            }
        }
    }
}

#Preview {
    SearchBarView()
}
