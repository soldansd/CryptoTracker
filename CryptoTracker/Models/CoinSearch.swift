//
//  CoinSearch.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 26/08/2024.
//

import Foundation

// MARK: - This model is used to get all available coins from API and search a particular coin
struct CoinSearch: Identifiable, Decodable {
    let id: String
    let symbol: String
    let name: String
}
