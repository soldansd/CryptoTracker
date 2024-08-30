//
//  CoinDetailViewModel.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 23/08/2024.
//

import Foundation

final class CoinDetailViewModel: ObservableObject {
    
    @Published var coinDetail: CoinDetail?
    
    init(id: String) {
        print("Coin Detail init")
        fetchCoinDetail(id: id)
    }
    
    init(forPreviews: CoinDetail?) {
        self.coinDetail = forPreviews
    }
    
    func fetchCoinDetail(id: String) {
        NetworkManager.shared.getCoinDetail(id: id) { coinDetail in
            DispatchQueue.main.async {
                self.coinDetail = coinDetail
            }
        }
    }
}
