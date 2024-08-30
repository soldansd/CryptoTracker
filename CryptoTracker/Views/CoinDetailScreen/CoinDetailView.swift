//
//  CoinDetailView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import SwiftUI

struct CoinDetailView: View {
    
    @StateObject var coinDetailVM: CoinDetailViewModel
    @EnvironmentObject var portfolioVM: PortfolioViewModel
    
    init(id: String) {
        self._coinDetailVM = StateObject(wrappedValue: CoinDetailViewModel(id: id))
    }
    
    var body: some View {
        if let coinDetail = coinDetailVM.coinDetail {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    HStack {
                        CoinDetailTitleView(coinDetail: coinDetail)
                        
                        if portfolioVM.coins.first(where: {$0.id == coinDetail.id}) != nil {
                            SellCoinButtonView(coin: coinDetail)
                        }
                        
                        BuyCoinButtonView(coin: coinDetail)
                    }
                    
                    
                    LineChartView(
                        data: coinDetailVM.coinDetail?.detailData.sparkline7D.price ?? []
                    )
                    
                    CoinChangePercentageView(coinDetailData: coinDetail.detailData)
                    
                    CoinDescriptionView(coinDetail: coinDetail)
                    
                    CoinPropertiesBarView(coinDetail: coinDetail)
                }
                
            }
            .padding(.horizontal)
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    DismissButtonView()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    HStack {
                        Text(coinDetail.symbol.uppercased())
                        CoinLogoImageView(urlString: coinDetail.image.small)
                            .frame(width: 20, height: 20)
                    }
                }
            }
        } else {
            LoadingView(title: "Loading coin's data")
        }
    }
    
}

#Preview {
    NavigationStack {
        CoinDetailView(id: "ethereum")
            .environmentObject(PortfolioViewModel(forPreview: PreviewsMockData.COINS))
    }
}
