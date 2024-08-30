//
//  SortOptionButtonView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct SortOptionButtonView: View {
    
    @EnvironmentObject var coinsListVM: CoinsListViewModel
    let title: String
    let options: (asc: CoinsListViewModel.SortOption, desc: CoinsListViewModel.SortOption)
   
    var body: some View {
        Button {
            withAnimation(.smooth) {
                coinsListVM.sortOption = (coinsListVM.sortOption == options.desc) ? options.asc : options.desc
            }
        } label: {
            HStack(spacing: 3) {
                Text(title)
                    
                Image(systemName: "chevron.down")
                    .imageScale(.small)
                    .opacity((coinsListVM.sortOption == options.desc || coinsListVM.sortOption == options.asc) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: coinsListVM.sortOption == options.desc ? 0 : 180))
            }
            
        }
    }
}

#Preview {
    SortOptionButtonView(
        title: "Market Cap",
        options: (asc: .marketCapAscending, desc: .marketCapDescending)
    )
    .environmentObject(CoinsListViewModel(forPreviews: PreviewsMockData.COINS))
}
