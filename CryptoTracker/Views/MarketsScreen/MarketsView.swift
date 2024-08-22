//
//  MarketsView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import SwiftUI

struct MarketsView: View {
    
    @StateObject var marketsVM = MarketsViewModel()
    
    var body: some View {
        CoinsListView(marketsVM: marketsVM)
    }
}

#Preview {
    MarketsView()
}
