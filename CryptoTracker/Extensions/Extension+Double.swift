//
//  Extension+Double.swift
//  CryptoTracker
//
//  Created by Даниил Соловьев on 22/08/2024.
//

import Foundation

extension Double {

    func toPriceString() -> String {
        return NumberFormatter.priceFormatter.string(for: self) ?? "—"
    }
}
