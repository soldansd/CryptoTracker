//
//  CoinDetailView.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import SwiftUI

struct CoinDetailView: View {
    
    @StateObject var coinDetailVM: CoinDetailViewModel
    
    init(id: String) {
        self._coinDetailVM = StateObject(wrappedValue: CoinDetailViewModel(id: id))
    }
    
    var body: some View {
        if let coinDetail = coinDetailVM.coinDetail {
            ScrollView(showsIndicators: false) {
                VStack(spacing: 30) {
                    
                    CoinDetailTitleView(coinDetail: coinDetail)
                    
                    ZStack(alignment: .topTrailing) {
                        Text("7D")
                            .foregroundStyle(.secondary)
                            .offset(y: -25)
                        ChartView(
                            data: coinDetailVM.coinDetail?.detailData.sparkline7D.price ?? []
                        )
                    }
                    
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
    }
   
}
